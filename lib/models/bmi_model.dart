class BmiModel {
  double weight;
  double height;
  Character character;

  BmiModel({
    required this.weight,
    required this.height,
    required this.character,
  });
}

enum Character {
  boy,
  girl,
  nonBinary,
}
