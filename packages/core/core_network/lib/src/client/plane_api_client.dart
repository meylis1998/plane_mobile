import 'package:core_network/src/client/dio_error_mapper.dart';
import 'package:core_network/src/interceptors/auth_interceptor.dart';
import 'package:core_network/src/interceptors/logging_interceptor.dart';
import 'package:core_network/src/interceptors/rate_limit_interceptor.dart';
import 'package:core_network/src/interceptors/retry_interceptor.dart';
import 'package:core_network/src/models/api_response.dart';
import 'package:core_network/src/models/secure_storage.dart';
import 'package:core_network/src/pagination/cursor_page.dart';
import 'package:core_network/src/pagination/cursor_page_parser.dart';
import 'package:dio/dio.dart';

/// HTTP client for the Plane REST API.
///
/// Wraps [Dio] with auth, retry, rate-limit, and logging interceptors.
///
/// ```dart
/// final client = PlaneApiClient(
///   baseUrl: 'https://api.plane.so',
///   tokenStorage: mySecureStorage,
/// );
///
/// final response = await client.get<Map<String, dynamic>>(
///   '/api/v1/workspaces/',
/// );
/// ```
class PlaneApiClient {
  PlaneApiClient({
    required String baseUrl,
    required SecureTokenStorage tokenStorage,
    Dio? dio,
    List<Interceptor>? extraInterceptors,
  }) : _dio = dio ??
            Dio(
              BaseOptions(
                baseUrl: baseUrl,
                connectTimeout: const Duration(seconds: 15),
                receiveTimeout: const Duration(seconds: 20),
                headers: {
                  'Content-Type': 'application/json',
                  'Accept': 'application/json',
                },
              ),
            ) {
    _dio.interceptors.addAll([
      PlaneAuthInterceptor(tokenStorage),
      RateLimitInterceptor(),
      RetryInterceptor(),
      LoggingInterceptor(),
      if (extraInterceptors != null) ...extraInterceptors,
    ]);
  }

  final Dio _dio;

  /// Exposes the underlying [Dio] instance for advanced use cases.
  Dio get dio => _dio;

  // -----------------------------------------------------------------
  // HTTP verbs
  // -----------------------------------------------------------------

  /// Sends a GET request and returns a typed [ApiResponse].
  Future<ApiResponse<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) async {
    return _request<T>(
      () => _dio.get<T>(
        path,
        queryParameters: queryParameters,
      ),
    );
  }

  /// Sends a POST request.
  Future<ApiResponse<T>> post<T>(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
  }) async {
    return _request<T>(
      () => _dio.post<T>(
        path,
        data: data,
        queryParameters: queryParameters,
      ),
    );
  }

  /// Sends a PATCH request.
  Future<ApiResponse<T>> patch<T>(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
  }) async {
    return _request<T>(
      () => _dio.patch<T>(
        path,
        data: data,
        queryParameters: queryParameters,
      ),
    );
  }

  /// Sends a PUT request.
  Future<ApiResponse<T>> put<T>(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
  }) async {
    return _request<T>(
      () => _dio.put<T>(
        path,
        data: data,
        queryParameters: queryParameters,
      ),
    );
  }

  /// Sends a DELETE request.
  Future<ApiResponse<T>> delete<T>(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
  }) async {
    return _request<T>(
      () => _dio.delete<T>(
        path,
        data: data,
        queryParameters: queryParameters,
      ),
    );
  }

  // -----------------------------------------------------------------
  // Pagination helper
  // -----------------------------------------------------------------

  /// Fetches a cursor-paginated endpoint and parses into a
  /// [CursorPage].
  ///
  /// [fromJson] deserializes each item in the `results` array.
  Future<CursorPage<T>> getPaginated<T>(
    String path, {
    required T Function(Map<String, dynamic>) fromJson,
    Map<String, dynamic>? queryParameters,
  }) async {
    final response = await get<Map<String, dynamic>>(
      path,
      queryParameters: queryParameters,
    );
    return CursorPageParser.parse<T>(response.data, fromJson);
  }

  // -----------------------------------------------------------------
  // Multipart upload
  // -----------------------------------------------------------------

  /// Uploads a file via multipart POST.
  Future<ApiResponse<T>> uploadFile<T>(
    String path, {
    required FormData formData,
    void Function(int, int)? onSendProgress,
  }) async {
    return _request<T>(
      () => _dio.post<T>(
        path,
        data: formData,
        onSendProgress: onSendProgress,
        options: Options(
          headers: {'Content-Type': 'multipart/form-data'},
        ),
      ),
    );
  }

  // -----------------------------------------------------------------
  // Internal
  // -----------------------------------------------------------------

  Future<ApiResponse<T>> _request<T>(
    Future<Response<T>> Function() request,
  ) async {
    try {
      final response = await request();
      return ApiResponse<T>(
        data: response.data as T,
        statusCode: response.statusCode ?? 200,
        headers: _flattenHeaders(response.headers),
      );
    } on DioException catch (e) {
      throw DioErrorMapper.mapDioError(e);
    }
  }

  Map<String, String> _flattenHeaders(Headers headers) {
    final flat = <String, String>{};
    headers.forEach((name, values) {
      if (values.isNotEmpty) {
        flat[name.toLowerCase()] = values.first;
      }
    });
    return flat;
  }
}
