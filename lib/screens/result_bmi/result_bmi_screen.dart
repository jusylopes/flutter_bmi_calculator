import 'package:bmi_calculator/providers/bmi_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../home/home_screen.dart';

class ResultBmiScreen extends StatelessWidget {
  const ResultBmiScreen({super.key});

  void _recalculateBMI(BuildContext context) {
    final bmiProvider = Provider.of<BmiProvider>(context, listen: false);
    bmiProvider.resetValues();

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const HomeScreen()),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Text('Your BMI is', style: Theme.of(context).textTheme.titleLarge),
        Consumer<BmiProvider>(builder: (context, value, child) {
          return Text('${value.bmiValue}');
        }),
        Padding(
          padding: const EdgeInsets.all(20),
          child: ElevatedButton(
            onPressed: () => _recalculateBMI(context),
            child: Text(
              'Recalculate your BMI',
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ),
        ),
      ],
    ));
  }
}
