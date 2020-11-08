import 'package:moor_flutter/moor_flutter.dart';

@DataClassName("MyPost")
class MyPostTable extends Table {
  TextColumn get post => text()();
  TextColumn get user => text()();

  @override
  Set<Column> get primaryKey => {user};
}