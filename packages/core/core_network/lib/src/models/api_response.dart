/// A typed wrapper around API responses.
///
/// Encapsulates the deserialized body along with HTTP metadata.
class ApiResponse<T> {
  const ApiResponse({
    required this.data,
    required this.statusCode,
    this.headers = const {},
  });

  /// Deserialized response body.
  final T data;

  /// HTTP status code.
  final int statusCode;

  /// Response headers (lowercase keys).
  final Map<String, String> headers;

  /// Whether the HTTP status code indicates success (2xx).
  bool get isSuccess => statusCode >= 200 && statusCode < 300;
}
