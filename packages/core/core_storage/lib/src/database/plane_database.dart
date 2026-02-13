import 'package:core_storage/src/database/daos/comment_dao.dart';
import 'package:core_storage/src/database/daos/cycle_dao.dart';
import 'package:core_storage/src/database/daos/label_dao.dart';
import 'package:core_storage/src/database/daos/member_dao.dart';
import 'package:core_storage/src/database/daos/module_dao.dart';
import 'package:core_storage/src/database/daos/project_dao.dart';
import 'package:core_storage/src/database/daos/state_dao.dart';
import 'package:core_storage/src/database/daos/sync_queue_dao.dart';
import 'package:core_storage/src/database/daos/work_item_dao.dart';
import 'package:core_storage/src/database/daos/workspace_dao.dart';
import 'package:core_storage/src/database/tables/comments_table.dart';
import 'package:core_storage/src/database/tables/cycles_table.dart';
import 'package:core_storage/src/database/tables/labels_table.dart';
import 'package:core_storage/src/database/tables/members_table.dart';
import 'package:core_storage/src/database/tables/modules_table.dart';
import 'package:core_storage/src/database/tables/projects_table.dart';
import 'package:core_storage/src/database/tables/states_table.dart';
import 'package:core_storage/src/database/tables/sync_queue_table.dart';
import 'package:core_storage/src/database/tables/work_items_table.dart';
import 'package:core_storage/src/database/tables/workspaces_table.dart';
import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

part 'plane_database.g.dart';

@DriftDatabase(
  tables: [
    WorkspacesTable,
    MembersTable,
    ProjectsTable,
    WorkItemsTable,
    CyclesTable,
    ModulesTable,
    StatesTable,
    LabelsTable,
    CommentsTable,
    SyncQueueTable,
  ],
  daos: [
    WorkspaceDao,
    MemberDao,
    ProjectDao,
    WorkItemDao,
    CycleDao,
    ModuleDao,
    StateDao,
    LabelDao,
    CommentDao,
    SyncQueueDao,
  ],
)
class PlaneDatabase extends _$PlaneDatabase {
  PlaneDatabase([QueryExecutor? executor])
      : super(executor ?? _openConnection());

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (Migrator m) async {
          await m.createAll();
        },
        onUpgrade: (Migrator m, int from, int to) async {
          // Future migrations go here.
        },
      );

  static QueryExecutor _openConnection() {
    return driftDatabase(name: 'plane_db');
  }

  Future<void> clearAllTables() async {
    await transaction(() async {
      for (final table in allTables) {
        await delete(table).go();
      }
    });
  }
}
