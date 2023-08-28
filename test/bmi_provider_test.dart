import 'package:bmi_calculator/models/bmi_model.dart';
import 'package:bmi_calculator/providers/bmi_provider.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('BmiProvider', () {
    test('calculateBmi calculates BMI correctly', () {
      final bmiProvider = BmiProvider();
      double heightPerson = 1.75;
      const double weightPerson = 70;

      final bmiModel =
          BmiModel(weightPerson, heightPerson); 

      bmiProvider.calculateBmi(bmiModel: bmiModel);

      expect(bmiProvider.bmi, closeTo(22.86, 0.01));
    });

    test('calculateBmi notifies listeners', () {
      final bmiProvider = BmiProvider();
      final bmiModel = BmiModel(70, 1.75);

      int listenerCallCount = 0;
      bmiProvider.addListener(() {
        listenerCallCount++;
      });

      bmiProvider.calculateBmi(bmiModel: bmiModel);

      expect(listenerCallCount, 1);
    });
  });
}
