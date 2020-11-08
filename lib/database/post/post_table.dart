import 'package:moor_flutter/moor_flutter.dart';

@DataClassName("PostTable")//!singular
class PostsTable extends Table { //!with an ess...plural
  IntColumn get id => integer()();
  IntColumn get userId => integer()();
  TextColumn get desc => text()();
  TextColumn get photo => text().withDefault(Constant(""))();
  TextColumn get createdAt => text()();
  TextColumn get updatedAt => text()();
  IntColumn get commentsCount => integer()();
  IntColumn get likesCount => integer()();
  BoolColumn get selfLike => boolean()();
  TextColumn get user => text()();
  TextColumn get comments => text()();
  TextColumn get likes => text()();

  @override
  Set<Column> get primaryKey => {id};
}
