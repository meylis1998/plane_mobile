import 'package:core_storage/src/database/plane_database.dart';
import 'package:core_storage/src/database/tables/cycles_table.dart';
import 'package:drift/drift.dart';

part 'cycle_dao.g.dart';

@DriftAccessor(tables: [CyclesTable])
class CycleDao extends DatabaseAccessor<PlaneDatabase> with _$CycleDaoMixin {
  CycleDao(super.db);

  Future<List<CyclesTableData>> getAll() => select(cyclesTable).get();

  Stream<List<CyclesTableData>> watchAll() => select(cyclesTable).watch();

  Future<CyclesTableData?> getById(String id) =>
      (select(cyclesTable)..where((t) => t.id.equals(id))).getSingleOrNull();

  Future<List<CyclesTableData>> getByProject(String projectId) =>
      (select(cyclesTable)..where((t) => t.projectId.equals(projectId))).get();

  Stream<List<CyclesTableData>> watchByProject(String projectId) =>
      (select(cyclesTable)..where((t) => t.projectId.equals(projectId)))
          .watch();

  Future<List<CyclesTableData>> getByStatus(int status) =>
      (select(cyclesTable)..where((t) => t.status.equals(status))).get();

  Future<int> insertOne(CyclesTableCompanion entry) =>
      into(cyclesTable).insert(entry, mode: InsertMode.insertOrReplace);

  Future<bool> updateOne(CyclesTableCompanion entry) =>
      update(cyclesTable).replace(entry);

  Future<int> deleteById(String id) =>
      (delete(cyclesTable)..where((t) => t.id.equals(id))).go();

  Future<void> insertAll(List<CyclesTableCompanion> entries) async {
    await batch((b) {
      b.insertAll(cyclesTable, entries, mode: InsertMode.insertOrReplace);
    });
  }
}
