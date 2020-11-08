import 'package:SmartShare/database/my_post/my_post_table.dart';
import 'package:SmartShare/database/smart_share_database.dart';
import 'package:injectable/injectable.dart';
import 'package:moor_flutter/moor_flutter.dart';

part 'my_post_dao.g.dart';

@UseDao(tables:[MyPostTable])
@lazySingleton
class MyPostDao extends DatabaseAccessor<SmartShareDatabase> with _$MyPostDaoMixin {
  MyPostDao(SmartShareDatabase db) : super(db);
  
  Future<List<MyPost>> getMyPosts() => select(myPostTable).get();
  Future<List<MyPost>> getMyPost(String user) =>
  (select(myPostTable)..where((tbl) => tbl.user.equals(user))).get();

  Future insertMyPost(MyPost myPost) => 
  into(myPostTable).insert(myPost);
  Future deleteAll() => delete(myPostTable).go();
}