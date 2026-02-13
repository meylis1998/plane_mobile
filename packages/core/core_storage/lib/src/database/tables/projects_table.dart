import 'package:drift/drift.dart';

class ProjectsTable extends Table {
  TextColumn get id => text()();
  TextColumn get workspaceId => text()();
  TextColumn get name => text()();
  TextColumn get description => text().nullable()();
  TextColumn get identifier => text().nullable()();
  TextColumn get emoji => text().nullable()();
  TextColumn get coverImage => text().nullable()();
  IntColumn get network => integer().withDefault(const Constant(0))();
  BoolColumn get isArchived => boolean().withDefault(const Constant(false))();
  BoolColumn get isFavorite => boolean().withDefault(const Constant(false))();
  DateTimeColumn get createdAt => dateTime().nullable()();
  DateTimeColumn get updatedAt => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
