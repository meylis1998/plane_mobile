import 'package:drift/drift.dart';

class CyclesTable extends Table {
  TextColumn get id => text()();
  TextColumn get projectId => text()();
  TextColumn get name => text()();
  TextColumn get description => text().nullable()();
  DateTimeColumn get startDate => dateTime().nullable()();
  DateTimeColumn get endDate => dateTime().nullable()();
  IntColumn get status => integer().withDefault(const Constant(0))();
  IntColumn get totalIssues => integer().nullable()();
  IntColumn get completedIssues => integer().nullable()();
  RealColumn get progress => real().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
