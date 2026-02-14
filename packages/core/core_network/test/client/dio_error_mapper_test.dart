import 'package:core_network/core_network.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('DioErrorMapper', () {
    test('maps connectionTimeout to NetworkException', () {
      final error = DioException(
        type: DioExceptionType.connectionTimeout,
        requestOptions: RequestOptions(path: '/test'),
        message: 'Timeout',
      );
      final result = DioErrorMapper.mapDioError(error);
      expect(result, isA<NetworkException>());
      expect(result.message, 'Timeout');
    });

    test('maps sendTimeout to NetworkException', () {
      final error = DioException(
        type: DioExceptionType.sendTimeout,
        requestOptions: RequestOptions(path: '/test'),
      );
      final result = DioErrorMapper.mapDioError(error);
      expect(result, isA<NetworkException>());
    });

    test('maps receiveTimeout to NetworkException', () {
      final error = DioException(
        type: DioExceptionType.receiveTimeout,
        requestOptions: RequestOptions(path: '/test'),
      );
      final result = DioErrorMapper.mapDioError(error);
      expect(result, isA<NetworkException>());
    });

    test('maps connectionError to NetworkException', () {
      final error = DioException(
        type: DioExceptionType.connectionError,
        requestOptions: RequestOptions(path: '/test'),
      );
      final result = DioErrorMapper.mapDioError(error);
      expect(result, isA<NetworkException>());
    });

    test('maps cancel to NetworkException', () {
      final error = DioException(
        type: DioExceptionType.cancel,
        requestOptions: RequestOptions(path: '/test'),
      );
      final result = DioErrorMapper.mapDioError(error);
      expect(result, isA<NetworkException>());
      expect(result.message, 'Request cancelled');
    });

    test('maps badCertificate to NetworkException', () {
      final error = DioException(
        type: DioExceptionType.badCertificate,
        requestOptions: RequestOptions(path: '/test'),
      );
      final result = DioErrorMapper.mapDioError(error);
      expect(result, isA<NetworkException>());
      expect(result.message, 'Bad SSL certificate');
    });

    test('maps unknown to NetworkException', () {
      final error = DioException(
        type: DioExceptionType.unknown,
        requestOptions: RequestOptions(path: '/test'),
        message: 'Unknown error',
      );
      final result = DioErrorMapper.mapDioError(error);
      expect(result, isA<NetworkException>());
    });

    test('maps 400 to BadRequestException', () {
      final error = DioException(
        type: DioExceptionType.badResponse,
        requestOptions: RequestOptions(path: '/test'),
        response: Response(
          statusCode: 400,
          data: {'detail': 'Bad request'},
          requestOptions: RequestOptions(path: '/test'),
        ),
      );
      final result = DioErrorMapper.mapDioError(error);
      expect(result, isA<BadRequestException>());
      expect(result.statusCode, 400);
      expect(result.message, 'Bad request');
    });

    test('maps 401 to UnauthorizedException', () {
      final error = DioException(
        type: DioExceptionType.badResponse,
        requestOptions: RequestOptions(path: '/test'),
        response: Response(
          statusCode: 401,
          data: {'detail': 'Unauthorized'},
          requestOptions: RequestOptions(path: '/test'),
        ),
      );
      final result = DioErrorMapper.mapDioError(error);
      expect(result, isA<UnauthorizedException>());
    });

    test('maps 403 to UnauthorizedException', () {
      final error = DioException(
        type: DioExceptionType.badResponse,
        requestOptions: RequestOptions(path: '/test'),
        response: Response(
          statusCode: 403,
          data: {'detail': 'Forbidden'},
          requestOptions: RequestOptions(path: '/test'),
        ),
      );
      final result = DioErrorMapper.mapDioError(error);
      expect(result, isA<UnauthorizedException>());
    });

    test('maps 404 to NotFoundException', () {
      final error = DioException(
        type: DioExceptionType.badResponse,
        requestOptions: RequestOptions(path: '/test'),
        response: Response(
          statusCode: 404,
          data: {'detail': 'Not found'},
          requestOptions: RequestOptions(path: '/test'),
        ),
      );
      final result = DioErrorMapper.mapDioError(error);
      expect(result, isA<NotFoundException>());
    });

    test('maps 429 to RateLimitException', () {
      final error = DioException(
        type: DioExceptionType.badResponse,
        requestOptions: RequestOptions(path: '/test'),
        response: Response(
          statusCode: 429,
          data: {'detail': 'Rate limit exceeded'},
          requestOptions: RequestOptions(path: '/test'),
          headers: Headers.fromMap({
            'Retry-After': ['30'],
          }),
        ),
      );
      final result = DioErrorMapper.mapDioError(error);
      expect(result, isA<RateLimitException>());
      expect((result as RateLimitException).retryAfterSeconds, 30);
    });

    test('maps 500 to ServerException', () {
      final error = DioException(
        type: DioExceptionType.badResponse,
        requestOptions: RequestOptions(path: '/test'),
        response: Response(
          statusCode: 500,
          data: {'detail': 'Internal server error'},
          requestOptions: RequestOptions(path: '/test'),
        ),
      );
      final result = DioErrorMapper.mapDioError(error);
      expect(result, isA<ServerException>());
      expect(result.statusCode, 500);
    });

    test('unwraps ApiException from DioException.error', () {
      const wrapped = NotFoundException(message: 'Already mapped');
      final error = DioException(
        type: DioExceptionType.unknown,
        requestOptions: RequestOptions(path: '/test'),
        error: wrapped,
      );
      final result = DioErrorMapper.mapDioError(error);
      expect(result, same(wrapped));
    });

    test('extracts message from string response data', () {
      final error = DioException(
        type: DioExceptionType.badResponse,
        requestOptions: RequestOptions(path: '/test'),
        response: Response(
          statusCode: 500,
          data: 'String error message',
          requestOptions: RequestOptions(path: '/test'),
        ),
      );
      final result = DioErrorMapper.mapDioError(error);
      expect(result.message, 'String error message');
    });
  });
}
