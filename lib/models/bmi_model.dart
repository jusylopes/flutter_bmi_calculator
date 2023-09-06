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

enum Gender {
  MALE,
  FEMALE,
  NULL,
}
