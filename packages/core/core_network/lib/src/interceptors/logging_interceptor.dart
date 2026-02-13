import 'dart:developer' as developer;

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

/// Interceptor that logs HTTP request/response details in debug mode.
///
/// Logs: method, URL, status code, and duration.
class LoggingInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (kDebugMode) {
      _log('--> ${options.method} ${options.uri}');
    }
    // Stash the request start time for duration calculation.
    options.extra['_requestStartTime'] =
        DateTime.now().millisecondsSinceEpoch;
    handler.next(options);
  }

  @override
  void onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) {
    if (kDebugMode) {
      final duration = _elapsed(response.requestOptions);
      _log(
        '<-- ${response.statusCode} '
        '${response.requestOptions.method} '
        '${response.requestOptions.uri} '
        '(${duration}ms)',
      );
    }
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (kDebugMode) {
      final duration = _elapsed(err.requestOptions);
      _log(
        '<-- ERROR ${err.response?.statusCode ?? 'N/A'} '
        '${err.requestOptions.method} '
        '${err.requestOptions.uri} '
        '(${duration}ms) '
        '${err.message ?? ''}',
      );
    }
    handler.next(err);
  }

  int _elapsed(RequestOptions options) {
    final start = options.extra['_requestStartTime'] as int? ?? 0;
    if (start == 0) return 0;
    return DateTime.now().millisecondsSinceEpoch - start;
  }

  void _log(String message) {
    developer.log(message, name: 'PlaneAPI');
  }
}
