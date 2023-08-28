class BmiModel {
  final double weight;
  final double height;

  BmiModel(this.weight, this.height);

  BmiModel copyWith({
    double? weight,
    double? height,
  }) {
    return BmiModel(
      weight ?? this.weight,
      height ?? this.height,
    );
  }
}
