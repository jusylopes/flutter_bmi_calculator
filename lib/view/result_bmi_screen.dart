import 'package:bmi_calculator/controllers/bmi_controller.dart';
import 'package:bmi_calculator/controllers/favorite_controller.dart';
import 'package:bmi_calculator/models/bmi_favorite_model.dart';
import 'package:bmi_calculator/utils/assets_manager.dart';
import 'package:bmi_calculator/utils/snackbar_utils.dart';
import 'package:bmi_calculator/view/components/score_bmi_progress_indicator.dart';
import 'package:bmi_calculator/view/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'dart:math' as math;

class ResultBmiScreen extends StatelessWidget {
  const ResultBmiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bmi = Provider.of<BmiController>(context);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Seu IMC é', style: Theme.of(context).textTheme.titleLarge),
            Column(
              children: [
                Text(
                  bmi.bmiValue.toStringAsFixed(2),
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Image.asset(
                  AssetsManager.getCharacterAsset(bmi.selectedCharacter, false),
                  fit: BoxFit.fill,
                  color: bmi.getResultColor(),
                  height: MediaQuery.of(context).size.height / 3,
                ),
                const SizedBox(
                  height: 18,
                ),
                Text(
                  bmi.getResultString(),
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                Text(
                  DateFormat('dd MMM yyyy').format(DateTime.now()),
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                const SizedBox(
                  height: 12,
                ),
                ScoreBmiProgressIndicator(bmi: bmi),
                const SizedBox(
                  height: 12,
                )
              ],
            ),
            ElevatedButton(
              onPressed: () {
                _saveBMI(bmi: bmi, context: context);
                _navigateFavoriteScreen(context);
              },
              style: ElevatedButton.styleFrom(shape: const StadiumBorder()),
              child: Text(
                'Salvar resultado',
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _saveBMI(
      {required BuildContext context, required BmiController bmi}) async {
    final random = math.Random();

    final bmiFavorite = BmiFavoriteModel(
        id: random.nextInt(1000000).toString(),
        height: bmi.height,
        weight: bmi.weight,
        bmi: bmi.bmiValue,
        date: DateTime.now(),
        colorClassification: bmi.getResultColor(),
        classification: bmi.getResultString());

    try {
      await Provider.of<FavoriteController>(context, listen: false)
          .saveBmi(bmi: bmiFavorite);

      if (context.mounted) {
        SnackbarUtils.showSnackBar(
            context: context, text: 'IMC salvo com sucesso.');
      }
    } catch (e) {
      if (context.mounted) {
        SnackbarUtils.showSnackBar(
            context: context, text: 'Falha ao salvar IMC.');
      }
    }
  }

  void _navigateFavoriteScreen(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const HomeScreen(initialTabIndex: 1),
      ),
    );
  }
}
