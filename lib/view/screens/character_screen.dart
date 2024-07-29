import 'package:bmi_calculator/controllers/bmi_controller.dart';
import 'package:bmi_calculator/models/character.dart';
import 'package:bmi_calculator/view/components/components.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CharacterScreen extends StatelessWidget {
  const CharacterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bmiController = Provider.of<BmiController>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(right: 30),
          child: Text(
            'Selecione um personagem',
            maxLines: 2,
            textAlign: TextAlign.center,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.more_vert_rounded),
          onPressed: () {},
        ),
      ),
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
