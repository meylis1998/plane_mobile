import 'package:core_foundation/core_foundation.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('DateTimeExtensions', () {
    test('toIso8601DateOnly formats correctly', () {
      final date = DateTime(2024, 1, 5);
      expect(date.toIso8601DateOnly(), '2024-01-05');
    });

    test('toIso8601DateOnly pads single digits', () {
      final date = DateTime(2024, 3, 9);
      expect(date.toIso8601DateOnly(), '2024-03-09');
    });

    test('toIso8601DateOnly handles Dec 31', () {
      final date = DateTime(2025, 12, 31);
      expect(date.toIso8601DateOnly(), '2025-12-31');
    });

    test('fromApiString parses ISO 8601 date', () {
      final result = DateTimeExtensions.fromApiString('2024-01-05');
      expect(result.year, 2024);
      expect(result.month, 1);
      expect(result.day, 5);
    });

    test('fromApiString parses full ISO 8601', () {
      final result =
          DateTimeExtensions.fromApiString('2024-01-05T10:30:00.000Z');
      expect(result.year, 2024);
      expect(result.month, 1);
      expect(result.day, 5);
    });
  });
}
