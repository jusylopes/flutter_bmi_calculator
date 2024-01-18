import 'package:flutter/material.dart';

class SnackBarHelper {
  static void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Theme.of(context).primaryColor,
        content: Text(message, style: Theme.of(context).textTheme.titleSmall),
        duration: const Duration(seconds: 2),
      ),
    );
  }
}
