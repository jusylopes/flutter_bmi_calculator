import 'package:bmi_calculator/utils/colors.dart';
import 'package:flutter/material.dart';

class SnackbarUtils {
  static void showSnackBar({required context, required text}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: AppColors.primaryColor,
        content: Text(
          text,
          style: Theme.of(context).textTheme.titleSmall,
        ),
        duration: const Duration(seconds: 2),
      ),
    );
  }
}
