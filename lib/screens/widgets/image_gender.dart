import 'package:bmi_calculator/models/bmi_model.dart';
import 'package:bmi_calculator/providers/bmi_provider.dart';
import 'package:flutter/material.dart';

class ImageGender extends StatelessWidget {
  const ImageGender({
    super.key,
    required this.bmiProvider,
    required this.gender,
    required this.assetImage,
  });

  final BmiProvider bmiProvider;
  final Gender gender;
  final String assetImage;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => bmiProvider.selectGender(gender),
      onDoubleTap: () => bmiProvider.selectGender(Gender.NULL),
      child: SizedBox(
        width: MediaQuery.of(context).size.width / 2.5,
        child: Image.asset(
          assetImage,
          color: bmiProvider.selectedGender == gender ||
                  bmiProvider.selectedGender == Gender.NULL
              ? null
              : const Color.fromRGBO(255, 255, 255, 0.5),
        ),
      ),
    );
  }
}
