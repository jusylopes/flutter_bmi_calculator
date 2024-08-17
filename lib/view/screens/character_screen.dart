import 'package:bmi_calculator/controllers/bmi_controller.dart';
import 'package:bmi_calculator/models/character.dart';
import 'package:bmi_calculator/utils/utils.dart';
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
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ImageCharacter(
                bmiController: bmiController,
                character: Character.girl,
                characterAsset: AssetsManager.characterGirl,
              ),
              ImageCharacter(
                  bmiController: bmiController,
                  character: Character.monster,
                  characterAsset: AssetsManager.characterMonster),
              ImageCharacter(
                bmiController: bmiController,
                character: Character.boy,
                characterAsset: AssetsManager.characterBoy,
              ),
              ImageCharacter(
                  bmiController: bmiController,
                  character: Character.ogre,
                  characterAsset: AssetsManager.characterOgre),
            ],
          ),
        ),
      ),
    );
  }
}
