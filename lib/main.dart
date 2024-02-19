import 'package:bmi_calculator/app.dart';
import 'package:bmi_calculator/database/database_helper.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DatabaseHelper.instance.initializeDatabase();

   runApp(const MyApp());
}
