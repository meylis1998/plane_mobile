import 'package:core_storage/src/database/plane_database.dart';
import 'package:core_storage/src/database/tables/workspaces_table.dart';
import 'package:drift/drift.dart';

part 'workspace_dao.g.dart';

@DriftAccessor(tables: [WorkspacesTable])
class WorkspaceDao extends DatabaseAccessor<PlaneDatabase>
    with _$WorkspaceDaoMixin {
  WorkspaceDao(super.db);

  Future<List<WorkspacesTableData>> getAll() =>
      select(workspacesTable).get();

  Stream<List<WorkspacesTableData>> watchAll() =>
      select(workspacesTable).watch();

  Future<WorkspacesTableData?> getById(String id) =>
      (select(workspacesTable)..where((t) => t.id.equals(id)))
          .getSingleOrNull();

  Future<WorkspacesTableData?> getBySlug(String slug) =>
      (select(workspacesTable)..where((t) => t.slug.equals(slug)))
          .getSingleOrNull();

  Future<int> insertOne(WorkspacesTableCompanion entry) =>
      into(workspacesTable).insert(entry, mode: InsertMode.insertOrReplace);

  Future<bool> updateOne(WorkspacesTableCompanion entry) =>
      update(workspacesTable).replace(entry);

  Future<int> deleteById(String id) =>
      (delete(workspacesTable)..where((t) => t.id.equals(id))).go();

  Future<void> insertAll(List<WorkspacesTableCompanion> entries) async {
    await batch((b) {
      b.insertAll(workspacesTable, entries, mode: InsertMode.insertOrReplace);
    });
  }
}
