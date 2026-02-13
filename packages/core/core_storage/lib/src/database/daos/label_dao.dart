import 'package:core_storage/src/database/plane_database.dart';
import 'package:core_storage/src/database/tables/labels_table.dart';
import 'package:drift/drift.dart';

part 'label_dao.g.dart';

@DriftAccessor(tables: [LabelsTable])
class LabelDao extends DatabaseAccessor<PlaneDatabase> with _$LabelDaoMixin {
  LabelDao(super.db);

  Future<List<LabelsTableData>> getAll() => select(labelsTable).get();

  Future<LabelsTableData?> getById(String id) =>
      (select(labelsTable)..where((t) => t.id.equals(id))).getSingleOrNull();

  Future<List<LabelsTableData>> getByProject(String projectId) =>
      (select(labelsTable)..where((t) => t.projectId.equals(projectId))).get();

  Stream<List<LabelsTableData>> watchByProject(String projectId) =>
      (select(labelsTable)..where((t) => t.projectId.equals(projectId)))
          .watch();

  Future<int> insertOne(LabelsTableCompanion entry) =>
      into(labelsTable).insert(entry, mode: InsertMode.insertOrReplace);

  Future<bool> updateOne(LabelsTableCompanion entry) =>
      update(labelsTable).replace(entry);

  Future<int> deleteById(String id) =>
      (delete(labelsTable)..where((t) => t.id.equals(id))).go();

  Future<void> insertAll(List<LabelsTableCompanion> entries) async {
    await batch((b) {
      b.insertAll(labelsTable, entries, mode: InsertMode.insertOrReplace);
    });
  }
}
