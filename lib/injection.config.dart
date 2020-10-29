// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'features/presentation/bloc/auth/auth_bloc/auth_bloc.dart';
import 'features/data/data_source/auth_api/rest_client.dart';
import 'features/data/data_source/auth_api/auth_local_data.dart';
import 'features/data/data_source/auth_api/auth_remote_data.dart';
import 'features/domain/repository/auth_repository.dart';
import 'features/data/repository_impl/auth_repository_impl.dart';
import 'core/utils/check_app_state.dart';
import 'features/domain/usecase/check_login.dart';
import 'features/presentation/bloc/home/comment_bloc/comment_bloc.dart';
import 'features/data/data_source/comments_api/comments_client.dart';
import 'features/data/data_source/comments_api/comments_remote.dart';
import 'features/domain/usecase/create_comment_usecase.dart';
import 'features/domain/usecase/create_user_post.dart';
import 'features/domain/usecase/delete_comment_usecase.dart';
import 'features/domain/usecase/delete_post.dart';
import 'features/domain/usecase/edit_comment_usecase.dart';
import 'features/domain/usecase/edit_post.dart';
import 'features/domain/usecase/get_comment_usecase.dart';
import 'features/domain/usecase/get_my_post_usecase.dart';
import 'features/domain/usecase/get_post.dart';
import 'features/data/data_source/image/image_data_source.dart';
import 'injection_module.dart';
import 'features/presentation/bloc/auth/intro_bloc/intro_bloc.dart';
import 'features/domain/usecase/like_post.dart';
import 'features/domain/usecase/login.dart';
import 'features/domain/usecase/logout_usecase.dart';
import 'core/utils/network_info.dart';
import 'features/presentation/bloc/home/post_bloc/post_bloc.dart';
import 'features/data/data_source/post_api/post_client.dart';
import 'features/data/data_source/post_api/post_remote_data.dart';
import 'features/domain/repository/post_repository.dart';
import 'features/data/repository_impl/post_repository_impl.dart';
import 'features/domain/usecase/refresh_token_usecase.dart';
import 'features/domain/usecase/register.dart';
import 'features/domain/usecase/save_user_usecase.dart';
import 'features/domain/usecase/select_image_usecase.dart';

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
  gh.lazySingleton<CommentsRemoteDataSource>(
      () => CommentsRemoteDataSourceImpl(client: get<CommentClient>()));
  gh.lazySingleton<DataConnectionChecker>(
      () => injectionModule.dataConnectionChecker);
  gh.lazySingleton<ImagePicker>(() => injectionModule.imagePicker);
  gh.lazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(get<DataConnectionChecker>()));
  gh.lazySingleton<PostClient>(() => PostClient.create());
  gh.lazySingleton<PostRemoteData>(
      () => PostRemoteDataImpl(client: get<PostClient>()));
  final sharedPreferences = await injectionModule.prefs;
  gh.factory<SharedPreferences>(() => sharedPreferences);
  gh.lazySingleton<AuthLocalDataSource>(() =>
      AuthLocalDataSourceImpl(sharedPreferences: get<SharedPreferences>()));
  gh.lazySingleton<CheckAppState>(
      () => CheckAppState(sharedPreferences: get<SharedPreferences>()));
  gh.lazySingleton<CheckLogin>(
      () => CheckLogin(appState: get<CheckAppState>()));
  gh.lazySingleton<ImageDataSource>(
      () => ImageDataSourceImpl(imagePicker: get<ImagePicker>()));
  gh.lazySingleton<PostRepository>(() => PostRepositoryImpl(
        localDataSource: get<AuthLocalDataSource>(),
        remoteDataSource: get<PostRemoteData>(),
        networkInfo: get<NetworkInfo>(),
        commentsRemoteDataSource: get<CommentsRemoteDataSource>(),
      ));
  gh.lazySingleton<AuthRepository>(() => AuthRepositoryImpl(
        localDataSource: get<AuthLocalDataSource>(),
        remoteDataSource: get<AuthRemoteDataSource>(),
        networkInfo: get<NetworkInfo>(),
        imageDataSource: get<ImageDataSource>(),
      ));
  gh.lazySingleton<CreateCommentUseCase>(
      () => CreateCommentUseCase(repository: get<PostRepository>()));
  gh.lazySingleton<CreatePostUseCase>(
      () => CreatePostUseCase(repository: get<PostRepository>()));
  gh.lazySingleton<DeleteCommentUseCase>(
      () => DeleteCommentUseCase(repository: get<PostRepository>()));
  gh.lazySingleton<DeletePostUseCase>(
      () => DeletePostUseCase(repository: get<PostRepository>()));
  gh.lazySingleton<EditCommentUseCase>(
      () => EditCommentUseCase(repository: get<PostRepository>()));
  gh.lazySingleton<EditPostUseCase>(
      () => EditPostUseCase(repository: get<PostRepository>()));
  gh.lazySingleton<GetCommentUseCase>(
      () => GetCommentUseCase(repository: get<PostRepository>()));
  gh.lazySingleton<GetMyPostUseCase>(
      () => GetMyPostUseCase(repository: get<PostRepository>()));
  gh.lazySingleton<GetPostUseCase>(
      () => GetPostUseCase(repository: get<PostRepository>()));
  gh.lazySingleton<LikePostUseCase>(
      () => LikePostUseCase(repository: get<PostRepository>()));
  gh.lazySingleton<LoginUseCase>(
      () => LoginUseCase(repository: get<AuthRepository>()));
  gh.lazySingleton<LogoutUseCase>(
      () => LogoutUseCase(repository: get<AuthRepository>()));
  gh.lazySingleton<RefreshTokenUseCase>(
      () => RefreshTokenUseCase(repository: get<AuthRepository>()));
  gh.lazySingleton<RegisterUseCase>(
      () => RegisterUseCase(repository: get<AuthRepository>()));
  gh.lazySingleton<SaveUserUseCase>(
      () => SaveUserUseCase(repository: get<AuthRepository>()));
  gh.lazySingleton<SelectImageUseCase>(
      () => SelectImageUseCase(repository: get<AuthRepository>()));
  gh.factory<AuthBloc>(() => AuthBloc(
      loginUseCase: get<LoginUseCase>(),
      registerUseCase: get<RegisterUseCase>()));
  gh.factory<CommentBloc>(() => CommentBloc(
        getCommentUseCase: get<GetCommentUseCase>(),
        createCommentUseCase: get<CreateCommentUseCase>(),
        editCommentUseCase: get<EditCommentUseCase>(),
        deleteCommentUseCase: get<DeleteCommentUseCase>(),
      ));
  gh.factory<IntroBloc>(() => IntroBloc(
        isLoggedIn: get<CheckLogin>(),
        logoutUseCase: get<LogoutUseCase>(),
        refreshTokenUseCase: get<RefreshTokenUseCase>(),
      ));
  gh.factory<PostBloc>(() => PostBloc(
        getPost: get<GetPostUseCase>(),
        createPostUseCase: get<CreatePostUseCase>(),
        getMyPostUseCase: get<GetMyPostUseCase>(),
        selectImageUseCase: get<SelectImageUseCase>(),
        likePostUseCase: get<LikePostUseCase>(),
        editPostUseCase: get<EditPostUseCase>(),
        deletePostUseCase: get<DeletePostUseCase>(),
        logoutUseCase: get<LogoutUseCase>(),
      ));
  return get;
}

class _$InjectionModule extends InjectionModule {}
