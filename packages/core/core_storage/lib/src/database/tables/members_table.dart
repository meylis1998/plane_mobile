import 'package:drift/drift.dart';

class MembersTable extends Table {
  TextColumn get id => text()();
  TextColumn get workspaceId => text()();
  TextColumn get userId => text()();
  IntColumn get role => integer()();
  TextColumn get email => text().nullable()();
  TextColumn get displayName => text().nullable()();
  TextColumn get avatar => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
