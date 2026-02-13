/// Exception classes for Plane API errors.
sealed class ApiException implements Exception {
  const ApiException({required this.message, this.statusCode});

  final String message;
  final int? statusCode;

  @override
  String toString() =>
      '${describeType()} (statusCode: $statusCode, message: $message)';

  /// Returns a human-readable type name without using
  /// `runtimeType.toString()`.
  String describeType() => 'ApiException';
}

/// Server-side error (5xx status codes).
final class ServerException extends ApiException {
  const ServerException({
    required super.message,
    super.statusCode,
  });

  @override
  String describeType() => 'ServerException';
}

/// Network connectivity error (no internet, DNS failure, etc.).
final class NetworkException extends ApiException {
  const NetworkException({
    required super.message,
    this.originalError,
  }) : super(statusCode: null);

  final Object? originalError;

  @override
  String describeType() => 'NetworkException';
}

/// Rate limit exceeded (HTTP 429).
final class RateLimitException extends ApiException {
  const RateLimitException({
    required super.message,
    super.statusCode = 429,
    this.retryAfterSeconds,
  });

  final int? retryAfterSeconds;

  @override
  String describeType() => 'RateLimitException';
}

/// Authentication failure (HTTP 401 / 403).
final class UnauthorizedException extends ApiException {
  const UnauthorizedException({
    required super.message,
    super.statusCode = 401,
  });

  @override
  String describeType() => 'UnauthorizedException';
}

/// Bad request (HTTP 400).
final class BadRequestException extends ApiException {
  const BadRequestException({
    required super.message,
    super.statusCode = 400,
    this.errors,
  });

  final Map<String, dynamic>? errors;

  @override
  String describeType() => 'BadRequestException';
}

/// Resource not found (HTTP 404).
final class NotFoundException extends ApiException {
  const NotFoundException({
    required super.message,
    super.statusCode = 404,
  });

  @override
  String describeType() => 'NotFoundException';
}
