import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:core_network/core_network.dart';
import 'package:core_storage/core_storage.dart';
import 'package:data_sync/src/conflict/conflict_resolver.dart';
import 'package:data_sync/src/conflict/conflict_store.dart';
import 'package:data_sync/src/engine/sync_engine.dart';
import 'package:data_sync/src/engine/sync_queue_manager.dart';
import 'package:data_sync/src/handlers/comment_sync_handler.dart';
import 'package:data_sync/src/handlers/cycle_sync_handler.dart';
import 'package:data_sync/src/handlers/entity_sync_handler.dart';
import 'package:data_sync/src/handlers/module_sync_handler.dart';
import 'package:data_sync/src/handlers/project_sync_handler.dart';
import 'package:data_sync/src/handlers/work_item_sync_handler.dart';
import 'package:data_sync/src/models/conflict_strategy.dart';
import 'package:data_sync/src/models/sync_conflict.dart';
import 'package:data_sync/src/models/sync_status.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sync_providers.g.dart';

// ---------------------------------------------------------------------------
// Infrastructure providers
// ---------------------------------------------------------------------------

@Riverpod(keepAlive: true)
Connectivity connectivity(ConnectivityRef ref) {
  return Connectivity();
}

@Riverpod(keepAlive: true)
SyncQueueManager syncQueueManager(
  SyncQueueManagerRef ref, {
  required SyncQueueDao dao,
}) {
  return SyncQueueManager(syncQueueDao: dao);
}

@Riverpod(keepAlive: true)
ConflictStore conflictStore(ConflictStoreRef ref) {
  final store = ConflictStore();
  ref.onDispose(store.dispose);
  return store;
}

@Riverpod(keepAlive: true)
ConflictResolver conflictResolver(ConflictResolverRef ref) {
  return ConflictResolver(
    conflictStore: ref.watch(conflictStoreProvider),
  );
}

@Riverpod(keepAlive: true)
Map<String, EntitySyncHandler> entitySyncHandlers(
  EntitySyncHandlersRef ref, {
  required PlaneApiClient apiClient,
}) {
  final workItemHandler = WorkItemSyncHandler(apiClient: apiClient);
  final projectHandler = ProjectSyncHandler(apiClient: apiClient);
  final cycleHandler = CycleSyncHandler(apiClient: apiClient);
  final moduleHandler = ModuleSyncHandler(apiClient: apiClient);
  final commentHandler = CommentSyncHandler(apiClient: apiClient);

  return {
    workItemHandler.entityType: workItemHandler,
    projectHandler.entityType: projectHandler,
    cycleHandler.entityType: cycleHandler,
    moduleHandler.entityType: moduleHandler,
    commentHandler.entityType: commentHandler,
  };
}

// ---------------------------------------------------------------------------
// Core providers
// ---------------------------------------------------------------------------

@Riverpod(keepAlive: true)
SyncEngine syncEngine(
  SyncEngineRef ref, {
  required SyncQueueDao dao,
  required PlaneApiClient apiClient,
}) {
  final engine = SyncEngine(
    queueManager: ref.watch(syncQueueManagerProvider(dao: dao)),
    handlers: ref.watch(
      entitySyncHandlersProvider(apiClient: apiClient),
    ),
    connectivity: ref.watch(connectivityProvider),
  );
  ref.onDispose(engine.dispose);
  return engine;
}

// ---------------------------------------------------------------------------
// Status / UI providers
// ---------------------------------------------------------------------------

@riverpod
Stream<SyncStatus> syncStatus(
  SyncStatusRef ref, {
  required SyncQueueDao dao,
  required PlaneApiClient apiClient,
}) {
  return ref
      .watch(syncEngineProvider(dao: dao, apiClient: apiClient))
      .statusStream;
}

@riverpod
Future<int> pendingSyncCount(
  PendingSyncCountRef ref, {
  required SyncQueueDao dao,
}) {
  return ref.watch(syncQueueManagerProvider(dao: dao)).getPendingCount();
}

@riverpod
Stream<List<SyncConflict>> unresolvedConflicts(
  UnresolvedConflictsRef ref,
) {
  return ref.watch(conflictStoreProvider).stream;
}

@riverpod
class SyncSettings extends _$SyncSettings {
  @override
  ConflictStrategy build() => ConflictStrategy.lastWriteWins;

  // This is intentionally a method, not a setter — it mutates provider state.
  // ignore: use_setters_to_change_properties
  void setStrategy(ConflictStrategy strategy) {
    state = strategy;
  }
}
