import 'package:SmartShare/core/routes/router.dart';
import 'package:flutter/material.dart';

class SmartShare extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    MaterialColor colorCustom = MaterialColor(0xfffee56f, color);
    return MaterialApp(
      title: 'SmartShare',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: colorCustom,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: "/",
      onGenerateRoute: RoutesGenerator.generateRoute,
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