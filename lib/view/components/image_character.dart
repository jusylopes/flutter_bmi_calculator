import 'package:bmi_calculator/models/bmi_model.dart';
import 'package:bmi_calculator/controllers/bmi_controller.dart';
import 'package:bmi_calculator/utils/assets_manager.dart';
import 'package:bmi_calculator/view/bmi_screen.dart';
import 'package:flutter/material.dart';

class ImageCharacter extends StatefulWidget {
  const ImageCharacter({
    super.key,
    required this.bmiController,
    required this.character,
  });

  final BmiController bmiController;
  final Character character;

  @override
  State<ImageCharacter> createState() => _ImageCharacterState();
}

class _ImageCharacterState extends State<ImageCharacter> {
  double opacity = 1.0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 2,
      child: GestureDetector(
        onTap: () => _navigateWithDelay(),
        child: AnimatedOpacity(
          opacity: opacity,
          duration: const Duration(milliseconds: 500),
          child: SizedBox(
            child: Image.asset(
              AssetsManager.getCharacterAsset(widget.character, false),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }

  void _navigateWithDelay() {
    setState(() {
      opacity = 0.5;
    });

    Future.delayed(const Duration(milliseconds: 300), () {
      setState(() {
        opacity = 1.0;
      });

      widget.bmiController.selectCharacter(widget.character);

      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const BmiScreen()));
    });
  }
}
