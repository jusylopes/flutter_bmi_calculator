class Person {
  String namePerson;
  double weightPerson;
  double heightPerson;

  Person(this.namePerson, this.weightPerson, this.heightPerson);
}

double calculteBMI(Person person) {
  return person.weightPerson / (person.heightPerson * person.heightPerson);
}

printBMICategory(double bmi) {
  final bmiCategories = {
    16: 'Magreza grave',
    17: 'Magreza moderada',
    18.5: 'Magreza leve',
    25: 'Saudável',
    30: 'Sobrepeso',
    35: 'Obesidade Grau I',
    40: 'Obesidade Grau II (severa)',
    double.infinity: 'Obesidade Grau III (mórbida)',
  };

  String category = bmiCategories.entries
      .firstWhere(
        (entry) => bmi < entry.key,
        orElse: () => bmiCategories.entries.last,
      )
      .value;

  print(category);
}
