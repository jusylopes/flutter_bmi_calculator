import 'package:bmi_calculator/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/models/bmi_model.dart';
import 'dart:math';

class BmiController with ChangeNotifier {
  final BmiModel _bmiModel = BmiModel(
    height: 160,
    weight: 60,
    gender: Gender.NULL,
  );

  double get height => _bmiModel.height;
  double get weight => _bmiModel.weight;
  Gender get selectedGender => _bmiModel.gender;
  double get bmiValue => _bmiModel.weight / pow(_bmiModel.height / 100, 2);

  void updateHeight(double height) {
    _bmiModel.height = height;
    notifyListeners();
  }

  void updateWeight(double weight) {
    _bmiModel.weight = weight;
    notifyListeners();
  }

  void selectGender(Gender gender) {
    _bmiModel.gender = gender;
    notifyListeners();
  }

  void resetValues() {
    _bmiModel.height = 160;
    _bmiModel.weight = 60;
    _bmiModel.gender = Gender.NULL;
    notifyListeners();
  }

  String getResultString() {
    double bmi = bmiValue;
    if (bmi < 16) {
      return 'SEVERE UNDERWEIGHT';
    } else if (bmi < 17) {
      return 'MODERATE UNDERWEIGHT';
    } else if (bmi < 18.5) {
      return 'MILD UNDERWEIGHT';
    } else if (bmi < 25) {
      return 'HEALTHY';
    } else if (bmi < 30) {
      return 'OVERWEIGHT';
    } else if (bmi < 35) {
      return 'SEVERE OBESITY (Class I)';
    } else if (bmi < 40) {
      return 'SEVERE OBESITY (Class II)';
    } else {
      return 'MORBID OBESITY (Class III)';
    }
  }

  Color getResultColor() {
    double bmi = bmiValue;

    if (bmi < 17) {
      return AppColors.colorBmiGrey;
    } else if (bmi < 25) {
      return AppColors.colorBmiGreen;
    } else if (bmi < 35) {
      return AppColors.colorBmiOrange;
    } else {
      return Colors.red;
    }
  }
}
