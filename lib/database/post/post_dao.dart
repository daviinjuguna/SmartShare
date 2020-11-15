import 'package:SmartShare/database/post/post_table.dart';
import 'package:SmartShare/database/smart_share_database.dart';
import 'package:injectable/injectable.dart';
import 'package:moor_flutter/moor_flutter.dart';
part 'post_dao.g.dart';

@UseDao(tables: [PostsTable]) //!plural
@lazySingleton
class PostDao extends DatabaseAccessor<SmartShareDatabase> with _$PostDaoMixin {
  PostDao(SmartShareDatabase db) : super(db);

  Future<List<PostTable>> getPosts() => select(postsTable).get();
  Future<List<PostTable>> getPost(int id) =>
      (select(postsTable)..where((tbl) => tbl.id.equals(id))).get();

  Future insertPost(PostTable post) => into(postsTable).insert(post);
  Future deleteAll() => delete(postsTable).go();
}

//! in future....singular then returns the plural table
