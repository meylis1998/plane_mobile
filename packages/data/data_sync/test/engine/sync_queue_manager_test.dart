import 'package:core_storage/core_storage.dart';
import 'package:data_sync/src/engine/sync_queue_manager.dart';
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late PlaneDatabase db;
  late SyncQueueDao syncQueueDao;
  late SyncQueueManager manager;

  setUp(() {
    db = PlaneDatabase(NativeDatabase.memory());
    syncQueueDao = SyncQueueDao(db);
    manager = SyncQueueManager(syncQueueDao: syncQueueDao);
  });

  tearDown(() async {
    await db.close();
  });

  group('SyncQueueManager', () {
    test('enqueue adds an entry', () async {
      final id = await manager.enqueue(
        entityType: 'work_item',
        entityId: 'wi-1',
        operation: 'create',
      );
      expect(id, isPositive);
    });

    test('enqueue with create gets priority 10', () async {
      await manager.enqueue(
        entityType: 'work_item',
        entityId: 'wi-1',
        operation: 'create',
      );
      final item = await manager.dequeue();
      expect(item, isNotNull);
      expect(item!.priority, 10);
    });

    test('enqueue with update gets priority 5', () async {
      await manager.enqueue(
        entityType: 'work_item',
        entityId: 'wi-1',
        operation: 'update',
      );
      final item = await manager.dequeue();
      expect(item!.priority, 5);
    });

    test('enqueue with delete gets priority 10', () async {
      await manager.enqueue(
        entityType: 'work_item',
        entityId: 'wi-1',
        operation: 'delete',
      );
      final item = await manager.dequeue();
      expect(item!.priority, 10);
    });

    test('enqueue with custom priority overrides default', () async {
      await manager.enqueue(
        entityType: 'work_item',
        entityId: 'wi-1',
        operation: 'update',
        priority: 99,
      );
      final item = await manager.dequeue();
      expect(item!.priority, 99);
    });

    test('dequeue returns highest priority first', () async {
      await manager.enqueue(
        entityType: 'work_item',
        entityId: 'wi-1',
        operation: 'update',
      );
      await manager.enqueue(
        entityType: 'work_item',
        entityId: 'wi-2',
        operation: 'create',
      );

      final item = await manager.dequeue();
      expect(item!.entityId, 'wi-2');
    });

    test('dequeue returns null when empty', () async {
      final item = await manager.dequeue();
      expect(item, isNull);
    });

    test('getPending returns batch', () async {
      for (var i = 0; i < 5; i++) {
        await manager.enqueue(
          entityType: 'work_item',
          entityId: 'wi-$i',
          operation: 'update',
        );
      }
      final items = await manager.getPending(limit: 3);
      expect(items, hasLength(3));
    });

    test('markCompleted removes entry', () async {
      final id = await manager.enqueue(
        entityType: 'work_item',
        entityId: 'wi-1',
        operation: 'create',
      );
      await manager.markCompleted(id);
      final item = await manager.dequeue();
      expect(item, isNull);
    });

    test('markFailed increments attempt count', () async {
      final id = await manager.enqueue(
        entityType: 'work_item',
        entityId: 'wi-1',
        operation: 'create',
      );
      await manager.markFailed(id);
      final item = await manager.dequeue();
      expect(item!.attempts, 1);
    });

    test('getPendingCount returns correct count', () async {
      await manager.enqueue(
        entityType: 'work_item',
        entityId: 'wi-1',
        operation: 'create',
      );
      await manager.enqueue(
        entityType: 'work_item',
        entityId: 'wi-2',
        operation: 'update',
      );
      final count = await manager.getPendingCount();
      expect(count, 2);
    });

    test('clearAll removes all entries', () async {
      await manager.enqueue(
        entityType: 'work_item',
        entityId: 'wi-1',
        operation: 'create',
      );
      await manager.clearAll();
      final count = await manager.getPendingCount();
      expect(count, 0);
    });
  });
}
