import 'package:bmi_calculator/controllers/bmi_controller.dart';
import 'package:bmi_calculator/view/home_screen.dart';

import 'package:bmi_calculator/utils/constants.dart';
import 'package:bmi_calculator/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => BmiController(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: Constants.appName,
        home: const HomeScreen(),
        theme: AppTheme.light,
      ),
    );
  }
}
