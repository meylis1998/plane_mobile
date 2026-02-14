import 'package:core_storage/core_storage.dart';
import 'package:drift/drift.dart' hide isNotNull, isNull;
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late PlaneDatabase db;
  late ProjectDao dao;

  setUp(() {
    db = PlaneDatabase(NativeDatabase.memory());
    dao = ProjectDao(db);
  });

  tearDown(() async {
    await db.close();
  });

  ProjectsTableCompanion _companion({
    required String id,
    String name = 'Test Project',
    String workspaceId = 'ws-1',
    bool isFavorite = false,
  }) {
    return ProjectsTableCompanion.insert(
      id: id,
      workspaceId: workspaceId,
      name: name,
      isFavorite: Value(isFavorite),
    );
  }

  group('ProjectDao', () {
    test('insertOne and getById', () async {
      await dao.insertOne(_companion(id: 'p-1', name: 'My Project'));
      final result = await dao.getById('p-1');
      expect(result, isNotNull);
      expect(result!.name, 'My Project');
    });

    test('getAll returns all projects', () async {
      await dao.insertOne(_companion(id: 'p-1'));
      await dao.insertOne(_companion(id: 'p-2'));
      final results = await dao.getAll();
      expect(results, hasLength(2));
    });

    test('getByWorkspace filters correctly', () async {
      await dao.insertOne(_companion(id: 'p-1', workspaceId: 'ws-1'));
      await dao.insertOne(_companion(id: 'p-2', workspaceId: 'ws-2'));
      final results = await dao.getByWorkspace('ws-1');
      expect(results, hasLength(1));
      expect(results.first.workspaceId, 'ws-1');
    });

    test('getFavorites returns only favorites', () async {
      await dao.insertOne(_companion(id: 'p-1', isFavorite: true));
      await dao.insertOne(_companion(id: 'p-2', isFavorite: false));
      final results = await dao.getFavorites();
      expect(results, hasLength(1));
      expect(results.first.id, 'p-1');
    });

    test('deleteById removes the project', () async {
      await dao.insertOne(_companion(id: 'p-1'));
      await dao.deleteById('p-1');
      final result = await dao.getById('p-1');
      expect(result, isNull);
    });

    test('insertAll batch inserts', () async {
      await dao.insertAll([
        _companion(id: 'p-1'),
        _companion(id: 'p-2'),
        _companion(id: 'p-3'),
      ]);
      final results = await dao.getAll();
      expect(results, hasLength(3));
    });
  });
}
