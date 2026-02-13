import 'package:core_network/src/models/api_exception.dart';
import 'package:dio/dio.dart';

/// Maps [DioException]s to typed [ApiException]s.
class DioErrorMapper {
  const DioErrorMapper._();

  static ApiException mapDioError(DioException error) {
    // If the error already wraps an ApiException
    // (e.g. from RateLimitInterceptor), unwrap it.
    if (error.error is ApiException) {
      return error.error! as ApiException;
    }

    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.connectionError:
        return NetworkException(
          message: error.message ?? 'Connection failed',
          originalError: error,
        );

      case DioExceptionType.badResponse:
        return _mapStatusCode(error);

      case DioExceptionType.cancel:
        return const NetworkException(message: 'Request cancelled');

      case DioExceptionType.badCertificate:
        return const NetworkException(
          message: 'Bad SSL certificate',
        );

      case DioExceptionType.unknown:
        return NetworkException(
          message: error.message ??
              'An unknown network error occurred',
          originalError: error.error,
        );
    }
  }

  static ApiException _mapStatusCode(DioException error) {
    final statusCode = error.response?.statusCode;
    final data = error.response?.data;
    final message = _extractMessage(data) ??
        error.message ??
        'Request failed with status $statusCode';

    if (statusCode == null) {
      return ServerException(message: message);
    }

    return switch (statusCode) {
      400 => BadRequestException(
          message: message,
          statusCode: statusCode,
          errors: data is Map<String, dynamic> ? data : null,
        ),
      401 || 403 => UnauthorizedException(
          message: message,
          statusCode: statusCode,
        ),
      404 => NotFoundException(
          message: message,
          statusCode: statusCode,
        ),
      429 => RateLimitException(
          message: message,
          retryAfterSeconds: _extractRetryAfter(error),
        ),
      >= 500 => ServerException(
          message: message,
          statusCode: statusCode,
        ),
      _ => ServerException(
          message: message,
          statusCode: statusCode,
        ),
    };
  }

  static String? _extractMessage(dynamic data) {
    if (data is Map<String, dynamic>) {
      // Plane API often returns {"detail": "..."} for errors.
      return data['detail'] as String? ??
          data['message'] as String?;
    }
    if (data is String && data.isNotEmpty) {
      return data;
    }
    return null;
  }

  static int? _extractRetryAfter(DioException error) {
    final header =
        error.response?.headers.value('Retry-After');
    if (header != null) return int.tryParse(header);
    return null;
  }
}
