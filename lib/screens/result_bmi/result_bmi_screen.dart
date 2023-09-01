import 'package:bmi_calculator/models/bmi_model.dart';
import 'package:bmi_calculator/providers/bmi_provider.dart';
import 'package:bmi_calculator/utils/assets_manager.dart';
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
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Your BMI is', style: Theme.of(context).textTheme.titleLarge),
          Consumer<BmiProvider>(builder: (context, bmi, child) {
            return Column(
              children: [
                Text(
                  bmi.bmiValue.toStringAsFixed(2),
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    bmi.selectedGender == Gender.MALE
                        ? AssetsManager.imageMale
                        : AssetsManager.imageFemale,
                    fit: BoxFit.fill,
                    color: bmi.getResultColor(),
                    height: MediaQuery.of(context).size.height / 3,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    bmi.getResultString(),
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ),
              ],
            );
          }),
          ElevatedButton(
            onPressed: () => _recalculateBMI(context),
            style: ElevatedButton.styleFrom(shape: const StadiumBorder()),
            child: Text(
              'Recalculate your BMI',
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ),
        ],
      ),
    ));
  }
}
