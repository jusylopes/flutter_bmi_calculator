import 'package:bmi_calculator/blocs/character/character_cubit.dart';
import 'package:bmi_calculator/models/character.dart';
import 'package:bmi_calculator/controllers/bmi_controller.dart';
import 'package:bmi_calculator/view/screens/bmi_calculator_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImageCharacter extends StatelessWidget {
  const ImageCharacter(
      {super.key,
      required this.bmiController,
      required this.character,
      required this.characterAsset});

  final BmiController bmiController;
  final Character character;
  final String characterAsset;

  @override
  Widget build(BuildContext context) {
    double opacity = 1.0;

    return GestureDetector(
      onTap: () {
        context.read<CharacterCubit>().saveCharacter(character);

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const BmiCalculatorScreen(),
          ),
        );
      },
      child: CircleAvatar(
        radius: 80,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: AnimatedOpacity(
            opacity: opacity,
            duration: const Duration(milliseconds: 100),
            child: Image.asset(
              characterAsset,
              fit: BoxFit.cover,
              alignment: Alignment.bottomCenter,
              height: 180,
              filterQuality: FilterQuality.low,
            ),
          ),
        ),
      ),
    );
  }
}
