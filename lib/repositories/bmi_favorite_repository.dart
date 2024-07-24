import 'package:bmi_calculator/database/database_helper.dart';
import 'package:bmi_calculator/models/bmi_favorite_model.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class BmiFavoriteRepository {
  final DatabaseHelper _databaseHelper = DatabaseHelper.instance;

  Future<void> saveBmi(BmiFavoriteModel bmi) async {
    final Database db = await _databaseHelper.database;
    try {
      await db.insert(DatabaseHelper.bmiTable, bmi.toMap());
    } catch (e) {
      debugPrint('Erro ao inserir no banco de dados: $e');
    }
  }

  Future<void> deleteBmi(String id) async {
    final Database db = await _databaseHelper.database;
    await db.delete(
      DatabaseHelper.bmiTable,
      where: '${DatabaseHelper.columnId} = ?',
      whereArgs: [id],
    );
  }

  Future<List<BmiFavoriteModel?>> getBmis() async {
    try {
      final Database database = await _databaseHelper.database;
      final List<Map<String, dynamic>> resultMaps =
          await database.query(DatabaseHelper.bmiTable);

      return resultMaps
          .map((resultMap) {
            try {
              return BmiFavoriteModel.fromMap(resultMap);
            } catch (error) {
              debugPrint(
                  'Erro ao converter mapa para modelo: $error com dados: $resultMap');
              return null;
            }
          })
          .where((bmiFavoriteModel) => bmiFavoriteModel != null)
          .toList();
    } catch (error) {
      debugPrint('Erro ao obter IMCs do banco de dados: $error');
      return [];
    }
  }
}
