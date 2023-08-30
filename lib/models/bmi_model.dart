class BmiModel {
  double weight;
  double height;
  Gender gender;
  bool isSelectedGender;

  BmiModel({
    required this.weight,
    required this.height,
    required this.gender,
    required this.isSelectedGender,
  });
}

enum Gender { MALE, FEMALE, NULL }
