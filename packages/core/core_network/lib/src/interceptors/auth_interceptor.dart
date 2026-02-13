import 'package:core_network/src/models/secure_storage.dart';
import 'package:dio/dio.dart';

/// Interceptor that attaches the Plane API key to every outgoing
/// request.
///
/// Reads the key from [SecureTokenStorage] and sets the
/// `X-API-Key` header.
class PlaneAuthInterceptor extends Interceptor {
  PlaneAuthInterceptor(this._storage);

  final SecureTokenStorage _storage;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final apiKey = await _storage.getApiKey();
    if (apiKey != null && apiKey.isNotEmpty) {
      options.headers['X-API-Key'] = apiKey;
    }
    handler.next(options);
  }
}
