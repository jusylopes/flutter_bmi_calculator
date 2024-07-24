import 'package:flutter/material.dart';

class BmiFavoriteModel {
  final String id;
  final double weight;
  final double height;
  final double bmi;
  final DateTime date;
  final Color colorClassification;
  final String classification;

  BmiFavoriteModel({
    required this.id,
    required this.weight,
    required this.height,
    required this.bmi,
    required this.date,
    required this.colorClassification,
    required this.classification,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'weight': weight,
      'height': height,
      'bmi': bmi,
      'date': date.millisecondsSinceEpoch,
      'colorClassification': colorClassification.value,
      'classification': classification,
    };
  }

  static BmiFavoriteModel fromMap(Map<String, dynamic> map) {
    return BmiFavoriteModel(
      id: map['id'].toString(),
      weight: map['weight'] is double
          ? map['weight'] as double
          : double.parse(map['weight'].toString()),
      height: map['height'] is double
          ? map['height'] as double
          : double.parse(map['height'].toString()),
      bmi: map['bmi'] is double
          ? map['bmi'] as double
          : double.parse(map['bmi'].toString()),
      date: DateTime.fromMillisecondsSinceEpoch(map['date'] is int
          ? map['date'] as int
          : int.parse(map['date'].toString())),
      colorClassification: Color(map['colorClassification'] is int
          ? map['colorClassification'] as int
          : int.parse(map['colorClassification'].toString())),
      classification: map['classification'].toString(),
    );
  }
}
