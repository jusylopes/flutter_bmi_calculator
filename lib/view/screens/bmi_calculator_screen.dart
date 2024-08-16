import 'package:bmi_calculator/blocs/character/character_cubit.dart';
import 'package:bmi_calculator/blocs/character/character_state.dart';
import 'package:bmi_calculator/controllers/bmi_controller.dart';
import 'package:bmi_calculator/utils/assets_manager.dart';
import 'package:bmi_calculator/view/components/components.dart';
import 'package:bmi_calculator/view/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class BmiCalculatorScreen extends StatelessWidget {
  const BmiCalculatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bmiController = Provider.of<BmiController>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Selecione seu peso e altura',
          maxLines: 2,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: AssetsManager.fontFamilyPixel,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.arrow_forward_ios),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ScoreBmiScreen()),
              );
            },
          ),
        ],
        leading: const CharacterChangeMenu(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height / 1.7,
                  width: MediaQuery.of(context).size.width / 1.6,
                  child: BlocBuilder<CharacterCubit, CharacterState>(
                    builder: (context, state) {
                      if (state is CharacterLoadingState) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (state is CharacterSelectedState) {
                        return AnimationCharacterBmi(
                            character: state.character);
                      }
                      return const Center(child: CircularProgressIndicator());
                    },
                  ),
                ),
                SliderHeight(bmiController: bmiController),
              ],
            ),
            SliderWeight(bmiController: bmiController),
          ],
        ),
      ),
    );
  }
}
