import 'package:bmi_calculator/providers/bmi_provider.dart';
import 'package:bmi_calculator/screens/home_screen.dart';
import 'package:bmi_calculator/screens/result_bmi_screen.dart';
import 'package:bmi_calculator/screens/widgets/image_gender_bmi.dart';
import 'package:bmi_calculator/screens/widgets/slider_height.dart';
import 'package:bmi_calculator/screens/widgets/slider_weight.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BmiScreen extends StatelessWidget {
  const BmiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bmiProvider = Provider.of<BmiProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Select your size and weight',
            maxLines: 2, textAlign: TextAlign.center),
        actions: [
          IconButton(
            icon: const Icon(Icons.arrow_forward_ios),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const ResultBmiScreen()),
              );
            },
          ),
        ],
        leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomeScreen(),
                ),
              );
            }),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ImageGenderBmi(bmiProvider: bmiProvider),
              const SizedBox(width: 15),
              SliderHeight(bmiProvider: bmiProvider),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            '${bmiProvider.weight.toInt()} Kg',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          SliderWeight(bmiProvider: bmiProvider),
        ],
      ),
    );
  }
}
