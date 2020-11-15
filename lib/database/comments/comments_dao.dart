import 'package:SmartShare/database/comments/comments_table.dart';
import 'package:SmartShare/database/smart_share_database.dart';
import 'package:injectable/injectable.dart';
import 'package:moor_flutter/moor_flutter.dart';

part 'comments_dao.g.dart';

@UseDao(tables: [CommentTable])
@lazySingleton
class CommentDao extends DatabaseAccessor<SmartShareDatabase>
    with _$CommentDaoMixin {
  CommentDao(SmartShareDatabase db) : super(db);

  Future<List<CommentsDataClass>> getComments() => select(commentTable).get();
  Future<List<CommentsDataClass>> getComment(int id) =>
      (select(commentTable)..where((tbl) => tbl.id.equals(id))).get();

  Future insertComment(CommentsDataClass comments) =>
      into(commentTable).insert(comments);
  Future deleteAll() => delete(commentTable).go();
}
