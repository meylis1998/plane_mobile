import 'dart:async';

import 'package:data_sync/src/models/sync_conflict.dart';

/// In-memory store for unresolved conflicts that need manual user resolution.
class ConflictStore {
  final List<SyncConflict> _conflicts = [];
  final _controller = StreamController<List<SyncConflict>>.broadcast();

  /// Stream of current unresolved conflicts.
  Stream<List<SyncConflict>> get stream => _controller.stream;

  /// Returns all unresolved conflicts.
  List<SyncConflict> getConflicts() => List.unmodifiable(_conflicts);

  /// Adds a conflict for user review.
  void addConflict(SyncConflict conflict) {
    _conflicts.add(conflict);
    _controller.add(getConflicts());
  }

  /// Removes a conflict after it has been resolved.
  void resolveConflict(String id) {
    _conflicts.removeWhere((c) => c.id == id);
    _controller.add(getConflicts());
  }

  /// Returns the number of unresolved conflicts.
  int get count => _conflicts.length;

  /// Clears all conflicts.
  void clear() {
    _conflicts.clear();
    _controller.add(getConflicts());
  }

  /// Disposes internal resources.
  void dispose() {
    _controller.close();
  }
}
