import 'package:bmi_calculator/models/bmi_model.dart';
import 'package:bmi_calculator/providers/bmi_provider.dart';
import 'package:bmi_calculator/utils/assets_manager.dart';
import 'package:flutter/material.dart';

class ImageGenderBmi extends StatelessWidget {
  const ImageGenderBmi({
    super.key,
    required this.bmiProvider,
  });

  final BmiProvider bmiProvider;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 2,
      child: Image.asset(
        bmiProvider.selectedGender == Gender.MALE
            ? AssetsManager.imageMale
            : AssetsManager.imageFemale,
        fit: BoxFit.fill,
      ),
    );
  }
}
