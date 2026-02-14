import 'package:core_network/core_network.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CursorPage', () {
    test('stores items and pagination metadata', () {
      final page = CursorPage<String>(
        items: const ['a', 'b', 'c'],
        hasMore: true,
        nextCursor: '100:1:0',
        previousCursor: '100:0:1',
        totalCount: 42,
      );
      expect(page.items, ['a', 'b', 'c']);
      expect(page.hasMore, isTrue);
      expect(page.nextCursor, '100:1:0');
      expect(page.previousCursor, '100:0:1');
      expect(page.totalCount, 42);
    });

    test('empty() returns empty page', () {
      final page = CursorPage.empty<int>();
      expect(page.items, isEmpty);
      expect(page.hasMore, isFalse);
      expect(page.nextCursor, isNull);
      expect(page.previousCursor, isNull);
      expect(page.totalCount, isNull);
    });
  });

  group('CursorPageParser', () {
    test('parses valid paginated response', () {
      final json = <String, dynamic>{
        'results': [
          {'id': '1', 'name': 'First'},
          {'id': '2', 'name': 'Second'},
        ],
        'next_page_results': true,
        'next_cursor': '100:1:0',
        'prev_cursor': '100:0:1',
        'total_count': 10,
      };

      final page = CursorPageParser.parse<Map<String, dynamic>>(
        json,
        (item) => item,
      );

      expect(page.items, hasLength(2));
      expect(page.hasMore, isTrue);
      expect(page.nextCursor, '100:1:0');
      expect(page.previousCursor, '100:0:1');
      expect(page.totalCount, 10);
    });

    test('parses empty results', () {
      final json = <String, dynamic>{
        'results': <dynamic>[],
        'next_page_results': false,
        'total_count': 0,
      };

      final page = CursorPageParser.parse<Map<String, dynamic>>(
        json,
        (item) => item,
      );

      expect(page.items, isEmpty);
      expect(page.hasMore, isFalse);
      expect(page.totalCount, 0);
    });

    test('handles missing results key', () {
      final json = <String, dynamic>{
        'next_page_results': false,
      };

      final page = CursorPageParser.parse<Map<String, dynamic>>(
        json,
        (item) => item,
      );

      expect(page.items, isEmpty);
      expect(page.hasMore, isFalse);
    });

    test('applies fromJson correctly', () {
      final json = <String, dynamic>{
        'results': [
          {'value': 42},
        ],
        'next_page_results': false,
      };

      final page = CursorPageParser.parse<int>(
        json,
        (item) => item['value'] as int,
      );

      expect(page.items, [42]);
    });
  });
}
