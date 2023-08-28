import 'package:bmi_calculator/providers/bmi_provider.dart';
import 'package:bmi_calculator/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => BmiProvider(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'BMI Calculator',
        home: SplashScreen(),
      ),
    );
  }
}
