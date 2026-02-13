/// Abstract interface for secure credential storage.
///
/// This decouples the network layer from a concrete secure-storage
/// implementation (e.g. flutter_secure_storage), allowing consumers
/// to inject their own adapter.
abstract interface class SecureTokenStorage {
  /// Returns the stored API key, or `null` if none is set.
  Future<String?> getApiKey();

  /// Persists the given [apiKey].
  Future<void> setApiKey(String apiKey);

  /// Removes the stored API key.
  Future<void> deleteApiKey();
}
