import 'package:core_network/core_network.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ApiException hierarchy', () {
    test('ServerException stores message and statusCode', () {
      const e = ServerException(message: 'Internal error', statusCode: 500);
      expect(e.message, 'Internal error');
      expect(e.statusCode, 500);
      expect(e.describeType(), 'ServerException');
    });

    test('NetworkException has null statusCode', () {
      const e = NetworkException(message: 'No internet');
      expect(e.statusCode, isNull);
      expect(e.describeType(), 'NetworkException');
    });

    test('NetworkException stores originalError', () {
      final originalErr = Exception('DNS failure');
      final e = NetworkException(
        message: 'No internet',
        originalError: originalErr,
      );
      expect(e.originalError, originalErr);
    });

    test('RateLimitException defaults to 429', () {
      const e = RateLimitException(message: 'Too many requests');
      expect(e.statusCode, 429);
      expect(e.retryAfterSeconds, isNull);
      expect(e.describeType(), 'RateLimitException');
    });

    test('RateLimitException stores retryAfterSeconds', () {
      const e = RateLimitException(
        message: 'Too many requests',
        retryAfterSeconds: 30,
      );
      expect(e.retryAfterSeconds, 30);
    });

    test('UnauthorizedException defaults to 401', () {
      const e = UnauthorizedException(message: 'Forbidden');
      expect(e.statusCode, 401);
      expect(e.describeType(), 'UnauthorizedException');
    });

    test('BadRequestException defaults to 400', () {
      const e = BadRequestException(
        message: 'Invalid',
        errors: {'name': 'required'},
      );
      expect(e.statusCode, 400);
      expect(e.errors, {'name': 'required'});
      expect(e.describeType(), 'BadRequestException');
    });

    test('NotFoundException defaults to 404', () {
      const e = NotFoundException(message: 'Not found');
      expect(e.statusCode, 404);
      expect(e.describeType(), 'NotFoundException');
    });

    test('toString includes type and details', () {
      const e = ServerException(message: 'fail', statusCode: 500);
      final str = e.toString();
      expect(str, contains('ServerException'));
      expect(str, contains('500'));
      expect(str, contains('fail'));
    });
  });
}
