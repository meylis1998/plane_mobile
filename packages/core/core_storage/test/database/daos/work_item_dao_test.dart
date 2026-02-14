import 'package:core_storage/core_storage.dart';
import 'package:drift/drift.dart' hide isNotNull, isNull;
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late PlaneDatabase db;
  late WorkItemDao dao;

  setUp(() {
    db = PlaneDatabase(NativeDatabase.memory());
    dao = WorkItemDao(db);
  });

  tearDown(() async {
    await db.close();
  });

  WorkItemsTableCompanion _companion({
    required String id,
    String name = 'Test Item',
    String projectId = 'proj-1',
    String workspaceSlug = 'ws-1',
    int priority = 4,
    String? stateId,
  }) {
    return WorkItemsTableCompanion.insert(
      id: id,
      projectId: projectId,
      workspaceSlug: workspaceSlug,
      name: name,
      priority: Value(priority),
      stateId: Value(stateId),
    );
  }

  group('WorkItemDao', () {
    test('insertOne and getById', () async {
      await dao.insertOne(_companion(id: 'wi-1', name: 'Buy milk'));
      final result = await dao.getById('wi-1');
      expect(result, isNotNull);
      expect(result!.name, 'Buy milk');
      expect(result.id, 'wi-1');
    });

    test('getAll returns all items', () async {
      await dao.insertOne(_companion(id: 'wi-1'));
      await dao.insertOne(_companion(id: 'wi-2'));
      final results = await dao.getAll();
      expect(results, hasLength(2));
    });

    test('getByProject filters correctly', () async {
      await dao.insertOne(_companion(id: 'wi-1', projectId: 'proj-1'));
      await dao.insertOne(_companion(id: 'wi-2', projectId: 'proj-2'));
      final results = await dao.getByProject('proj-1');
      expect(results, hasLength(1));
      expect(results.first.projectId, 'proj-1');
    });

    test('getByPriority filters correctly', () async {
      await dao.insertOne(_companion(id: 'wi-1', priority: 0));
      await dao.insertOne(_companion(id: 'wi-2', priority: 4));
      final results = await dao.getByPriority(0);
      expect(results, hasLength(1));
      expect(results.first.priority, 0);
    });

    test('deleteById removes the item', () async {
      await dao.insertOne(_companion(id: 'wi-1'));
      await dao.deleteById('wi-1');
      final result = await dao.getById('wi-1');
      expect(result, isNull);
    });

    test('insertAll batch inserts', () async {
      await dao.insertAll([
        _companion(id: 'wi-1'),
        _companion(id: 'wi-2'),
        _companion(id: 'wi-3'),
      ]);
      final results = await dao.getAll();
      expect(results, hasLength(3));
    });

    test('search finds items by name', () async {
      await dao.insertOne(_companion(id: 'wi-1', name: 'Fix login bug'));
      await dao.insertOne(_companion(id: 'wi-2', name: 'Add feature'));
      final results = await dao.search('login');
      expect(results, hasLength(1));
      expect(results.first.name, 'Fix login bug');
    });

    test('getDirty returns dirty items', () async {
      await dao.insertOne(
        WorkItemsTableCompanion.insert(
          id: 'wi-1',
          projectId: 'proj-1',
          workspaceSlug: 'ws-1',
          name: 'Dirty',
          isDirty: const Value(true),
        ),
      );
      await dao.insertOne(_companion(id: 'wi-2'));
      final results = await dao.getDirty();
      expect(results, hasLength(1));
      expect(results.first.id, 'wi-1');
    });

    test('insertOrReplace updates existing item', () async {
      await dao.insertOne(_companion(id: 'wi-1', name: 'Original'));
      await dao.insertOne(_companion(id: 'wi-1', name: 'Updated'));
      final result = await dao.getById('wi-1');
      expect(result!.name, 'Updated');
    });
  });
}
