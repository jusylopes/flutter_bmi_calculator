import 'package:flutter/material.dart';

Map<int, Color> _color = {
  50: const Color.fromRGBO(90, 4, 8, .1),
  100: const Color.fromRGBO(90, 4, 8, .2),
  200: const Color.fromRGBO(90, 4, 8, .3),
  300: const Color.fromRGBO(90, 4, 8, .4),
  400: const Color.fromRGBO(90, 4, 8, .5),
  500: const Color.fromRGBO(90, 4, 8, .6),
  600: const Color.fromRGBO(90, 4, 8, .7),
  700: const Color.fromRGBO(90, 4, 8, .8),
  800: const Color.fromRGBO(90, 4, 8, .9),
  900: const Color.fromRGBO(90, 4, 8, 1),
};

MaterialColor _colorCustom = MaterialColor(0xFFE50914, _color);

abstract class AppTheme {
  static ThemeData get light => ThemeData(
      primarySwatch: _colorCustom,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      scaffoldBackgroundColor: Colors.white,
      textTheme: TextTheme(
        titleLarge: TextStyle(fontSize: 30.0, color: _colorCustom),
      ));
}
