import 'package:SmartShare/database/my_post/my_post_dao.dart';
import 'package:SmartShare/database/my_post/my_post_table.dart';
import 'package:SmartShare/database/post/post_dao.dart';
import 'package:SmartShare/database/post/post_table.dart';
import 'package:injectable/injectable.dart';
import 'package:moor_flutter/moor_flutter.dart';

part 'smart_share_database.g.dart';

@UseMoor(
  tables: [PostsTable,MyPostTable], //!plural..extends table
  daos: [PostDao,MyPostDao],
)
@lazySingleton
class SmartShareDatabase extends _$SmartShareDatabase {
  SmartShareDatabase()
      : super(
          (FlutterQueryExecutor.inDatabaseFolder(
            path: 'db.sqlite',
            logStatements: true,
            
          )),
        ){moorRuntimeOptions.dontWarnAboutMultipleDatabases = true;}

  @override
  int get schemaVersion => 1;
}
