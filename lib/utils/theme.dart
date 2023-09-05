import 'package:bmi_calculator/utils/colors.dart';
import 'package:bmi_calculator/utils/no_transitions_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppTheme {
  static ThemeData get light => ThemeData(
        primarySwatch: AppColors.colorPrimarySwatch,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: GoogleFonts.robotoCondensed().fontFamily,
        scaffoldBackgroundColor: AppColors.colorBackground,
        appBarTheme: AppBarTheme(
          elevation: 0,
          centerTitle: true,
          toolbarHeight: 100,
          backgroundColor: Colors.transparent,
          titleTextStyle: TextStyle(
              fontFamily: GoogleFonts.robotoCondensed().fontFamily,
              fontSize: 33.0,
              color: Colors.black,
              fontWeight: FontWeight.bold),
        ),
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
