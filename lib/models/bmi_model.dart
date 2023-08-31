class BmiModel {
  double weight;
  double height;
  Gender gender;

  BmiModel({
    required this.weight,
    required this.height,
    required this.gender,
  });
}

// ignore: constant_identifier_names
enum Gender { MALE, FEMALE, NULL }
