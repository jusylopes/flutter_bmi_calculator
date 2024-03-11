import 'package:bmi_calculator/models/bmi_model.dart';
import 'package:bmi_calculator/utils/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class AnimationCharacterBmi extends StatelessWidget {
  const AnimationCharacterBmi({
    Key? key,
    required this.character,
  }) : super(key: key);

  final Character character;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 1.7,
      width: MediaQuery.of(context).size.width / 1.7,
      child: RiveAnimation.asset(
        AssetsManager.getCharacterAsset(character, true),
      ),
    );
  }
}
