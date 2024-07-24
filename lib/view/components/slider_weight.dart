import 'package:bmi_calculator/controllers/bmi_controller.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:syncfusion_flutter_core/theme.dart';

class SliderWeight extends StatelessWidget {
  const SliderWeight({
    super.key,
    required this.bmiController,
  });

  final BmiController bmiController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                bmiController.updateWeight(bmiController.weight - 1);
              },
              child: const Icon(Icons.remove),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                '${bmiController.weight.toInt()} Kg',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            GestureDetector(
              onTap: () {
                bmiController.updateWeight(bmiController.weight + 1);
              },
              child: const Icon(Icons.add),
            ),
          ],
        ),
        Container(
          padding: const EdgeInsets.all(15),
          width: MediaQuery.of(context).size.width / 1.5,
          child: SfSliderTheme(
            data: SfSliderThemeData(
              activeTrackHeight: 60,
              inactiveTrackHeight: 60,
              inactiveTrackColor: Colors.grey.withOpacity(0.4),
            ),
            child: SfSlider(
              min: 0.0,
              max: 180.0,
              value: bmiController.weight,
              onChanged: (newValue) => bmiController.updateWeight(newValue),
              stepSize: 0.1,
            ),
          ),
        ),
      ],
    );
  }
}
