import 'package:bmi_calculator/models/character.dart';
import 'package:bmi_calculator/utils/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart' as rive;

class AnimationCharacterBmi extends StatelessWidget {
  const AnimationCharacterBmi({
    super.key,
    required this.character,
  });

  final Character character;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomLeft,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 50),
          child: Image.asset(
            AssetsManager.scale,
            height: MediaQuery.of(context).size.height / 10,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 40),
          child: rive.RiveAnimation.asset(
            AssetsManager.getCharacterAsset(character),
          ),
        ),
      ],
    );
  }
}
