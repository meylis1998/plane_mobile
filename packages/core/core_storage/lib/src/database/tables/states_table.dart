import 'package:drift/drift.dart';

class StatesTable extends Table {
  TextColumn get id => text()();
  TextColumn get projectId => text()();
  TextColumn get name => text()();
  IntColumn get groupValue => integer().withDefault(const Constant(0))();
  TextColumn get color => text().nullable()();
  IntColumn get sequence => integer().withDefault(const Constant(0))();

  @override
  Set<Column> get primaryKey => {id};
}
