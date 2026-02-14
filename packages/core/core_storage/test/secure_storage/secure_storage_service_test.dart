import 'package:core_storage/core_storage.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockFlutterSecureStorage extends Mock implements FlutterSecureStorage {}

void main() {
  late MockFlutterSecureStorage mockStorage;
  late SecureStorageService service;

  setUp(() {
    mockStorage = MockFlutterSecureStorage();
    service = SecureStorageService(storage: mockStorage);
  });

  group('SecureStorageService', () {
    group('API Key', () {
      test('getApiKey delegates to flutter_secure_storage', () async {
        when(() => mockStorage.read(key: 'plane_api_key'))
            .thenAnswer((_) async => 'test_key');
        final result = await service.getApiKey();
        expect(result, 'test_key');
        verify(() => mockStorage.read(key: 'plane_api_key')).called(1);
      });

      test('setApiKey delegates to flutter_secure_storage', () async {
        when(() => mockStorage.write(key: 'plane_api_key', value: 'new_key'))
            .thenAnswer((_) async {});
        await service.setApiKey('new_key');
        verify(() => mockStorage.write(key: 'plane_api_key', value: 'new_key'))
            .called(1);
      });

      test('deleteApiKey delegates to flutter_secure_storage', () async {
        when(() => mockStorage.delete(key: 'plane_api_key'))
            .thenAnswer((_) async {});
        await service.deleteApiKey();
        verify(() => mockStorage.delete(key: 'plane_api_key')).called(1);
      });
    });

    group('Base URL', () {
      test('getBaseUrl delegates to flutter_secure_storage', () async {
        when(() => mockStorage.read(key: 'plane_base_url'))
            .thenAnswer((_) async => 'https://api.plane.so');
        final result = await service.getBaseUrl();
        expect(result, 'https://api.plane.so');
      });

      test('setBaseUrl delegates to flutter_secure_storage', () async {
        when(
          () => mockStorage.write(
            key: 'plane_base_url',
            value: 'https://custom.plane.so',
          ),
        ).thenAnswer((_) async {});
        await service.setBaseUrl('https://custom.plane.so');
        verify(
          () => mockStorage.write(
            key: 'plane_base_url',
            value: 'https://custom.plane.so',
          ),
        ).called(1);
      });

      test('deleteBaseUrl delegates to flutter_secure_storage', () async {
        when(() => mockStorage.delete(key: 'plane_base_url'))
            .thenAnswer((_) async {});
        await service.deleteBaseUrl();
        verify(() => mockStorage.delete(key: 'plane_base_url')).called(1);
      });
    });

    test('clear delegates to flutter_secure_storage', () async {
      when(() => mockStorage.deleteAll()).thenAnswer((_) async {});
      await service.clear();
      verify(() => mockStorage.deleteAll()).called(1);
    });
  });
}
