import 'package:bmi_calculator/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/models/bmi_model.dart';
import 'dart:math';

class BmiController with ChangeNotifier {
  final BmiModel _bmiModel = BmiModel(
    height: 160,
    weight: 60,
    character: Character.nonBinary,
  );

  double get height => _bmiModel.height;
  double get weight => _bmiModel.weight;
  Character get selectedCharacter => _bmiModel.character;
  double get bmiValue => _bmiModel.weight / pow(_bmiModel.height / 100, 2);

  void updateHeight(double height) {
    _bmiModel.height = height;
    notifyListeners();
  }

  void updateWeight(double weight) {
    _bmiModel.weight = weight;
    notifyListeners();
  }

  void selectCharacter(Character character) {
    _bmiModel.character = character;
    notifyListeners();
  }

  void resetValues() {
    _bmiModel.height = 160;
    _bmiModel.weight = 60;
    _bmiModel.character = Character.nonBinary;
    notifyListeners();
  }

  String getResultString() {
    double bmi = bmiValue;

    if (bmi < 18.5) {
      return 'ABAIXO DO PESO';
    } else if (bmi < 24.5) {
      return 'PESO NORMAL';
    } else if (bmi < 29.9) {
      return 'SOBREPESO';
    } else if (bmi < 34.9) {
      return 'OBESIDADE (Grau I)';
    } else if (bmi < 39.9) {
      return 'OBESIDADE (Grau II)';
    } else {
      return 'OBESIDADE (Grau III) ou MÓRBIDA';
    }
  }

  Color getResultColor() {
    double bmi = bmiValue;

    if (bmi < 17) {
      return AppColors.colorBmiRed;
    } else if (bmi < 24.5) {
      return AppColors.colorBmiGreen;
    } else if (bmi < 34.9) {
      return AppColors.colorBmiOrange;
    } else {
      return AppColors.colorBmiRed;
    }
  }
}
