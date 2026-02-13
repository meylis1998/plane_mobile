import 'package:drift/drift.dart';

class WorkspacesTable extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get slug => text()();
  TextColumn get logo => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
