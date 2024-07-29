import 'package:bmi_calculator/utils/assets_manager.dart';
import 'package:bmi_calculator/utils/colors.dart';
import 'package:bmi_calculator/utils/no_transitions_screen.dart';
import 'package:flutter/material.dart';

abstract class AppTheme {
  static ThemeData get light => ThemeData(
        primarySwatch: AppColors.colorPrimarySwatch,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: AssetsManager.fontFamily,
        scaffoldBackgroundColor: AppColors.colorBackground,
        appBarTheme: const AppBarTheme(
          elevation: 0,
          centerTitle: true,
          toolbarHeight: 80,
          backgroundColor: Colors.transparent,
          titleTextStyle: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 33),
        ),
        snackBarTheme: const SnackBarThemeData(
            contentTextStyle: TextStyle(color: Colors.white)),
        textTheme: _buildTextTheme(),
        pageTransitionsTheme: PageTransitionsTheme(
          builders: {
            TargetPlatform.android: NoTransitionsScreen(),
            TargetPlatform.iOS: NoTransitionsScreen(),
          },
        ),
      );

  static TextTheme _buildTextTheme() {
    return const TextTheme(
      titleLarge: TextStyle(
        fontSize: 38.0,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      titleMedium: TextStyle(
        fontSize: 22.0,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      titleSmall: TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
    );
  }
}
