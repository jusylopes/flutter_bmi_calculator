import 'package:bmi_calculator/controllers/favorite_controller.dart';
import 'package:bmi_calculator/models/bmi_favorite_model.dart';
import 'package:bmi_calculator/repository/bmi_favorite_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockBmiFavoriteRepository extends Mock implements BmiFavoriteRepository {}

void main() {
  group('FavoriteController', () {
    late FavoriteController controller;
    late MockBmiFavoriteRepository mockRepository;

    setUp(() {
      mockRepository = MockBmiFavoriteRepository();
      controller = FavoriteController(mockRepository);
    });

    test('startDatabase should load bmis from repository', () async {
      when(() => mockRepository.getBmis()).thenAnswer((_) async => [
            BmiFavoriteModel(
              id: '1',
              bmi: 25.0,
              date: DateTime.now(),
              weight: 75,
              height: 1.75,
              classification: 'Normal',
              colorClassification: const Color(0x000ff00f),
            ),
            BmiFavoriteModel(
              id: '2',
              bmi: 25.0,
              date: DateTime.now(),
              weight: 75,
              height: 1.75,
              classification: 'Normal',
              colorClassification: const Color(0x000ff00f),
            ),
          ]);

      await controller.startDatabase();
      expect(controller.bmis.length, 2);
    });
  });
}
