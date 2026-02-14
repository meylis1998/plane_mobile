import 'package:core_foundation/core_foundation.dart';
import 'package:core_network/core_network.dart';
import 'package:data_repository/src/mappers/exception_mapper.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ExceptionMapper', () {
    test('maps NetworkException to NetworkFailure', () {
      const exception = NetworkException(message: 'No internet');
      final failure = ExceptionMapper.mapApiException(exception);
      expect(failure, isA<NetworkFailure>());
      expect(failure.message, 'No internet');
    });

    test('maps UnauthorizedException to ServerFailure', () {
      const exception =
          UnauthorizedException(message: 'Unauthorized', statusCode: 401);
      final failure = ExceptionMapper.mapApiException(exception);
      expect(failure, isA<ServerFailure>());
      expect((failure as ServerFailure).statusCode, 401);
    });

    test('maps NotFoundException to ServerFailure', () {
      const exception =
          NotFoundException(message: 'Not found', statusCode: 404);
      final failure = ExceptionMapper.mapApiException(exception);
      expect(failure, isA<ServerFailure>());
      expect((failure as ServerFailure).statusCode, 404);
    });

    test('maps BadRequestException to ValidationFailure', () {
      const exception = BadRequestException(
        message: 'Invalid',
        errors: {'name': 'required'},
      );
      final failure = ExceptionMapper.mapApiException(exception);
      expect(failure, isA<ValidationFailure>());
      expect((failure as ValidationFailure).fieldErrors, {'name': 'required'});
    });

    test('maps RateLimitException to ServerFailure', () {
      const exception = RateLimitException(message: 'Too many requests');
      final failure = ExceptionMapper.mapApiException(exception);
      expect(failure, isA<ServerFailure>());
      expect((failure as ServerFailure).statusCode, 429);
    });

    test('maps ServerException to ServerFailure', () {
      const exception =
          ServerException(message: 'Internal error', statusCode: 500);
      final failure = ExceptionMapper.mapApiException(exception);
      expect(failure, isA<ServerFailure>());
      expect((failure as ServerFailure).statusCode, 500);
    });

    test('mapException handles ApiException', () {
      const exception = ServerException(message: 'fail');
      final failure = ExceptionMapper.mapException(exception);
      expect(failure, isA<ServerFailure>());
    });

    test('mapException handles non-API exceptions', () {
      final exception = Exception('generic error');
      final failure = ExceptionMapper.mapException(exception);
      expect(failure, isA<CacheFailure>());
    });
  });
}
