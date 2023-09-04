import 'package:bmi_calculator/controllers/bmi_controller.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class SliderHeight extends StatelessWidget {
  const SliderHeight({
    super.key,
    required this.bmiController,
  });

  final BmiController bmiController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '${bmiController.height.toInt()} cm',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height / 2.5,
          child: SfSlider.vertical(
            value: bmiController.height,
            onChanged: (newValue) => bmiController.updateHeight(newValue),
            minorTicksPerInterval: 5,
            interval: 50,
            showTicks: true,
            showLabels: true,
            max: 200,
            min: 0,
          ),
        ),
      ],
    );
  }
}
