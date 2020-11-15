// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../features/domain/entities/home/get_my_post.dart';
import '../../features/domain/entities/home/get_post.dart';
import '../../features/presentation/pages/auth/change_password.dart';
import '../../features/presentation/pages/auth/login_page.dart';
import '../../features/presentation/pages/auth/recover_password.dart';
import '../../features/presentation/pages/auth/register_page.dart';
import '../../features/presentation/pages/auth/save_user_info.dart';
import '../../features/presentation/pages/core/splash_screen.dart';
import '../../features/presentation/pages/home/comments_screen.dart';
import '../../features/presentation/pages/home/dashboard_screen.dart';
import '../../features/presentation/pages/home/new_post.dart';
import '../../features/presentation/pages/intro/welcome_page.dart';

class Routes {
  static const String splashScreen = '/';
  static const String welcomePage = '/welcome-page';
  static const String registerPage = '/register-page';
  static const String loginPage = '/login-page';
  static const String recoverPassword = '/recover-password';
  static const String changePassword = '/change-password';
  static const String dashboardScreen = '/dashboard-screen';
  static const String newPostPage = '/new-post-page';
  static const String saveUserInfoScreen = '/save-user-info-screen';
  static const String commentsScreen = '/comments-screen';
  static const all = <String>{
    splashScreen,
    welcomePage,
    registerPage,
    loginPage,
    recoverPassword,
    changePassword,
    dashboardScreen,
    newPostPage,
    saveUserInfoScreen,
    commentsScreen,
  };
}

class Router extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.splashScreen, page: SplashScreen),
    RouteDef(Routes.welcomePage, page: WelcomePage),
    RouteDef(Routes.registerPage, page: RegisterPage),
    RouteDef(Routes.loginPage, page: LoginPage),
    RouteDef(Routes.recoverPassword, page: RecoverPassword),
    RouteDef(Routes.changePassword, page: ChangePassword),
    RouteDef(Routes.dashboardScreen, page: DashboardScreen),
    RouteDef(Routes.newPostPage, page: NewPostPage),
    RouteDef(Routes.saveUserInfoScreen, page: SaveUserInfoScreen),
    RouteDef(Routes.commentsScreen, page: CommentsScreen),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    SplashScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => SplashScreen(),
        settings: data,
      );
    },
    WelcomePage: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => WelcomePage(),
        settings: data,
      );
    },
    RegisterPage: (data) {
      final args = data.getArgs<RegisterPageArguments>(
        orElse: () => RegisterPageArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => RegisterPage(key: args.key),
        settings: data,
      );
    },
    LoginPage: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => LoginPage(),
        settings: data,
      );
    },
    RecoverPassword: (data) {
      final args = data.getArgs<RecoverPasswordArguments>(
        orElse: () => RecoverPasswordArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => RecoverPassword(key: args.key),
        settings: data,
      );
    },
    ChangePassword: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => ChangePassword(),
        settings: data,
      );
    },
    DashboardScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => DashboardScreen(),
        settings: data,
      );
    },
    NewPostPage: (data) {
      final args = data.getArgs<NewPostPageArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => NewPostPage(
          key: args.key,
          bloc: args.bloc,
        ),
        settings: data,
      );
    },
    SaveUserInfoScreen: (data) {
      final args = data.getArgs<SaveUserInfoScreenArguments>(
        orElse: () => SaveUserInfoScreenArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => SaveUserInfoScreen(key: args.key),
        settings: data,
      );
    },
    CommentsScreen: (data) {
      final args = data.getArgs<CommentsScreenArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => CommentsScreen(
          key: args.key,
          post: args.post,
          myPost: args.myPost,
          postBloc: args.postBloc,
        ),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Navigation helper methods extension
/// *************************************************************************

extension RouterExtendedNavigatorStateX on ExtendedNavigatorState {
  Future<dynamic> pushSplashScreen() => push<dynamic>(Routes.splashScreen);

  Future<dynamic> pushWelcomePage() => push<dynamic>(Routes.welcomePage);

  Future<dynamic> pushRegisterPage({
    Key key,
  }) =>
      push<dynamic>(
        Routes.registerPage,
        arguments: RegisterPageArguments(key: key),
      );

  Future<dynamic> pushLoginPage() => push<dynamic>(Routes.loginPage);

  Future<dynamic> pushRecoverPassword({
    Key key,
  }) =>
      push<dynamic>(
        Routes.recoverPassword,
        arguments: RecoverPasswordArguments(key: key),
      );

  Future<dynamic> pushChangePassword() => push<dynamic>(Routes.changePassword);

  Future<dynamic> pushDashboardScreen() =>
      push<dynamic>(Routes.dashboardScreen);

  Future<dynamic> pushNewPostPage({
    Key key,
    @required dynamic bloc,
  }) =>
      push<dynamic>(
        Routes.newPostPage,
        arguments: NewPostPageArguments(key: key, bloc: bloc),
      );

  Future<dynamic> pushSaveUserInfoScreen({
    Key key,
  }) =>
      push<dynamic>(
        Routes.saveUserInfoScreen,
        arguments: SaveUserInfoScreenArguments(key: key),
      );

  Future<dynamic> pushCommentsScreen({
    Key key,
    @required GetPost post,
    @required GetMyPost myPost,
    @required dynamic postBloc,
  }) =>
      push<dynamic>(
        Routes.commentsScreen,
        arguments: CommentsScreenArguments(
            key: key, post: post, myPost: myPost, postBloc: postBloc),
      );
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// RegisterPage arguments holder class
class RegisterPageArguments {
  final Key key;
  RegisterPageArguments({this.key});
}

/// RecoverPassword arguments holder class
class RecoverPasswordArguments {
  final Key key;
  RecoverPasswordArguments({this.key});
}

/// NewPostPage arguments holder class
class NewPostPageArguments {
  final Key key;
  final dynamic bloc;
  NewPostPageArguments({this.key, @required this.bloc});
}

/// SaveUserInfoScreen arguments holder class
class SaveUserInfoScreenArguments {
  final Key key;
  SaveUserInfoScreenArguments({this.key});
}

/// CommentsScreen arguments holder class
class CommentsScreenArguments {
  final Key key;
  final GetPost post;
  final GetMyPost myPost;
  final dynamic postBloc;
  CommentsScreenArguments(
      {this.key,
      @required this.post,
      @required this.myPost,
      @required this.postBloc});
}
