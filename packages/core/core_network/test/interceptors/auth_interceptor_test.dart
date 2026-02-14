import 'package:core_network/core_network.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockSecureTokenStorage extends Mock implements SecureTokenStorage {}

void main() {
  late MockSecureTokenStorage mockStorage;
  late PlaneAuthInterceptor interceptor;
  late Dio dio;

  setUp(() {
    mockStorage = MockSecureTokenStorage();
    interceptor = PlaneAuthInterceptor(mockStorage);
    dio = Dio(BaseOptions(baseUrl: 'https://api.test.com'));
    dio.interceptors.add(interceptor);
  });

  group('PlaneAuthInterceptor', () {
    test('adds X-API-Key header when key exists', () async {
      when(() => mockStorage.getApiKey())
          .thenAnswer((_) async => 'plane_api_test123');

      // Use a custom interceptor to capture the request options after auth
      RequestOptions? capturedOptions;
      dio.interceptors.add(
        InterceptorsWrapper(
          onRequest: (options, handler) {
            capturedOptions = options;
            handler.reject(
              DioException(
                requestOptions: options,
                type: DioExceptionType.cancel,
              ),
            );
          },
        ),
      );

      try {
        await dio.get<void>('/test');
      } catch (_) {}

      expect(capturedOptions, isNotNull);
      expect(capturedOptions!.headers['X-API-Key'], 'plane_api_test123');
    });

    test('does not add header when key is null', () async {
      when(() => mockStorage.getApiKey()).thenAnswer((_) async => null);

      RequestOptions? capturedOptions;
      dio.interceptors.add(
        InterceptorsWrapper(
          onRequest: (options, handler) {
            capturedOptions = options;
            handler.reject(
              DioException(
                requestOptions: options,
                type: DioExceptionType.cancel,
              ),
            );
          },
        ),
      );

      try {
        await dio.get<void>('/test');
      } catch (_) {}

      expect(capturedOptions, isNotNull);
      expect(capturedOptions!.headers.containsKey('X-API-Key'), isFalse);
    });

    test('does not add header when key is empty', () async {
      when(() => mockStorage.getApiKey()).thenAnswer((_) async => '');

      RequestOptions? capturedOptions;
      dio.interceptors.add(
        InterceptorsWrapper(
          onRequest: (options, handler) {
            capturedOptions = options;
            handler.reject(
              DioException(
                requestOptions: options,
                type: DioExceptionType.cancel,
              ),
            );
          },
        ),
      );

      try {
        await dio.get<void>('/test');
      } catch (_) {}

      expect(capturedOptions, isNotNull);
      expect(capturedOptions!.headers.containsKey('X-API-Key'), isFalse);
    });
  });
}
