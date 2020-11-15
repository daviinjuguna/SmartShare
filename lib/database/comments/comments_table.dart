import 'package:moor_flutter/moor_flutter.dart';

@DataClassName("CommentsDataClass")

class CommentTable extends Table {
  IntColumn get id => integer()();
  IntColumn get userId => integer()();
  IntColumn get postId => integer()();
  TextColumn get comment => text()();
  TextColumn get createdAt => text()();
  TextColumn get updatedAt => text()();
  TextColumn get user => text()();

  @override
  Set<Column> get primaryKey => {id};
}