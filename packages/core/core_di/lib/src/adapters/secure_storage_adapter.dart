import 'package:core_network/core_network.dart';
import 'package:core_storage/core_storage.dart';

/// Adapts [SecureStorageService] to the [SecureTokenStorage] interface
/// required by [PlaneApiClient].
class SecureStorageAdapter implements SecureTokenStorage {
  const SecureStorageAdapter(this._service);

  final SecureStorageService _service;

  @override
  Future<String?> getApiKey() => _service.getApiKey();

  @override
  Future<void> setApiKey(String apiKey) => _service.setApiKey(apiKey);

  @override
  Future<void> deleteApiKey() => _service.deleteApiKey();
}
