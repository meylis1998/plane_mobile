import 'package:data_sync/src/conflict/conflict_store.dart';
import 'package:data_sync/src/models/conflict_result.dart';
import 'package:data_sync/src/models/conflict_strategy.dart';
import 'package:data_sync/src/models/sync_conflict.dart';

/// Resolves conflicts between local and server data based on a
/// [ConflictStrategy].
class ConflictResolver {
  ConflictResolver({required ConflictStore conflictStore})
      : _conflictStore = conflictStore;

  final ConflictStore _conflictStore;

  /// Resolves a conflict and returns the winning data.
  ///
  /// For [ConflictStrategy.manual] the conflict is stored for later user
  /// resolution and `null` is returned — the caller should skip syncing
  /// this entity until the user resolves it.
  Map<String, dynamic>? resolve({
    required ConflictResult conflictResult,
    required ConflictStrategy strategy,
    required String entityType,
    required String entityId,
    required Map<String, dynamic> localData,
    required Map<String, dynamic> serverData,
    required DateTime localUpdatedAt,
    required DateTime serverUpdatedAt,
  }) {
    if (conflictResult == ConflictResult.noConflict) {
      return localData;
    }

    if (conflictResult == ConflictResult.localNewer) {
      return localData;
    }

    if (conflictResult == ConflictResult.serverNewer) {
      return serverData;
    }

    // True conflict — apply strategy.
    return switch (strategy) {
      ConflictStrategy.serverWins => serverData,
      ConflictStrategy.clientWins => localData,
      ConflictStrategy.lastWriteWins =>
        localUpdatedAt.isAfter(serverUpdatedAt) ? localData : serverData,
      ConflictStrategy.manual => _storeForManualResolution(
          entityType: entityType,
          entityId: entityId,
          localData: localData,
          serverData: serverData,
        ),
    };
  }

  Map<String, dynamic>? _storeForManualResolution({
    required String entityType,
    required String entityId,
    required Map<String, dynamic> localData,
    required Map<String, dynamic> serverData,
  }) {
    _conflictStore.addConflict(
      SyncConflict(
        id: '${entityType}_$entityId',
        entityType: entityType,
        entityId: entityId,
        localData: localData,
        serverData: serverData,
        detectedAt: DateTime.now(),
      ),
    );
    // Return null to signal that syncing should be deferred.
    return null;
  }
}
