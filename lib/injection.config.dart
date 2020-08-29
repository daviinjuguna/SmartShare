// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'features/presentation/bloc/auth/auth_bloc/auth_bloc.dart';
import 'features/data/data_source/auth_api/rest_client.dart';
import 'features/data/data_source/auth_api/auth_local_data.dart';
import 'features/data/data_source/auth_api/auth_remote_data.dart';
import 'features/domain/repository/auth_repository.dart';
import 'features/data/repository_impl/auth_repository_impl.dart';
import 'core/utils/check_app_state.dart';
import 'features/domain/usecase/check_login.dart';
import 'features/data/data_source/comments_api/comments_client.dart';
import 'injection_module.dart';
import 'features/presentation/bloc/auth/intro_bloc/intro_bloc.dart';
import 'core/utils/network_info.dart';
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
  gh.lazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(client: get<AuthClient>()));
  gh.lazySingleton<CommentClient>(() => CommentClient.create());
  gh.lazySingleton<DataConnectionChecker>(
      () => injectionModule.dataConnectionChecker);
  gh.lazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(get<DataConnectionChecker>()));
  gh.lazySingleton<PostClient>(() => PostClient.create());
  final sharedPreferences = await injectionModule.prefs;
  gh.factory<SharedPreferences>(() => sharedPreferences);
  gh.lazySingleton<AuthLocalDataSource>(() =>
      AuthLocalDataSourceImpl(sharedPreferences: get<SharedPreferences>()));
  gh.lazySingleton<AuthRepository>(() => AuthRepositoryImpl(
        localDataSource: get<AuthLocalDataSource>(),
        remoteDataSource: get<AuthRemoteDataSource>(),
        networkInfo: get<NetworkInfo>(),
      ));
  gh.lazySingleton<CheckAppState>(
      () => CheckAppState(sharedPreferences: get<SharedPreferences>()));
  gh.factory<CheckLogin>(() => CheckLogin(appState: get<CheckAppState>()));
  gh.factory<IntroBloc>(() => IntroBloc(
      isLoggedIn: get<CheckLogin>(), repository: get<AuthRepository>()));
  gh.factory<AuthBloc>(() => AuthBloc(repository: get<AuthRepository>()));
  return get;
}

class _$InjectionModule extends InjectionModule {}
