import 'package:core_storage/src/database/plane_database.dart';
import 'package:core_storage/src/database/tables/members_table.dart';
import 'package:drift/drift.dart';

part 'member_dao.g.dart';

@DriftAccessor(tables: [MembersTable])
class MemberDao extends DatabaseAccessor<PlaneDatabase>
    with _$MemberDaoMixin {
  MemberDao(super.db);

  Future<List<MembersTableData>> getAll() =>
      select(membersTable).get();

  Future<MembersTableData?> getById(String id) =>
      (select(membersTable)..where((t) => t.id.equals(id)))
          .getSingleOrNull();

  Future<List<MembersTableData>> getByWorkspace(String workspaceId) =>
      (select(membersTable)..where((t) => t.workspaceId.equals(workspaceId)))
          .get();

  Future<int> insertOne(MembersTableCompanion entry) =>
      into(membersTable).insert(entry, mode: InsertMode.insertOrReplace);

  Future<bool> updateOne(MembersTableCompanion entry) =>
      update(membersTable).replace(entry);

  Future<int> deleteById(String id) =>
      (delete(membersTable)..where((t) => t.id.equals(id))).go();

  Future<void> insertAll(List<MembersTableCompanion> entries) async {
    await batch((b) {
      b.insertAll(membersTable, entries, mode: InsertMode.insertOrReplace);
    });
  }
}
