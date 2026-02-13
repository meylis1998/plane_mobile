import 'package:core_storage/src/database/plane_database.dart';
import 'package:core_storage/src/database/tables/comments_table.dart';
import 'package:drift/drift.dart';

part 'comment_dao.g.dart';

@DriftAccessor(tables: [CommentsTable])
class CommentDao extends DatabaseAccessor<PlaneDatabase>
    with _$CommentDaoMixin {
  CommentDao(super.db);

  Future<List<CommentsTableData>> getAll() => select(commentsTable).get();

  Future<CommentsTableData?> getById(String id) =>
      (select(commentsTable)..where((t) => t.id.equals(id)))
          .getSingleOrNull();

  Future<List<CommentsTableData>> getByWorkItem(String workItemId) =>
      (select(commentsTable)
            ..where((t) => t.workItemId.equals(workItemId))
            ..orderBy([(t) => OrderingTerm.desc(t.createdAt)]))
          .get();

  Stream<List<CommentsTableData>> watchByWorkItem(String workItemId) =>
      (select(commentsTable)
            ..where((t) => t.workItemId.equals(workItemId))
            ..orderBy([(t) => OrderingTerm.desc(t.createdAt)]))
          .watch();

  Future<int> insertOne(CommentsTableCompanion entry) =>
      into(commentsTable).insert(entry, mode: InsertMode.insertOrReplace);

  Future<bool> updateOne(CommentsTableCompanion entry) =>
      update(commentsTable).replace(entry);

  Future<int> deleteById(String id) =>
      (delete(commentsTable)..where((t) => t.id.equals(id))).go();

  Future<void> insertAll(List<CommentsTableCompanion> entries) async {
    await batch((b) {
      b.insertAll(commentsTable, entries, mode: InsertMode.insertOrReplace);
    });
  }
}
