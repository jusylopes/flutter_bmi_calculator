import 'package:flutter/material.dart';

class BmiFavoriteSqlModel {
  final String id;
  final double weight;
  final double height;
  final double bmi;
  final DateTime date;
  final Color colorClassification;
  final String classification;

  BmiFavoriteSqlModel({
    required this.id,
    required this.weight,
    required this.height,
    required this.bmi,
    required this.date,
    required this.colorClassification,
    required this.classification,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'weight': weight});
    result.addAll({'height': height});
    result.addAll({'bmi': bmi});
    result.addAll({'date': date.millisecondsSinceEpoch});
    result.addAll({'colorClassification': colorClassification.value});
    result.addAll({'classification': classification});

    return result;
  }
}
