import 'dart:convert';

import 'package:core_storage/core_storage.dart';
import 'package:drift/drift.dart';

/// Manages the sync queue by wrapping [SyncQueueDao] with higher-level
/// operations for enqueue, dequeue, completion, and failure tracking.
class SyncQueueManager {
  SyncQueueManager({required SyncQueueDao syncQueueDao})
      : _dao = syncQueueDao;

  final SyncQueueDao _dao;

  /// Priorities for different sync operations.
  static const int createPriority = 10;
  static const int deletePriority = 10;
  static const int updatePriority = 5;

  /// Adds a new entry to the sync queue.
  Future<int> enqueue({
    required String entityType,
    required String entityId,
    required String operation,
    Map<String, dynamic> payload = const {},
    int? priority,
  }) {
    final effectivePriority = priority ?? _priorityForOperation(operation);
    return _dao.insertEntry(
      SyncQueueTableCompanion.insert(
        entityType: entityType,
        entityId: entityId,
        operation: operation,
        priority: Value(effectivePriority),
        payload: Value(jsonEncode(payload)),
      ),
    );
  }

  /// Returns the next item in the queue sorted by priority and creation time.
  Future<SyncQueueTableData?> dequeue() => _dao.getNext();

  /// Returns a batch of pending items.
  Future<List<SyncQueueTableData>> getPending({int limit = 10}) =>
      _dao.getPending(limit: limit);

  /// Removes a completed entry from the queue.
  Future<void> markCompleted(int id) async {
    await _dao.remove(id);
  }

  /// Records a failed sync attempt by incrementing the attempt counter.
  Future<void> markFailed(int id) async {
    await _dao.markAttempted(id);
  }

  /// Returns the number of items waiting to be synced.
  Future<int> getPendingCount() => _dao.getPendingCount();

  /// Removes all entries from the queue.
  Future<void> clearAll() async {
    await _dao.removeAll();
  }

  int _priorityForOperation(String operation) {
    return switch (operation) {
      'create' => createPriority,
      'delete' => deletePriority,
      _ => updatePriority,
    };
  }
}
