import 'package:bmi_calculator/controllers/bmi_controller.dart';
import 'package:bmi_calculator/view/select_character_screen.dart';
import 'package:bmi_calculator/view/result_bmi_screen.dart';
import 'package:bmi_calculator/view/components/animation_character_bmi.dart';
import 'package:bmi_calculator/view/components/slider_height.dart';
import 'package:bmi_calculator/view/components/slider_weight.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BmiCalculatorScreen extends StatelessWidget {
  const BmiCalculatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bmiController = Provider.of<BmiController>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Selecione seu peso e altura',
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
                  builder: (context) => const SelectCharacterScreen(),
                ),
              );
            }),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimationCharacterBmi(character: bmiController.selectedCharacter),
              const SizedBox(width: 5),
              SliderHeight(bmiController: bmiController),
            ],
          ),
          SliderWeight(bmiController: bmiController),
        ],
      ),
    );
  }
}
