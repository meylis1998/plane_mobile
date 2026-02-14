import 'package:core_storage/core_storage.dart';
import 'package:drift/drift.dart' hide isNotNull, isNull;
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late PlaneDatabase db;
  late SyncQueueDao dao;

  setUp(() {
    db = PlaneDatabase(NativeDatabase.memory());
    dao = SyncQueueDao(db);
  });

  tearDown(() async {
    await db.close();
  });

  group('SyncQueueDao', () {
    test('insertEntry and getNext', () async {
      await dao.insertEntry(
        SyncQueueTableCompanion.insert(
          entityType: 'work_item',
          entityId: 'wi-1',
          operation: 'create',
          priority: const Value(10),
        ),
      );

      final next = await dao.getNext();
      expect(next, isNotNull);
      expect(next!.entityType, 'work_item');
      expect(next.entityId, 'wi-1');
      expect(next.operation, 'create');
    });

    test('getNext returns highest priority first', () async {
      await dao.insertEntry(
        SyncQueueTableCompanion.insert(
          entityType: 'work_item',
          entityId: 'wi-1',
          operation: 'update',
          priority: const Value(5),
        ),
      );
      await dao.insertEntry(
        SyncQueueTableCompanion.insert(
          entityType: 'work_item',
          entityId: 'wi-2',
          operation: 'create',
          priority: const Value(10),
        ),
      );

      final next = await dao.getNext();
      expect(next!.entityId, 'wi-2');
    });

    test('getPending returns batch of items', () async {
      for (var i = 0; i < 5; i++) {
        await dao.insertEntry(
          SyncQueueTableCompanion.insert(
            entityType: 'work_item',
            entityId: 'wi-$i',
            operation: 'update',
          ),
        );
      }

      final pending = await dao.getPending(limit: 3);
      expect(pending, hasLength(3));
    });

    test('remove deletes an entry', () async {
      final id = await dao.insertEntry(
        SyncQueueTableCompanion.insert(
          entityType: 'work_item',
          entityId: 'wi-1',
          operation: 'create',
        ),
      );

      await dao.remove(id);
      final next = await dao.getNext();
      expect(next, isNull);
    });

    test('markAttempted increments attempt count', () async {
      final id = await dao.insertEntry(
        SyncQueueTableCompanion.insert(
          entityType: 'work_item',
          entityId: 'wi-1',
          operation: 'create',
        ),
      );

      await dao.markAttempted(id);
      final next = await dao.getNext();
      expect(next!.attempts, 1);
    });

    test('getPendingCount returns correct count', () async {
      await dao.insertEntry(
        SyncQueueTableCompanion.insert(
          entityType: 'work_item',
          entityId: 'wi-1',
          operation: 'create',
        ),
      );
      await dao.insertEntry(
        SyncQueueTableCompanion.insert(
          entityType: 'work_item',
          entityId: 'wi-2',
          operation: 'update',
        ),
      );

      final count = await dao.getPendingCount();
      expect(count, 2);
    });

    test('removeAll clears the queue', () async {
      await dao.insertEntry(
        SyncQueueTableCompanion.insert(
          entityType: 'work_item',
          entityId: 'wi-1',
          operation: 'create',
        ),
      );
      await dao.removeAll();
      final count = await dao.getPendingCount();
      expect(count, 0);
    });
  });
}
