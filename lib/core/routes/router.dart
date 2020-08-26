import 'package:SmartShare/features/presentation/pages/intro/welcome_page.dart';
import 'package:SmartShare/features/presentation/pages/login/login_page.dart';
import 'package:SmartShare/features/presentation/pages/register/register_page.dart';
import 'package:auto_route/auto_route_annotations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// @MaterialAutoRouter(
//   generateNavigationHelperExtension: true,
//   routes: <AutoRoute>[
//     // CupertinoRoute(page: SplashPage, initial: true),
//     CupertinoRoute(page: WelcomePage,),
//     MaterialRoute(page: LoginPage),
//     MaterialRoute(page: RegisterPage),
    
//   ]
// )


// class $Router {
  
// }

class RoutesGenerator {
  static Route<dynamic> generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      // case '/':
      //   return CupertinoPageRoute(builder: (_) => SplashScreen());
      case '/':
        return CupertinoPageRoute(builder: (_) => WelcomePage());
      case '/register':
        return CupertinoPageRoute(builder: (_) => RegisterPage());
      case '/login':
        return CupertinoPageRoute(builder: (_) => LoginPage());
      default:
        // If there is no such named route in the switch statement, e.g. /third
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return CupertinoPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}