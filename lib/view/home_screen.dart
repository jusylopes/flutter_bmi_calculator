import 'package:bmi_calculator/models/bmi_model.dart';
import 'package:bmi_calculator/controllers/bmi_controller.dart';
import 'package:bmi_calculator/utils/snackbar_utils.dart';
import 'package:bmi_calculator/view/bmi_screen.dart';
import 'package:bmi_calculator/view/components/image_gender.dart';
import 'package:bmi_calculator/utils/assets_manager.dart';
import 'package:bmi_calculator/view/favorite_screen.dart';
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
                  ? SnackbarUtils.showSnackBar(
                      context: context, text: 'Please select a gender')
                  : Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const BmiScreen()),
                    );
            },
          ),
        ],
        leading: IconButton(
          icon: const Icon(Icons.more_vert),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HistoryScreen()),
            );
          },
        ),
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
