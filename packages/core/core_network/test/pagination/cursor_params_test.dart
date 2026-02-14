import 'package:core_network/core_network.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CursorParams', () {
    test('defaults', () {
      const params = CursorParams();
      expect(params.pageSize, 100);
      expect(params.offset, 0);
      expect(params.isPrev, isFalse);
    });

    test('encode produces correct format', () {
      const params = CursorParams(pageSize: 50, offset: 2);
      expect(params.encode(), '50:2:0');
    });

    test('encode with isPrev', () {
      const params = CursorParams(pageSize: 50, offset: 1, isPrev: true);
      expect(params.encode(), '50:1:1');
    });

    test('toQueryParameters', () {
      const params = CursorParams(pageSize: 25, offset: 3);
      expect(params.toQueryParameters(), {'cursor': '25:3:0'});
    });

    test('decode valid cursor', () {
      final params = CursorParams.decode('100:2:0');
      expect(params, isNotNull);
      expect(params!.pageSize, 100);
      expect(params.offset, 2);
      expect(params.isPrev, isFalse);
    });

    test('decode with isPrev', () {
      final params = CursorParams.decode('50:1:1');
      expect(params, isNotNull);
      expect(params!.isPrev, isTrue);
    });

    test('decode invalid format returns null', () {
      expect(CursorParams.decode('invalid'), isNull);
      expect(CursorParams.decode('100:2'), isNull);
      expect(CursorParams.decode(''), isNull);
    });

    test('decode clamps pageSize to 1-100', () {
      final params = CursorParams.decode('200:0:0');
      expect(params!.pageSize, 100);

      final params2 = CursorParams.decode('0:0:0');
      expect(params2!.pageSize, 1);
    });

    test('nextPage increments offset', () {
      const params = CursorParams(pageSize: 50, offset: 2);
      final next = params.nextPage();
      expect(next.offset, 3);
      expect(next.pageSize, 50);
      expect(next.isPrev, isFalse);
    });

    test('previousPage decrements offset', () {
      const params = CursorParams(pageSize: 50, offset: 2);
      final prev = params.previousPage();
      expect(prev, isNotNull);
      expect(prev!.offset, 1);
      expect(prev.isPrev, isTrue);
    });

    test('previousPage returns null at offset 0', () {
      const params = CursorParams(pageSize: 50);
      expect(params.previousPage(), isNull);
    });
  });
}
