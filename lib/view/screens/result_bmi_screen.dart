import 'package:bmi_calculator/blocs/character/character_cubit.dart';
import 'package:bmi_calculator/blocs/character/character_state.dart';
import 'package:bmi_calculator/controllers/bmi_controller.dart';
import 'package:bmi_calculator/controllers/favorite_controller.dart';
import 'package:bmi_calculator/models/bmi_favorite_model.dart';
import 'package:bmi_calculator/utils/utils.dart';
import 'package:bmi_calculator/view/components/components.dart';
import 'package:bmi_calculator/view/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:rive/rive.dart' as rive;
import 'dart:math' as math;

class ScoreBmiScreen extends StatelessWidget {
  const ScoreBmiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bmi = Provider.of<BmiController>(context);
    final double heightScreen = MediaQuery.of(context).size.height;
    final bool isSad = bmi.getResultString() != 'PESO NORMAL';

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Image.asset(AssetsManager.background, fit: BoxFit.cover),
          ),
          _buildCharacterAnimation(heightScreen, isSad),
          Padding(
            padding: EdgeInsets.only(bottom: heightScreen / 2.2),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Seu IMC é',
                    style: TextStyle(
                      fontSize: 50.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontFamily: AssetsManager.fontFamilyPixel,
                      height: 0.8,
                    ),
                  ),
                  _buildBmiDetails(bmi, context),
                  _buildSaveButton(bmi, context),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildCharacterAnimation(double heightScreen, bool isSad) {
    return SizedBox(
      height: heightScreen / 1.9,
      child: BlocBuilder<CharacterCubit, CharacterState>(
        builder: (context, state) {
          if (state is CharacterLoadingState ||
              state is CharacterInitialState) {
            return const Center(
                child: CircularProgressIndicator(
              color: AppColors.primaryColor,
            ));
          } else if (state is CharacterSelectedState) {
            return rive.RiveAnimation.asset(
              AssetsManager.getCharacterAsset(state.character, isSad: isSad),
              alignment: Alignment.bottomLeft,
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }

  Widget _buildBmiDetails(BmiController bmi, BuildContext context) {
    return Column(
      children: [
        Text(
          bmi.bmiValue.toStringAsFixed(2),
          style: TextStyle(
            fontSize: 65.0,
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontFamily: AssetsManager.fontFamilyPixel,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          bmi.getResultString(),
          style: Theme.of(context).textTheme.titleSmall,
        ),
        Text(
          DateFormat('dd MMM yyyy').format(DateTime.now()),
          style: Theme.of(context).textTheme.titleSmall,
        ),
        const SizedBox(height: 12),
        ScoreBmiProgressIndicator(bmi: bmi),
        const SizedBox(height: 12),
      ],
    );
  }

  Widget _buildSaveButton(BmiController bmi, BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        _saveBMI(bmi: bmi, context: context);
        _navigateFavoriteScreen(context);
      },
      style: ElevatedButton.styleFrom(shape: const StadiumBorder()),
      child: Text(
        'Salvar resultado',
        style: Theme.of(context).textTheme.titleSmall,
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
      classification: bmi.getResultString(),
    );

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
