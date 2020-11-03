import 'package:SmartShare/core/routes/router.gr.dart' as app_router;
import 'package:SmartShare/features/presentation/bloc/auth/intro_bloc/intro_bloc.dart';

import 'package:SmartShare/injection.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';

class SmartShare extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    MaterialColor colorCustom = MaterialColor(0xfffee56f, color);
    FlutterStatusbarcolor.setNavigationBarColor(Colors.white, animate: true);
    FlutterStatusbarcolor.setStatusBarColor(Colors.white, animate: true);
    FlutterStatusbarcolor.setStatusBarWhiteForeground(false);
    FlutterStatusbarcolor.setNavigationBarWhiteForeground(false);

    return BlocProvider(
      create: (context) => getIt<IntroBloc>()..add(const IntroEvent.started()),
      child: MaterialApp(
        title: 'eKonnect',
        debugShowCheckedModeBanner: false,
        builder: ExtendedNavigator(router: app_router.Router()),
        // onGenerateRoute: app_router.Router(),
        theme: ThemeData(
          primarySwatch: colorCustom,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        // initialRoute: "/",
        // onGenerateRoute: RoutesGenerator.generateRoute,
        // home: CommentsScreen(),
      ),
    );
  }
}

Map<int, Color> color = {
  50: Color.fromRGBO(254, 229, 111, .1),
  100: Color.fromRGBO(254, 229, 111, .2),
  200: Color.fromRGBO(254, 229, 111, .3),
  300: Color.fromRGBO(254, 229, 111, .4),
  400: Color.fromRGBO(254, 229, 111, .5),
  500: Color.fromRGBO(254, 229, 111, .6),
  600: Color.fromRGBO(254, 229, 111, .7),
  700: Color.fromRGBO(254, 229, 111, .8),
  800: Color.fromRGBO(254, 229, 111, .9),
  900: Color.fromRGBO(254, 229, 111, 1),
};
