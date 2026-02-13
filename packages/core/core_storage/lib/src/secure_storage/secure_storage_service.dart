import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageService {
  SecureStorageService({FlutterSecureStorage? storage})
      : _storage = storage ?? const FlutterSecureStorage();

  final FlutterSecureStorage _storage;

  static const _apiKeyKey = 'plane_api_key';
  static const _baseUrlKey = 'plane_base_url';

  // API Key

  Future<String?> getApiKey() => _storage.read(key: _apiKeyKey);

  Future<void> setApiKey(String value) =>
      _storage.write(key: _apiKeyKey, value: value);

  Future<void> deleteApiKey() => _storage.delete(key: _apiKeyKey);

  // Base URL

  Future<String?> getBaseUrl() => _storage.read(key: _baseUrlKey);

  Future<void> setBaseUrl(String value) =>
      _storage.write(key: _baseUrlKey, value: value);

  Future<void> deleteBaseUrl() => _storage.delete(key: _baseUrlKey);

  // Clear all

  Future<void> clear() => _storage.deleteAll();
}
