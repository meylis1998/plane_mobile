import 'package:core_storage/src/database/plane_database.dart';
import 'package:core_storage/src/database/tables/work_items_table.dart';
import 'package:drift/drift.dart';

part 'work_item_dao.g.dart';

@DriftAccessor(tables: [WorkItemsTable])
class WorkItemDao extends DatabaseAccessor<PlaneDatabase>
    with _$WorkItemDaoMixin {
  WorkItemDao(super.db);

  Future<List<WorkItemsTableData>> getAll() =>
      select(workItemsTable).get();

  Stream<List<WorkItemsTableData>> watchAll() =>
      select(workItemsTable).watch();

  Future<WorkItemsTableData?> getById(String id) =>
      (select(workItemsTable)..where((t) => t.id.equals(id)))
          .getSingleOrNull();

  Future<List<WorkItemsTableData>> getByProject(String projectId) =>
      (select(workItemsTable)..where((t) => t.projectId.equals(projectId)))
          .get();

  Stream<List<WorkItemsTableData>> watchByProject(String projectId) =>
      (select(workItemsTable)..where((t) => t.projectId.equals(projectId)))
          .watch();

  Future<List<WorkItemsTableData>> getByState(String stateId) =>
      (select(workItemsTable)..where((t) => t.stateId.equals(stateId))).get();

  Future<List<WorkItemsTableData>> getByPriority(int priority) =>
      (select(workItemsTable)..where((t) => t.priority.equals(priority)))
          .get();

  Future<List<WorkItemsTableData>> getDirty() =>
      (select(workItemsTable)..where((t) => t.isDirty.equals(true))).get();

  Future<List<WorkItemsTableData>> search(String query) {
    final pattern = '%$query%';
    return (select(workItemsTable)
          ..where((t) => t.name.like(pattern) | t.description.like(pattern)))
        .get();
  }

  Future<int> insertOne(WorkItemsTableCompanion entry) =>
      into(workItemsTable).insert(entry, mode: InsertMode.insertOrReplace);

  Future<bool> updateOne(WorkItemsTableCompanion entry) =>
      update(workItemsTable).replace(entry);

  Future<int> deleteById(String id) =>
      (delete(workItemsTable)..where((t) => t.id.equals(id))).go();

  Future<void> insertAll(List<WorkItemsTableCompanion> entries) async {
    await batch((b) {
      b.insertAll(workItemsTable, entries, mode: InsertMode.insertOrReplace);
    });
  }
}
