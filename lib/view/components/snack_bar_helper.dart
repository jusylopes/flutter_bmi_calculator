import 'package:flutter/material.dart';

class SnackBarHelper {
  static void showSnackBar(
      {required BuildContext ctx, required String message}) {
    ScaffoldMessenger.of(ctx).showSnackBar(
      SnackBar(
        backgroundColor: Theme.of(ctx).primaryColor,
        content: Text(message, style: Theme.of(ctx).textTheme.titleSmall),
        duration: const Duration(seconds: 2),
      ),
    );
  }
}
