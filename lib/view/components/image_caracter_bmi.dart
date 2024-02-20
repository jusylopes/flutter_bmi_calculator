import 'package:bmi_calculator/models/bmi_model.dart';
import 'package:bmi_calculator/controllers/bmi_controller.dart';
import 'package:bmi_calculator/utils/assets_manager.dart';
import 'package:flutter/material.dart';

class ImageCaracterBmi extends StatelessWidget {
  const ImageCaracterBmi({
    super.key,
    required this.bmiController,
  });

  final BmiController bmiController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 2,
      child: Image.asset(
        bmiController.selectedCaracter == Caracter.MALE
            ? AssetsManager.imageMale
            : AssetsManager.imageFemale,
        fit: BoxFit.fill,
      ),
    );
  }
}
