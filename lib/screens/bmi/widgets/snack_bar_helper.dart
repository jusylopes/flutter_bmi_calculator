import 'package:bmi_calculator/utils/colors.dart';
import 'package:flutter/material.dart';

class SnackBarHelper {
  static void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: AppColors.primaryColor,
        content: Text(message, style: Theme.of(context).textTheme.titleSmall),
        duration: const Duration(seconds: 2),
      ),
    );
  }
}
