import 'package:flutter/material.dart';
import 'package:bmi_calculator/models/bmi_model.dart';

class BmiProvider extends ChangeNotifier {
  double _bmi = 0;
  double get bmi => _bmi;

  void calculateBmi({required BmiModel bmiModel}) {
    _bmi = bmiModel.weight / (bmiModel.height * bmiModel.height);
    notifyListeners();
  }
}
