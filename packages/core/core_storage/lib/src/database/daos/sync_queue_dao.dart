import 'package:core_storage/src/database/plane_database.dart';
import 'package:core_storage/src/database/tables/sync_queue_table.dart';
import 'package:drift/drift.dart';

part 'sync_queue_dao.g.dart';

@DriftAccessor(tables: [SyncQueueTable])
class SyncQueueDao extends DatabaseAccessor<PlaneDatabase>
    with _$SyncQueueDaoMixin {
  SyncQueueDao(super.db);

  Future<int> insertEntry(SyncQueueTableCompanion entry) =>
      into(syncQueueTable).insert(entry);

  Future<SyncQueueTableData?> getNext() => (select(syncQueueTable)
        ..orderBy([
          (t) => OrderingTerm.desc(t.priority),
          (t) => OrderingTerm.asc(t.createdAt),
        ])
        ..limit(1))
      .getSingleOrNull();

  Future<List<SyncQueueTableData>> getPending({int limit = 10}) =>
      (select(syncQueueTable)
            ..orderBy([
              (t) => OrderingTerm.desc(t.priority),
              (t) => OrderingTerm.asc(t.createdAt),
            ])
            ..limit(limit))
          .get();

  Future<void> markAttempted(int id) async {
    final entry = await (select(syncQueueTable)
          ..where((t) => t.id.equals(id)))
        .getSingleOrNull();
    if (entry != null) {
      await (update(syncQueueTable)..where((t) => t.id.equals(id))).write(
        SyncQueueTableCompanion(
          attempts: Value(entry.attempts + 1),
          lastAttemptAt: Value(DateTime.now()),
        ),
      );
    }
  }

  Future<int> remove(int id) =>
      (delete(syncQueueTable)..where((t) => t.id.equals(id))).go();

  Future<int> getPendingCount() async {
    final count = countAll();
    final query = selectOnly(syncQueueTable)..addColumns([count]);
    final result = await query.getSingle();
    return result.read(count) ?? 0;
  }

  Future<int> removeAll() => delete(syncQueueTable).go();
}
