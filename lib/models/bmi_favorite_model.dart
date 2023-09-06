import 'package:flutter/material.dart';

class BmiFavoriteModel {
  String id;
  double weight;
  double height;
  double bmi;
  DateTime data;
  Color color;
  String classification;

  BmiFavoriteModel({
    required this.id,
    required this.weight,
    required this.height,
    required this.bmi,
    required this.data,
    required this.color,
    required this.classification,
  });
}
