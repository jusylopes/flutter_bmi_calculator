import 'package:bmi_calculator/app.dart';
import 'package:bmi_calculator/utils/hive_config.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveConfig.start();

  runApp(const MyApp());
}
