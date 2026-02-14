import 'package:data_sync/src/models/conflict_result.dart';

/// Detects conflicts between local and server versions of an entity.
class ConflictDetector {
  const ConflictDetector();

  /// Compares local and server versions to determine if a conflict exists.
  ///
  /// Returns [ConflictResult.noConflict] if the versions match,
  /// [ConflictResult.localNewer] or [ConflictResult.serverNewer] if one side
  /// is clearly ahead, or [ConflictResult.trueConflict] if both sides were
  /// modified independently.
  ConflictResult detectConflict({
    required int localVersion,
    required int serverVersion,
    required DateTime localUpdatedAt,
    required DateTime serverUpdatedAt,
  }) {
    if (localVersion == serverVersion) {
      return ConflictResult.noConflict;
    }

    if (localVersion > serverVersion &&
        localUpdatedAt.isAfter(serverUpdatedAt)) {
      return ConflictResult.localNewer;
    }

    if (serverVersion > localVersion &&
        serverUpdatedAt.isAfter(localUpdatedAt)) {
      return ConflictResult.serverNewer;
    }

    // Both sides changed independently — a true conflict.
    return ConflictResult.trueConflict;
  }
}
