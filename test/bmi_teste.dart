import 'package:bmi_calculator/models/person.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Retorna BMI', () {
    expect(calculteBMI(Person('João', 20, 1.75)), 6.530612244897959);
  });

  test('Retorna classificação IMC', () {
    double bmi = calculteBMI(Person('Amanda', 5, 1.75));
    expect(printBMICategory(bmi), 'Magreza grave');
  });
}
