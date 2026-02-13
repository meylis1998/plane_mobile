import 'dart:async';

import 'package:dio/dio.dart';

/// Interceptor that retries failed requests on server errors (5xx)
/// and connection timeouts using exponential backoff.
///
/// Default: max 3 retries with delays of 1s, 2s, 4s.
class RetryInterceptor extends Interceptor {
  RetryInterceptor({
    this.maxRetries = 3,
    this.baseDelay = const Duration(seconds: 1),
  });

  /// Maximum number of retry attempts.
  final int maxRetries;

  /// Base delay for exponential backoff; doubles on each retry.
  final Duration baseDelay;

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    if (!_shouldRetry(err)) {
      return handler.next(err);
    }

    final retryCount = _getRetryCount(err.requestOptions);
    if (retryCount >= maxRetries) {
      return handler.next(err);
    }

    final delay = baseDelay * (1 << retryCount); // 1s, 2s, 4s, ...
    await Future<void>.delayed(delay);

    try {
      err.requestOptions.extra['retryCount'] = retryCount + 1;

      // Clone the request and retry via a fresh Dio call.
      final dio = Dio()..options.baseUrl = err.requestOptions.baseUrl;
      final response = await dio.fetch<dynamic>(err.requestOptions);
      return handler.resolve(response);
    } on DioException catch (e) {
      return handler.next(e);
    }
  }

  bool _shouldRetry(DioException err) {
    // Retry on connection timeout or send timeout.
    if (err.type == DioExceptionType.connectionTimeout ||
        err.type == DioExceptionType.sendTimeout ||
        err.type == DioExceptionType.receiveTimeout ||
        err.type == DioExceptionType.connectionError) {
      return true;
    }

    // Retry on 5xx server errors.
    final statusCode = err.response?.statusCode;
    if (statusCode != null && statusCode >= 500) {
      return true;
    }

    return false;
  }

  int _getRetryCount(RequestOptions options) {
    return options.extra['retryCount'] as int? ?? 0;
  }
}
