import 'package:data_sync/src/conflict/conflict_detector.dart';
import 'package:data_sync/src/models/conflict_result.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const detector = ConflictDetector();

  group('ConflictDetector', () {
    test('returns noConflict when versions match', () {
      final result = detector.detectConflict(
        localVersion: 5,
        serverVersion: 5,
        localUpdatedAt: DateTime(2024),
        serverUpdatedAt: DateTime(2024),
      );
      expect(result, ConflictResult.noConflict);
    });

    test('returns localNewer when local version and timestamp are ahead', () {
      final result = detector.detectConflict(
        localVersion: 6,
        serverVersion: 5,
        localUpdatedAt: DateTime(2024, 2),
        serverUpdatedAt: DateTime(2024, 1),
      );
      expect(result, ConflictResult.localNewer);
    });

    test('returns serverNewer when server version and timestamp are ahead', () {
      final result = detector.detectConflict(
        localVersion: 5,
        serverVersion: 6,
        localUpdatedAt: DateTime(2024, 1),
        serverUpdatedAt: DateTime(2024, 2),
      );
      expect(result, ConflictResult.serverNewer);
    });

    test('returns trueConflict when both changed independently', () {
      final result = detector.detectConflict(
        localVersion: 6,
        serverVersion: 5,
        localUpdatedAt: DateTime(2024, 1),
        serverUpdatedAt: DateTime(2024, 2),
      );
      expect(result, ConflictResult.trueConflict);
    });

    test('returns trueConflict when versions differ but timestamps conflict',
        () {
      final result = detector.detectConflict(
        localVersion: 5,
        serverVersion: 6,
        localUpdatedAt: DateTime(2024, 2),
        serverUpdatedAt: DateTime(2024, 1),
      );
      expect(result, ConflictResult.trueConflict);
    });
  });
}
