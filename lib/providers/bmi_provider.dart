import 'package:flutter/material.dart';
import 'package:bmi_calculator/models/bmi_model.dart';

class BmiProvider with ChangeNotifier {
  final BmiModel _bmiModel = BmiModel(
    height: 160,
    weight: 60,
    gender: Gender.NULL,
    isSelectedGender: false,
  );

  double get height => _bmiModel.height;
  double get weight => _bmiModel.weight;
  Gender get selectedGender => _bmiModel.gender;

  double get bmiValue =>
      _bmiModel.weight / (_bmiModel.height * _bmiModel.height);

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

  String getResult() {
    double bmi = bmiValue;

    if (bmi < 16) {
      return '';
    } else {
      return 'Obeso';
    }
  }
}
