import 'package:core_storage/src/database/plane_database.dart';
import 'package:core_storage/src/database/tables/projects_table.dart';
import 'package:drift/drift.dart';

part 'project_dao.g.dart';

@DriftAccessor(tables: [ProjectsTable])
class ProjectDao extends DatabaseAccessor<PlaneDatabase>
    with _$ProjectDaoMixin {
  ProjectDao(super.db);

  Future<List<ProjectsTableData>> getAll() =>
      select(projectsTable).get();

  Stream<List<ProjectsTableData>> watchAll() =>
      select(projectsTable).watch();

  Future<ProjectsTableData?> getById(String id) =>
      (select(projectsTable)..where((t) => t.id.equals(id)))
          .getSingleOrNull();

  Future<List<ProjectsTableData>> getByWorkspace(String workspaceId) =>
      (select(projectsTable)..where((t) => t.workspaceId.equals(workspaceId)))
          .get();

  Stream<List<ProjectsTableData>> watchByWorkspace(String workspaceId) =>
      (select(projectsTable)..where((t) => t.workspaceId.equals(workspaceId)))
          .watch();

  Future<List<ProjectsTableData>> getFavorites() =>
      (select(projectsTable)..where((t) => t.isFavorite.equals(true))).get();

  Stream<List<ProjectsTableData>> watchFavorites() =>
      (select(projectsTable)..where((t) => t.isFavorite.equals(true))).watch();

  Future<int> insertOne(ProjectsTableCompanion entry) =>
      into(projectsTable).insert(entry, mode: InsertMode.insertOrReplace);

  Future<bool> updateOne(ProjectsTableCompanion entry) =>
      update(projectsTable).replace(entry);

  Future<int> deleteById(String id) =>
      (delete(projectsTable)..where((t) => t.id.equals(id))).go();

  Future<void> insertAll(List<ProjectsTableCompanion> entries) async {
    await batch((b) {
      b.insertAll(projectsTable, entries, mode: InsertMode.insertOrReplace);
    });
  }
}
