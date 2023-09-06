import 'dart:collection';

import 'package:flutter/material.dart';

import 'package:bmi_calculator/models/bmi_favorite_model.dart';
import 'package:bmi_calculator/repository/bmi_favorite_repository.dart';

class FavoriteController extends ChangeNotifier {
  final BmiFavoriteRepository _repository;

  FavoriteController(this._repository) {
    _startBox();
  }

  final List<BmiFavoriteModel> _bmiList = [];
  UnmodifiableListView<BmiFavoriteModel> get bmis =>
      UnmodifiableListView(_bmiList);

  Future<void> _startBox() async {
    await _repository.openBox();
    await getBmis();
  }

  Future<void> addBmi({required BmiFavoriteModel bmi}) async {
    await _repository.addBmi(bmi);
    _bmiList.add(bmi);

    notifyListeners();
  }

  Future<void> deleteBmi({required String id}) async {
    final indexToRemove = _bmiList.indexWhere((bmi) => bmi.id == id);

    if (indexToRemove != -1) {
      _bmiList.removeAt(indexToRemove);
      await _repository.deleteBmi(id);

      notifyListeners();
    }
  }

  Future<void> getBmis() async {
    final bmis = await _repository.getBmis();
    _bmiList.clear();
    _bmiList.addAll(bmis);

    notifyListeners();
  }
}
