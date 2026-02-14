import 'package:core_foundation/core_foundation.dart';
import 'package:core_network/core_network.dart';

/// Maps [ApiException] instances to domain [Failure] types.
class ExceptionMapper {
  const ExceptionMapper._();

  static Failure mapApiException(ApiException exception) {
    return switch (exception) {
      NetworkException() => NetworkFailure(exception.message),
      UnauthorizedException() => ServerFailure(
          exception.message,
          statusCode: exception.statusCode,
        ),
      NotFoundException() => ServerFailure(
          exception.message,
          statusCode: exception.statusCode,
        ),
      BadRequestException(:final errors) => ValidationFailure(
          exception.message,
          fieldErrors: errors?.map(
            (key, value) => MapEntry(key, value.toString()),
          ),
        ),
      RateLimitException() => ServerFailure(
          exception.message,
          statusCode: exception.statusCode,
        ),
      ServerException() => ServerFailure(
          exception.message,
          statusCode: exception.statusCode,
        ),
    };
  }

  static Failure mapException(Object error) {
    if (error is ApiException) return mapApiException(error);
    return CacheFailure(error.toString());
  }
}
