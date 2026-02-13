import 'package:core_storage/src/database/plane_database.dart';
import 'package:core_storage/src/database/tables/states_table.dart';
import 'package:drift/drift.dart';

part 'state_dao.g.dart';

@DriftAccessor(tables: [StatesTable])
class StateDao extends DatabaseAccessor<PlaneDatabase> with _$StateDaoMixin {
  StateDao(super.db);

  Future<List<StatesTableData>> getAll() => select(statesTable).get();

  Future<StatesTableData?> getById(String id) =>
      (select(statesTable)..where((t) => t.id.equals(id))).getSingleOrNull();

  Future<List<StatesTableData>> getByProject(String projectId) =>
      (select(statesTable)
            ..where((t) => t.projectId.equals(projectId))
            ..orderBy([(t) => OrderingTerm.asc(t.sequence)]))
          .get();

  Stream<List<StatesTableData>> watchByProject(String projectId) =>
      (select(statesTable)
            ..where((t) => t.projectId.equals(projectId))
            ..orderBy([(t) => OrderingTerm.asc(t.sequence)]))
          .watch();

  Future<int> insertOne(StatesTableCompanion entry) =>
      into(statesTable).insert(entry, mode: InsertMode.insertOrReplace);

  Future<bool> updateOne(StatesTableCompanion entry) =>
      update(statesTable).replace(entry);

  Future<int> deleteById(String id) =>
      (delete(statesTable)..where((t) => t.id.equals(id))).go();

  Future<void> insertAll(List<StatesTableCompanion> entries) async {
    await batch((b) {
      b.insertAll(statesTable, entries, mode: InsertMode.insertOrReplace);
    });
  }
}
