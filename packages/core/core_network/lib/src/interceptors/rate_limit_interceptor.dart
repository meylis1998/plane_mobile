import 'dart:async';

import 'package:core_network/src/models/api_exception.dart';
import 'package:dio/dio.dart';

/// Interceptor that tracks and respects Plane API rate limits.
///
/// Reads `X-RateLimit-Remaining` and `X-RateLimit-Reset` response
/// headers. When the remaining quota is low, delays outgoing
/// requests to avoid hitting the limit. If the limit is exhausted,
/// rejects with a [RateLimitException].
class RateLimitInterceptor extends Interceptor {
  RateLimitInterceptor({
    this.cushionThreshold = 5,
  });

  /// When remaining requests fall to or below this number, the
  /// interceptor starts adding delays to spread traffic over the
  /// reset window.
  final int cushionThreshold;

  int? _remaining;
  DateTime? _resetTime;

  /// The last known remaining request count (for testing/debugging).
  int? get remaining => _remaining;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // If we know we are out of quota, reject immediately.
    if (_remaining != null &&
        _remaining! <= 0 &&
        _resetTime != null) {
      final now = DateTime.now();
      if (now.isBefore(_resetTime!)) {
        final retryAfter =
            _resetTime!.difference(now).inSeconds;
        return handler.reject(
          DioException(
            requestOptions: options,
            error: RateLimitException(
              message: 'Rate limit exceeded. '
                  'Retry after $retryAfter seconds.',
              retryAfterSeconds: retryAfter,
            ),
          ),
        );
      }
      // Reset window has passed; clear stale values.
      _remaining = null;
      _resetTime = null;
    }

    // If we are approaching the limit, add a delay.
    if (_remaining != null &&
        _remaining! <= cushionThreshold &&
        _remaining! > 0 &&
        _resetTime != null) {
      final now = DateTime.now();
      if (now.isBefore(_resetTime!)) {
        final windowMs =
            _resetTime!.difference(now).inMilliseconds;
        final delayMs = windowMs ~/ _remaining!;
        if (delayMs > 0) {
          await Future<void>.delayed(
            Duration(milliseconds: delayMs),
          );
        }
      }
    }

    handler.next(options);
  }

  @override
  void onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) {
    _updateFromHeaders(response.headers);
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.response != null) {
      _updateFromHeaders(err.response!.headers);
    }
    handler.next(err);
  }

  void _updateFromHeaders(Headers headers) {
    final remainingHeader =
        headers.value('X-RateLimit-Remaining');
    if (remainingHeader != null) {
      _remaining = int.tryParse(remainingHeader);
    }

    final resetHeader = headers.value('X-RateLimit-Reset');
    if (resetHeader != null) {
      final resetEpoch = int.tryParse(resetHeader);
      if (resetEpoch != null) {
        _resetTime = DateTime.fromMillisecondsSinceEpoch(
          resetEpoch * 1000,
        );
      }
    }
  }
}
