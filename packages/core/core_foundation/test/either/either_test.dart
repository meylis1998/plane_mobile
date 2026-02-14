import 'package:core_foundation/core_foundation.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Right', () {
    test('isRight returns true', () {
      const result = Right<String, int>(42);
      expect(result.isRight, isTrue);
      expect(result.isLeft, isFalse);
    });

    test('fold calls onRight', () {
      const result = Right<String, int>(42);
      final folded = result.fold((_) => 'left', (r) => 'right:$r');
      expect(folded, 'right:42');
    });

    test('map transforms the value', () {
      const result = Right<String, int>(10);
      final mapped = result.map((r) => r * 2);
      expect(mapped, isA<Right<String, int>>());
      expect((mapped as Right<String, int>).value, 20);
    });

    test('mapLeft is a no-op', () {
      const result = Right<String, int>(10);
      final mapped = result.mapLeft((l) => l.toUpperCase());
      expect(mapped, isA<Right<String, int>>());
      expect((mapped as Right<String, int>).value, 10);
    });

    test('flatMap applies the function', () {
      const result = Right<String, int>(10);
      final flatMapped = result.flatMap((r) => Right(r.toString()));
      expect(flatMapped, isA<Right<String, String>>());
      expect((flatMapped as Right<String, String>).value, '10');
    });

    test('flatMap can return Left', () {
      const result = Right<String, int>(10);
      final flatMapped = result.flatMap<int>((_) => const Left('error'));
      expect(flatMapped, isA<Left<String, int>>());
    });

    test('getOrNull returns value', () {
      const result = Right<String, int>(42);
      expect(result.getOrNull(), 42);
    });

    test('getOrElse returns value', () {
      const result = Right<String, int>(42);
      expect(result.getOrElse(() => 0), 42);
    });

    test('equality', () {
      const a = Right<String, int>(42);
      const b = Right<String, int>(42);
      const c = Right<String, int>(99);
      expect(a, equals(b));
      expect(a, isNot(equals(c)));
    });

    test('toString', () {
      const result = Right<String, int>(42);
      expect(result.toString(), 'Right(42)');
    });

    test('hashCode is consistent with equality', () {
      const a = Right<String, int>(42);
      const b = Right<String, int>(42);
      expect(a.hashCode, b.hashCode);
    });
  });

  group('Left', () {
    test('isLeft returns true', () {
      const result = Left<String, int>('error');
      expect(result.isLeft, isTrue);
      expect(result.isRight, isFalse);
    });

    test('fold calls onLeft', () {
      const result = Left<String, int>('error');
      final folded = result.fold((l) => 'left:$l', (_) => 'right');
      expect(folded, 'left:error');
    });

    test('map is a no-op', () {
      const result = Left<String, int>('error');
      final mapped = result.map((r) => r * 2);
      expect(mapped, isA<Left<String, int>>());
      expect((mapped as Left<String, int>).value, 'error');
    });

    test('mapLeft transforms the value', () {
      const result = Left<String, int>('error');
      final mapped = result.mapLeft((l) => l.toUpperCase());
      expect(mapped, isA<Left<String, int>>());
      expect((mapped as Left<String, int>).value, 'ERROR');
    });

    test('flatMap is a no-op', () {
      const result = Left<String, int>('error');
      final flatMapped = result.flatMap((r) => Right(r.toString()));
      expect(flatMapped, isA<Left<String, String>>());
    });

    test('getOrNull returns null', () {
      const result = Left<String, int>('error');
      expect(result.getOrNull(), isNull);
    });

    test('getOrElse returns default value', () {
      const result = Left<String, int>('error');
      expect(result.getOrElse(() => 99), 99);
    });

    test('equality', () {
      const a = Left<String, int>('error');
      const b = Left<String, int>('error');
      const c = Left<String, int>('other');
      expect(a, equals(b));
      expect(a, isNot(equals(c)));
    });

    test('toString', () {
      const result = Left<String, int>('error');
      expect(result.toString(), 'Left(error)');
    });
  });
}
