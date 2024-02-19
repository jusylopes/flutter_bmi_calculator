import 'package:bmi_calculator/models/bmi_model.dart';
import 'package:bmi_calculator/controllers/bmi_controller.dart';
import 'package:flutter/material.dart';

class ImageCaracter extends StatelessWidget {
  const ImageCaracter({
    super.key,
    required this.bmiController,
    required this.caracter,
    required this.assetImage,
  });

  final BmiController bmiController;
  final Caracter caracter;
  final String assetImage;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => bmiController.selectCaracter(caracter),
      onDoubleTap: () => bmiController.selectCaracter(Caracter.NULL),
      child: SizedBox(
        width: MediaQuery.of(context).size.width / 2.5,
        child: Image.asset(
          assetImage,
          color: bmiController.selectedCaracter == caracter ||
                  bmiController.selectedCaracter == Caracter.NULL
              ? null
              : const Color.fromRGBO(255, 255, 255, 0.5),
        ),
      ),
    );
  }
}
