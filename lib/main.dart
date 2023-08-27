import 'dart:io';
import 'package:bmi_calculator/models/person.dart';

void main() {
  try {
    print('Digite o nome da pessoa: ');
    String nome = stdin.readLineSync()!;

    print('Digite o peso (kg): ');
    double peso = double.parse(stdin.readLineSync()!);

    print('Digite a altura (m): ');
    double altura = double.parse(stdin.readLineSync()!);

    Person pessoa = Person(nome, peso, altura);
    double bmi = calculteBMI(pessoa);
    String category = printBMICategory(bmi);

    print('O IMC de ${pessoa.namePerson} é: $bmi');
    print('sua classificação é: $category');
  } catch (e) {
    print('Ocorreu um erro: $e');
  }
}
