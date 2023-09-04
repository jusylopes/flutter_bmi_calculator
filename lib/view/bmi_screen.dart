import 'package:bmi_calculator/controllers/bmi_controller.dart';
import 'package:bmi_calculator/view/home_screen.dart';
import 'package:bmi_calculator/view/result_bmi_screen.dart';
import 'package:bmi_calculator/view/components/image_gender_bmi.dart';
import 'package:bmi_calculator/view/components/slider_height.dart';
import 'package:bmi_calculator/view/components/slider_weight.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BmiScreen extends StatelessWidget {
  const BmiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bmiController = Provider.of<BmiController>(context);

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
              ImageGenderBmi(bmiController: bmiController),
              const SizedBox(width: 15),
              SliderHeight(bmiController: bmiController),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            '${bmiController.weight.toInt()} Kg',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          SliderWeight(bmiController: bmiController),
        ],
      ),
    );
  }
}
