import 'package:bmi_calculator/controllers/bmi_controller.dart';
import 'package:bmi_calculator/controllers/favorite_controller.dart';
import 'package:bmi_calculator/repository/bmi_favorite_repository.dart';
import 'package:bmi_calculator/view/home_screen.dart';
import 'package:bmi_calculator/utils/constants.dart';
import 'package:bmi_calculator/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<BmiController>(
          create: (_) => BmiController(),
        ),
        ChangeNotifierProvider<FavoriteController>(
          create: (_) => FavoriteController(BmiFavoriteRepository()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: Constants.appName,
        home: const HomeScreen(),
        theme: AppTheme.light,
      ),
    );
  }
}
