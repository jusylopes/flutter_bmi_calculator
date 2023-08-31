import 'package:bmi_calculator/providers/bmi_provider.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class SliderWeight extends StatelessWidget {
  const SliderWeight({
    super.key,
    required this.bmiProvider,
  });

  final BmiProvider bmiProvider;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350,
      child: SfSlider(
        value: bmiProvider.weight,
        onChanged: (newValue) => bmiProvider.updateWeight(newValue),
        interval: 20,
        max: 180,
        min: 0,
        stepSize: 1,
      ),
    );
  }
}
