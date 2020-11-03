import 'package:SmartShare/features/presentation/pages/auth/change_password.dart';
import 'package:SmartShare/features/presentation/pages/auth/login_page.dart';
import 'package:SmartShare/features/presentation/pages/auth/recover_password.dart';
import 'package:SmartShare/features/presentation/pages/auth/register_page.dart';
import 'package:SmartShare/features/presentation/pages/auth/save_user_info.dart';
import 'package:SmartShare/features/presentation/pages/core/splash_screen.dart';
import 'package:SmartShare/features/presentation/pages/home/comments_screen.dart';
import 'package:SmartShare/features/presentation/pages/home/dashboard_screen.dart';
import 'package:SmartShare/features/presentation/pages/home/new_post.dart';
import 'package:SmartShare/features/presentation/pages/intro/welcome_page.dart';
import 'package:auto_route/auto_route_annotations.dart';

@MaterialAutoRouter(
    generateNavigationHelperExtension: true,
    routes: <AutoRoute>[
      MaterialRoute(page: SplashScreen, initial: true),
      MaterialRoute(page: WelcomePage),
      MaterialRoute(page: RegisterPage),
      MaterialRoute(page: LoginPage),
      MaterialRoute(page: RecoverPassword),
      MaterialRoute(page: ChangePassword),
      MaterialRoute(page: DashboardScreen),
      MaterialRoute(page: NewPostPage),
      MaterialRoute(page: SaveUserInfoScreen),
      MaterialRoute(page: CommentsScreen)
    ])
class $Router {}
