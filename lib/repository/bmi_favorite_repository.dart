import 'package:bmi_calculator/adapters/bmi_favorite_adapter.dart';
import 'package:bmi_calculator/models/bmi_favorite_model.dart';

import 'package:hive/hive.dart';

class BmiFavoriteRepository {
  late LazyBox<BmiFavoriteModel> box;

  Future<void> openBox() async {
    Hive.registerAdapter(BmiFavoriteHiveAdapter());
    box = await Hive.openLazyBox<BmiFavoriteModel>('bmifavorite');
  }

  Future<void> addBmi(BmiFavoriteModel bmi) async {
    await box.put(bmi.id, bmi);
  }

  Future<void> deleteBmi(String id) async {
   await box.delete(id);
  }

  Future<List<BmiFavoriteModel>> getBmis() async {
    final bmiKeys = box.keys;
    final bmiList = <BmiFavoriteModel>[];

    for (var key in bmiKeys) {
      final bmi = await box.get(key);
      if (bmi != null) {
        bmiList.add(bmi);
      }
    }

    return bmiList;
  }
}
