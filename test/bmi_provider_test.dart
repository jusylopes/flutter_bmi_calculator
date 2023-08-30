import 'package:bmi_calculator/providers/bmi_provider.dart';
import 'package:flutter_test/flutter_test.dart';

// void main() {
//   group('BmiProvider', () {
//     test('calculateBmi calculates BMI correctly', () {
//       final bmiProvider = BmiProvider();
//       double heightPerson = 1.75;
//       const double weightPerson = 70;

//       bmiProvider.calculateBmi(height: heightPerson, weight: weightPerson);

//       expect(bmiProvider, closeTo(22.86, 0.01));
//     });

//     test('calculateBmi notifies listeners', () {
//       final bmiProvider = BmiProvider();

//       double heightPerson = 1.75;
//       const double weightPerson = 70;

//       int listenerCallCount = 0;
//       bmiProvider.addListener(() {
//         listenerCallCount++;
//       });

//       bmiProvider.calculateBmi(height: heightPerson, weight: weightPerson);

//       expect(listenerCallCount, 1);
//     });
//   });
// }
