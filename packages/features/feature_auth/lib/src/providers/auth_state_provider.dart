import 'package:core_network/core_network.dart';
import 'package:core_storage/core_storage.dart';
import 'package:domain_core/domain_core.dart';
import 'package:feature_auth/src/models/auth_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_state_provider.g.dart';

@Riverpod(keepAlive: true)
class AuthStateNotifier extends _$AuthStateNotifier {
  @override
  AuthState build() {
    return const AuthState.unauthenticated();
  }

  /// Logs in with an API key and base URL.
  ///
  /// Validates the key by calling `GET /api/v1/workspaces/`. On success,
  /// persists credentials and transitions to [Authenticated].
  Future<void> login({
    required String apiKey,
    required String baseUrl,
  }) async {
    state = const AuthState.authenticating();

    try {
      final storage = ref.read(secureStorageServiceProvider);
      await storage.setApiKey(apiKey);
      await storage.setBaseUrl(baseUrl);

      final client = PlaneApiClient(
        baseUrl: baseUrl,
        tokenStorage: _StorageAdapter(storage),
      );

      final response = await client.get<Map<String, dynamic>>(
        '/api/v1/workspaces/',
      );

      final workspaces = _parseWorkspaces(response.data);
      state = AuthState.authenticated(workspaces: workspaces);
    } on ApiException catch (e) {
      state = AuthState.error(e.message);
    } on Exception catch (e) {
      state = AuthState.error('Connection failed: $e');
    }
  }

  /// Logs out by clearing stored credentials and resetting state.
  Future<void> logout() async {
    final storage = ref.read(secureStorageServiceProvider);
    await storage.clear();
    state = const AuthState.unauthenticated();
  }

  /// Checks if stored credentials are valid and restores the session.
  Future<void> checkAuth() async {
    final storage = ref.read(secureStorageServiceProvider);
    final apiKey = await storage.getApiKey();
    final baseUrl = await storage.getBaseUrl();

    if (apiKey == null || baseUrl == null) {
      state = const AuthState.unauthenticated();
      return;
    }

    state = const AuthState.authenticating();

    try {
      final client = PlaneApiClient(
        baseUrl: baseUrl,
        tokenStorage: _StorageAdapter(storage),
      );

      final response = await client.get<Map<String, dynamic>>(
        '/api/v1/workspaces/',
      );

      final workspaces = _parseWorkspaces(response.data);
      state = AuthState.authenticated(workspaces: workspaces);
    } on UnauthorizedException {
      await storage.clear();
      state = const AuthState.unauthenticated();
    } on ApiException catch (e) {
      state = AuthState.error(e.message);
    } on Exception catch (e) {
      state = AuthState.error('Connection failed: $e');
    }
  }

  List<Workspace> _parseWorkspaces(Map<String, dynamic> data) {
    final results = data['results'] as List<dynamic>?;
    if (results != null) {
      return results
          .map((item) => Workspace.fromJson(item as Map<String, dynamic>))
          .toList();
    }
    return const [];
  }
}

/// Adapter that bridges [SecureStorageService] to the
/// [SecureTokenStorage] interface required by [PlaneApiClient].
class _StorageAdapter implements SecureTokenStorage {
  const _StorageAdapter(this._storage);
  final SecureStorageService _storage;

  @override
  Future<String?> getApiKey() => _storage.getApiKey();

  @override
  Future<void> setApiKey(String apiKey) => _storage.setApiKey(apiKey);

  @override
  Future<void> deleteApiKey() => _storage.deleteApiKey();
}

@Riverpod(keepAlive: true)
SecureStorageService secureStorageService(Ref ref) {
  return SecureStorageService();
}
