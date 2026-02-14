import 'dart:async';
import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:core_storage/core_storage.dart';
import 'package:data_sync/src/engine/sync_queue_manager.dart';
import 'package:data_sync/src/handlers/entity_sync_handler.dart';
import 'package:data_sync/src/models/sync_status.dart';

/// Orchestrates the offline sync process.
///
/// Processes the [SyncQueueManager] queue when the device is online,
/// dispatches each entry to the appropriate [EntitySyncHandler], and
/// manages periodic background sync.
class SyncEngine {
  SyncEngine({
    required SyncQueueManager queueManager,
    required Map<String, EntitySyncHandler> handlers,
    required Connectivity connectivity,
  })  : _queueManager = queueManager,
        _handlers = handlers,
        _connectivity = connectivity;

  final SyncQueueManager _queueManager;
  final Map<String, EntitySyncHandler> _handlers;
  final Connectivity _connectivity;

  Timer? _periodicTimer;
  bool _isSyncing = false;

  final _statusController = StreamController<SyncStatus>.broadcast();

  /// Stream of [SyncStatus] updates.
  Stream<SyncStatus> get statusStream => _statusController.stream;

  /// Whether a sync cycle is currently running.
  bool get isSyncing => _isSyncing;

  /// Maximum number of retry attempts before an entry is discarded.
  static const int maxRetries = 5;

  /// Processes all pending items in the sync queue.
  ///
  /// Only runs when a network connection is available.
  Future<void> startSync() async {
    if (_isSyncing) return;

    final connectivityResult = await _connectivity.checkConnectivity();
    if (_isOffline(connectivityResult)) {
      _statusController.add(
        const SyncStatus.error(message: 'No network connection'),
      );
      return;
    }

    _isSyncing = true;
    _statusController.add(const SyncStatus.syncing());

    var syncedCount = 0;
    var hadError = false;

    try {
      final pending = await _queueManager.getPending(limit: 50);
      final total = pending.length;

      for (var i = 0; i < pending.length; i++) {
        final entry = pending[i];
        final success = await _syncEntry(entry);

        if (success) {
          syncedCount++;
          await _queueManager.markCompleted(entry.id);
        } else {
          hadError = true;
          await _queueManager.markFailed(entry.id);
        }

        final progress = total > 0 ? (i + 1) / total : 1.0;
        _statusController.add(SyncStatus.syncing(progress: progress));
      }
    } catch (e) {
      hadError = true;
      _statusController.add(SyncStatus.error(message: e.toString()));
    } finally {
      _isSyncing = false;
    }

    if (hadError && syncedCount == 0) {
      _statusController.add(
        const SyncStatus.error(message: 'Sync failed'),
      );
    } else {
      _statusController.add(SyncStatus.completed(syncedCount: syncedCount));
    }
  }

  /// Schedules periodic background sync at the given [interval].
  void schedulePeriodicSync(Duration interval) {
    stopSync();
    _periodicTimer = Timer.periodic(interval, (_) => startSync());
  }

  /// Cancels the periodic sync timer.
  void stopSync() {
    _periodicTimer?.cancel();
    _periodicTimer = null;
  }

  /// Disposes internal resources.
  void dispose() {
    stopSync();
    _statusController.close();
  }

  Future<bool> _syncEntry(SyncQueueTableData entry) async {
    if (entry.attempts >= maxRetries) {
      // Too many retries — discard this entry.
      await _queueManager.markCompleted(entry.id);
      return true;
    }

    final handler = _handlers[entry.entityType];
    if (handler == null) return false;

    final payload =
        jsonDecode(entry.payload) as Map<String, dynamic>? ?? {};

    final result = switch (entry.operation) {
      'create' => await handler.syncCreate(payload),
      'update' => await handler.syncUpdate(payload),
      'delete' => await handler.syncDelete(payload),
      _ => await handler.syncUpdate(payload),
    };

    return result.isRight;
  }

  bool _isOffline(List<ConnectivityResult> results) {
    return results.contains(ConnectivityResult.none) || results.isEmpty;
  }
}
