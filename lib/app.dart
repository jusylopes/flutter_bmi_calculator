import 'package:bmi_calculator/providers/bmi_provider.dart';
import 'package:bmi_calculator/screens/gender_screen.dart';

import 'package:bmi_calculator/utils/constants.dart';
import 'package:bmi_calculator/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => BmiProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: Constants.appName,
        home: const GenderScreen(),
        theme: AppTheme.light,
      ),
    );
  }
}
