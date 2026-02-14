import 'package:core_foundation/core_foundation.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('StringExtensions', () {
    group('capitalize', () {
      test('capitalizes first character', () {
        expect('hello'.capitalize(), 'Hello');
      });

      test('returns empty string for empty input', () {
        expect(''.capitalize(), '');
      });

      test('handles single character', () {
        expect('a'.capitalize(), 'A');
      });

      test('handles already capitalized', () {
        expect('Hello'.capitalize(), 'Hello');
      });
    });

    group('truncate', () {
      test('truncates long string', () {
        expect('hello world'.truncate(5), 'hello...');
      });

      test('does not truncate short string', () {
        expect('hi'.truncate(5), 'hi');
      });

      test('returns same string at exact length', () {
        expect('hello'.truncate(5), 'hello');
      });

      test('uses custom ellipsis', () {
        expect(
          'hello world'.truncate(5, ellipsis: '~'),
          'hello~',
        );
      });
    });
  });
}
