import 'package:data_sync/src/conflict/conflict_store.dart';
import 'package:data_sync/src/models/sync_conflict.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late ConflictStore store;

  setUp(() {
    store = ConflictStore();
  });

  tearDown(() {
    store.dispose();
  });

  SyncConflict _makeConflict(String id) {
    return SyncConflict(
      id: id,
      entityType: 'work_item',
      entityId: id,
      localData: {'name': 'local'},
      serverData: {'name': 'server'},
      detectedAt: DateTime.now(),
    );
  }

  group('ConflictStore', () {
    test('starts empty', () {
      expect(store.count, 0);
      expect(store.getConflicts(), isEmpty);
    });

    test('addConflict increases count', () {
      store.addConflict(_makeConflict('c-1'));
      expect(store.count, 1);
    });

    test('getConflicts returns all conflicts', () {
      store.addConflict(_makeConflict('c-1'));
      store.addConflict(_makeConflict('c-2'));
      final conflicts = store.getConflicts();
      expect(conflicts, hasLength(2));
    });

    test('getConflicts returns unmodifiable list', () {
      store.addConflict(_makeConflict('c-1'));
      final conflicts = store.getConflicts();
      expect(() => conflicts.add(_makeConflict('c-2')), throwsUnsupportedError);
    });

    test('resolveConflict removes specific conflict', () {
      store.addConflict(_makeConflict('c-1'));
      store.addConflict(_makeConflict('c-2'));
      store.resolveConflict('c-1');
      expect(store.count, 1);
      expect(store.getConflicts().first.id, 'c-2');
    });

    test('clear removes all conflicts', () {
      store.addConflict(_makeConflict('c-1'));
      store.addConflict(_makeConflict('c-2'));
      store.clear();
      expect(store.count, 0);
    });

    test('stream emits updates on add', () async {
      final events = <List<SyncConflict>>[];
      store.stream.listen(events.add);

      store.addConflict(_makeConflict('c-1'));
      await Future<void>.delayed(Duration.zero);

      expect(events, hasLength(1));
      expect(events.first, hasLength(1));
    });

    test('stream emits updates on resolve', () async {
      final events = <List<SyncConflict>>[];
      store.addConflict(_makeConflict('c-1'));

      store.stream.listen(events.add);
      store.resolveConflict('c-1');
      await Future<void>.delayed(Duration.zero);

      expect(events, hasLength(1));
      expect(events.first, isEmpty);
    });
  });
}
