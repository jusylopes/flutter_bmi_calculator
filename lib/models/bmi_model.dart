class BmiModel {
  double weight;
  double height;
  Caracter gender;

  BmiModel({
    required this.weight,
    required this.height,
    required this.gender,
  });
}

enum Caracter {
  MALE,
  FEMALE,
  NULL,
}
