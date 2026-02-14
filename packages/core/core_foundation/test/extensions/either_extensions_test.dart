import 'package:core_foundation/core_foundation.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('EitherExtensions', () {
    test('leftOrNull returns left value for Left', () {
      const either = Left<String, int>('error');
      expect(either.leftOrNull, 'error');
    });

    test('leftOrNull returns null for Right', () {
      const either = Right<String, int>(42);
      expect(either.leftOrNull, isNull);
    });

    test('rightOrNull returns right value for Right', () {
      const either = Right<String, int>(42);
      expect(either.rightOrNull, 42);
    });

    test('rightOrNull returns null for Left', () {
      const either = Left<String, int>('error');
      expect(either.rightOrNull, isNull);
    });

    test('tap runs action for Right', () {
      var tapped = false;
      const either = Right<String, int>(42);
      final result = either.tap((_) => tapped = true);
      expect(tapped, isTrue);
      expect(result, same(either));
    });

    test('tap does not run action for Left', () {
      var tapped = false;
      const either = Left<String, int>('error');
      final result = either.tap((_) => tapped = true);
      expect(tapped, isFalse);
      expect(result, same(either));
    });

    test('tapLeft runs action for Left', () {
      var tapped = false;
      const either = Left<String, int>('error');
      final result = either.tapLeft((_) => tapped = true);
      expect(tapped, isTrue);
      expect(result, same(either));
    });

    test('tapLeft does not run action for Right', () {
      var tapped = false;
      const either = Right<String, int>(42);
      final result = either.tapLeft((_) => tapped = true);
      expect(tapped, isFalse);
      expect(result, same(either));
    });
  });

  group('FutureEitherExtensions', () {
    test('foldAsync resolves Right', () async {
      final future = Future.value(const Right<String, int>(42));
      final result = await future.foldAsync(
        (l) => 'left:$l',
        (r) => 'right:$r',
      );
      expect(result, 'right:42');
    });

    test('foldAsync resolves Left', () async {
      final future = Future.value(const Left<String, int>('error'));
      final result = await future.foldAsync(
        (l) => 'left:$l',
        (r) => 'right:$r',
      );
      expect(result, 'left:error');
    });

    test('mapAsync transforms Right', () async {
      final future = Future.value(const Right<String, int>(10));
      final result = await future.mapAsync((r) => r * 2);
      expect(result, isA<Right<String, int>>());
      expect((result as Right<String, int>).value, 20);
    });

    test('mapAsync preserves Left', () async {
      final future = Future.value(const Left<String, int>('error'));
      final result = await future.mapAsync((r) => r * 2);
      expect(result, isA<Left<String, int>>());
    });
  });
}
