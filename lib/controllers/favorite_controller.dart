import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/models/bmi_favorite_model.dart';
import 'package:bmi_calculator/repositories/bmi_favorite_repository.dart';

class FavoriteController extends ChangeNotifier {
  FavoriteController(this._repository);

  final BmiFavoriteRepository _repository;

  final List<BmiFavoriteModel> _bmiList = [];
  UnmodifiableListView<BmiFavoriteModel> get bmis =>
      UnmodifiableListView(_bmiList);

  Future<void> startDatabase() async {
    await getBmis();
  }

  Future<void> saveBmi({required BmiFavoriteModel bmi}) async {
    await _repository.saveBmi(bmi);
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
    _bmiList.clear();

    final bmis = await _repository.getBmis();
    _bmiList.addAll(bmis.whereType<BmiFavoriteModel>());

    notifyListeners();
  }
}
