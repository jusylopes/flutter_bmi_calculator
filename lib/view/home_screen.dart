import 'package:bmi_calculator/models/bmi_model.dart';
import 'package:bmi_calculator/controllers/bmi_controller.dart';
import 'package:bmi_calculator/view/bmi_screen.dart';
import 'package:bmi_calculator/view/components/image_gender.dart';
import 'package:bmi_calculator/utils/assets_manager.dart';
import 'package:bmi_calculator/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bmiController = Provider.of<BmiController>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Select your gender'),
        actions: [
          IconButton(
            icon: const Icon(Icons.arrow_forward_ios),
            onPressed: () {
              bmiController.selectedGender == Gender.NULL
                  ? _showGenderSelectionSnackBar(context)
                  : Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const BmiScreen()),
                    );
            },
          ),
        ],
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ImageGender(
              bmiController: bmiController,
              gender: Gender.FEMALE,
              assetImage: AssetsManager.imageFemale,
            ),
            const SizedBox(
              width: 10,
            ),
            ImageGender(
              bmiController: bmiController,
              gender: Gender.MALE,
              assetImage: AssetsManager.imageMale,
            )
          ],
        ),
      ),
    );
  }
}

void _showGenderSelectionSnackBar(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: AppColors.primaryColor,
      content: Text('Please select a gender.',
          style: Theme.of(context).textTheme.titleSmall),
      duration: const Duration(seconds: 2),
    ),
  );
}
