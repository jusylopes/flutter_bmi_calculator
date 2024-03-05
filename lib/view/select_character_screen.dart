import 'package:bmi_calculator/models/bmi_model.dart';
import 'package:bmi_calculator/controllers/bmi_controller.dart';
import 'package:bmi_calculator/view/components/image_character.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SelectCharacterScreen extends StatelessWidget {
  const SelectCharacterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bmiController = Provider.of<BmiController>(context);

    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ImageCharacter(
              bmiController: bmiController,
              character: Character.girl,
            ),
            ImageCharacter(
              bmiController: bmiController,
              character: Character.boy,
            ),
          ],
        ),
      ),
    );
  }
}
