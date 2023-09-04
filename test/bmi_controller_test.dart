import 'package:bmi_calculator/controllers/bmi_controller.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('BmiController', () {
    test('calculateBmi calculates BMI correctly', () {
      final bmiProvider = BmiController();
      bmiProvider.updateHeight(170);
      bmiProvider.updateWeight(70);

      expect(bmiProvider.bmiValue, closeTo(24.22, 0.01));
    });
  });
}
