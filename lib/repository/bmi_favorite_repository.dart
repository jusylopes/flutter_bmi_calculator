import 'package:bmi_calculator/database/database_helper.dart';
import 'package:bmi_calculator/models/bmi_favorite_sql_model.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class BmiFavoriteRepository {
  final DatabaseHelper _databaseHelper = DatabaseHelper.instance;

  Future<void> saveBmi(BmiFavoriteSqlModel bmi) async {
    final Database db = await _databaseHelper.database;
    try {
      await db.insert(DatabaseHelper.bmiTable, bmi.toMap());
    } catch (e) {
      print('Erro ao inserir no banco de dados: $e');
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

  Future<List<BmiFavoriteSqlModel?>> getBmis() async {
    try {
      final Database db = await _databaseHelper.database;
      final List<Map<String, dynamic>> maps =
          await db.query(DatabaseHelper.bmiTable);

      return List.generate(maps.length, (i) {
        try {
          return BmiFavoriteSqlModel(
            id: maps[i][DatabaseHelper.columnId],
            bmi: maps[i][DatabaseHelper.columnBmi],
            height: maps[i][DatabaseHelper.columnHeight],
            weight: maps[i][DatabaseHelper.columnWeight],
            date: DateTime.fromMillisecondsSinceEpoch(
                int.parse(maps[i][DatabaseHelper.columnDate])),
            classification: maps[i][DatabaseHelper.columnClassification],
            colorClassification: Color(
                int.parse(maps[i][DatabaseHelper.columnColorClassification])),
          );
        } catch (e) {
          print('Error parsing data at index $i: $e');
          return null; 
        }
      }).where((item) => item != null).toList(); 
    } catch (e) {
      print('Error getting BMIs: $e');
      return [];
    }
  }
}
