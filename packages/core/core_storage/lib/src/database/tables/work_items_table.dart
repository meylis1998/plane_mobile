import 'package:drift/drift.dart';

class WorkItemsTable extends Table {
  TextColumn get id => text()();
  TextColumn get projectId => text()();
  TextColumn get workspaceSlug => text()();
  TextColumn get name => text()();
  TextColumn get description => text().nullable()();
  TextColumn get descriptionHtml => text().nullable()();
  TextColumn get stateId => text().nullable()();
  IntColumn get priority => integer().withDefault(const Constant(4))();
  DateTimeColumn get startDate => dateTime().nullable()();
  DateTimeColumn get targetDate => dateTime().nullable()();
  TextColumn get parentId => text().nullable()();
  IntColumn get sequenceId => integer().nullable()();
  IntColumn get sortOrder => integer().withDefault(const Constant(0))();
  TextColumn get assigneeIds => text().withDefault(const Constant('[]'))();
  TextColumn get labelIds => text().withDefault(const Constant('[]'))();
  TextColumn get cycleId => text().nullable()();
  TextColumn get moduleId => text().nullable()();
  TextColumn get createdById => text().nullable()();
  DateTimeColumn get createdAt => dateTime().nullable()();
  DateTimeColumn get updatedAt => dateTime().nullable()();
  IntColumn get estimate => integer().nullable()();
  BoolColumn get isDirty => boolean().withDefault(const Constant(false))();
  IntColumn get localVersion => integer().withDefault(const Constant(0))();
  IntColumn get serverVersion => integer().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
