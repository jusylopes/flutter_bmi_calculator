import 'package:bmi_calculator/providers/bmi_provider.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class SliderHeight extends StatelessWidget {
  const SliderHeight({
    super.key,
    required this.bmiProvider,
  });

  final BmiProvider bmiProvider;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '${bmiProvider.height.toInt()} cm',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height / 2.5,
          child: SfSlider.vertical(
            value: bmiProvider.height,
            onChanged: (newValue) => bmiProvider.updateHeight(newValue),
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
