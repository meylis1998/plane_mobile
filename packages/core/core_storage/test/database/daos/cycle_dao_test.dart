import 'package:core_storage/core_storage.dart';
import 'package:drift/drift.dart' hide isNotNull, isNull;
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late PlaneDatabase db;
  late CycleDao dao;

  setUp(() {
    db = PlaneDatabase(NativeDatabase.memory());
    dao = CycleDao(db);
  });

  tearDown(() async {
    await db.close();
  });

  CyclesTableCompanion _companion({
    required String id,
    String name = 'Sprint 1',
    String projectId = 'proj-1',
    int status = 0,
  }) {
    return CyclesTableCompanion.insert(
      id: id,
      projectId: projectId,
      name: name,
      status: Value(status),
    );
  }

  group('CycleDao', () {
    test('insertOne and getById', () async {
      await dao.insertOne(_companion(id: 'c-1', name: 'Sprint 1'));
      final result = await dao.getById('c-1');
      expect(result, isNotNull);
      expect(result!.name, 'Sprint 1');
    });

    test('getAll returns all cycles', () async {
      await dao.insertOne(_companion(id: 'c-1'));
      await dao.insertOne(_companion(id: 'c-2'));
      final results = await dao.getAll();
      expect(results, hasLength(2));
    });

    test('getByProject filters correctly', () async {
      await dao.insertOne(_companion(id: 'c-1', projectId: 'proj-1'));
      await dao.insertOne(_companion(id: 'c-2', projectId: 'proj-2'));
      final results = await dao.getByProject('proj-1');
      expect(results, hasLength(1));
      expect(results.first.projectId, 'proj-1');
    });

    test('getByStatus filters correctly', () async {
      await dao.insertOne(_companion(id: 'c-1', status: 0));
      await dao.insertOne(_companion(id: 'c-2', status: 2));
      final results = await dao.getByStatus(0);
      expect(results, hasLength(1));
      expect(results.first.id, 'c-1');
    });

    test('deleteById removes the cycle', () async {
      await dao.insertOne(_companion(id: 'c-1'));
      await dao.deleteById('c-1');
      final result = await dao.getById('c-1');
      expect(result, isNull);
    });

    test('insertAll batch inserts', () async {
      await dao.insertAll([
        _companion(id: 'c-1'),
        _companion(id: 'c-2'),
      ]);
      final results = await dao.getAll();
      expect(results, hasLength(2));
    });
  });
}
