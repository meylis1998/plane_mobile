import 'package:drift/drift.dart';

class CommentsTable extends Table {
  TextColumn get id => text()();
  TextColumn get workItemId => text()();
  TextColumn get body => text()();
  TextColumn get createdById => text().nullable()();
  DateTimeColumn get createdAt => dateTime().nullable()();
  DateTimeColumn get updatedAt => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
