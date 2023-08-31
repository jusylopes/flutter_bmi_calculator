import 'package:bmi_calculator/providers/bmi_provider.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('BmiProvider', () {
    test('calculateBmi calculates BMI correctly', () {
      final bmiProvider = BmiProvider();
      bmiProvider.updateHeight(170);
      bmiProvider.updateWeight(70);

      expect(bmiProvider.bmiValue, closeTo(24.22, 0.01));
    });
  });
}
