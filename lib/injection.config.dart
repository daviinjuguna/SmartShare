// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'features/data/data_source/auth_api/rest_client.dart';
import 'features/data/data_source/auth_api/auth_local_data.dart';
import 'features/data/data_source/comments_api/comments_client.dart';
import 'injection_module.dart';
import 'features/data/data_source/post_api/post_client.dart';

/// adds generated dependencies
/// to the provided [GetIt] instance

Future<GetIt> $initGetIt(
  GetIt get, {
  String environment,
  EnvironmentFilter environmentFilter,
}) async {
  final gh = GetItHelper(get, environment, environmentFilter);
  final injectionModule = _$InjectionModule();
  gh.lazySingleton<AuthClient>(() => AuthClient.create());
  gh.lazySingleton<CommentClient>(() => CommentClient.create());
  gh.lazySingleton<DataConnectionChecker>(
      () => injectionModule.dataConnectionChecker);
  gh.lazySingleton<PostClient>(() => PostClient.create());
  final sharedPreferences = await injectionModule.prefs;
  gh.factory<SharedPreferences>(() => sharedPreferences);
  gh.lazySingleton<AuthLocalDataSource>(() =>
      AuthLocalDataSourceImpl(sharedPreferences: get<SharedPreferences>()));
  return get;
}

class _$InjectionModule extends InjectionModule {}
