import 'package:core_storage/src/database/plane_database.dart';
import 'package:core_storage/src/database/tables/modules_table.dart';
import 'package:drift/drift.dart';

part 'module_dao.g.dart';

@DriftAccessor(tables: [ModulesTable])
class ModuleDao extends DatabaseAccessor<PlaneDatabase>
    with _$ModuleDaoMixin {
  ModuleDao(super.db);

  Future<List<ModulesTableData>> getAll() => select(modulesTable).get();

  Stream<List<ModulesTableData>> watchAll() => select(modulesTable).watch();

  Future<ModulesTableData?> getById(String id) =>
      (select(modulesTable)..where((t) => t.id.equals(id))).getSingleOrNull();

  Future<List<ModulesTableData>> getByProject(String projectId) =>
      (select(modulesTable)..where((t) => t.projectId.equals(projectId)))
          .get();

  Stream<List<ModulesTableData>> watchByProject(String projectId) =>
      (select(modulesTable)..where((t) => t.projectId.equals(projectId)))
          .watch();

  Future<int> insertOne(ModulesTableCompanion entry) =>
      into(modulesTable).insert(entry, mode: InsertMode.insertOrReplace);

  Future<bool> updateOne(ModulesTableCompanion entry) =>
      update(modulesTable).replace(entry);

  Future<int> deleteById(String id) =>
      (delete(modulesTable)..where((t) => t.id.equals(id))).go();

  Future<void> insertAll(List<ModulesTableCompanion> entries) async {
    await batch((b) {
      b.insertAll(modulesTable, entries, mode: InsertMode.insertOrReplace);
    });
  }
}
