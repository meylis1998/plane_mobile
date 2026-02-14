import 'package:core_foundation/core_foundation.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ServerFailure', () {
    test('stores message and statusCode', () {
      const failure = ServerFailure('Internal server error', statusCode: 500);
      expect(failure.message, 'Internal server error');
      expect(failure.statusCode, 500);
    });

    test('equality based on message and statusCode', () {
      const a = ServerFailure('error', statusCode: 500);
      const b = ServerFailure('error', statusCode: 500);
      const c = ServerFailure('error', statusCode: 404);
      expect(a, equals(b));
      expect(a, isNot(equals(c)));
    });

    test('toString includes runtimeType', () {
      const failure = ServerFailure('test');
      expect(failure.toString(), contains('ServerFailure'));
      expect(failure.toString(), contains('test'));
    });

    test('statusCode defaults to null', () {
      const failure = ServerFailure('error');
      expect(failure.statusCode, isNull);
    });
  });

  group('CacheFailure', () {
    test('stores message', () {
      const failure = CacheFailure('cache miss');
      expect(failure.message, 'cache miss');
    });

    test('equality based on message', () {
      const a = CacheFailure('cache miss');
      const b = CacheFailure('cache miss');
      expect(a, equals(b));
    });
  });

  group('NetworkFailure', () {
    test('stores message', () {
      const failure = NetworkFailure('no connection');
      expect(failure.message, 'no connection');
    });

    test('equality based on message', () {
      const a = NetworkFailure('no connection');
      const b = NetworkFailure('no connection');
      expect(a, equals(b));
    });
  });

  group('ValidationFailure', () {
    test('stores message and fieldErrors', () {
      const failure = ValidationFailure(
        'validation failed',
        fieldErrors: {'email': 'invalid'},
      );
      expect(failure.message, 'validation failed');
      expect(failure.fieldErrors, {'email': 'invalid'});
    });

    test('fieldErrors defaults to null', () {
      const failure = ValidationFailure('validation failed');
      expect(failure.fieldErrors, isNull);
    });

    test('equality includes fieldErrors', () {
      const a = ValidationFailure('e', fieldErrors: {'f': 'v'});
      const b = ValidationFailure('e', fieldErrors: {'f': 'v'});
      const c = ValidationFailure('e', fieldErrors: {'f': 'x'});
      expect(a, equals(b));
      expect(a, isNot(equals(c)));
    });
  });
}
