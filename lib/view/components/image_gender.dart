import 'package:bmi_calculator/models/bmi_model.dart';
import 'package:bmi_calculator/controllers/bmi_controller.dart';
import 'package:flutter/material.dart';

class ImageGender extends StatelessWidget {
  const ImageGender({
    super.key,
    required this.bmiController,
    required this.gender,
    required this.assetImage,
  });

  final BmiController bmiController;
  final Gender gender;
  final String assetImage;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => bmiController.selectGender(gender),
      onDoubleTap: () => bmiController.selectGender(Gender.NULL),
      child: SizedBox(
        width: MediaQuery.of(context).size.width / 2.5,
        child: Image.asset(
          assetImage,
          color: bmiController.selectedGender == gender ||
                  bmiController.selectedGender == Gender.NULL
              ? null
              : const Color.fromRGBO(255, 255, 255, 0.5),
        ),
      ),
    );
  }
}
