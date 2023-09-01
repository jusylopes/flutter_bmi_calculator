import 'package:bmi_calculator/providers/bmi_provider.dart';
import 'package:flutter/material.dart';

class SliderWeight extends StatelessWidget {
  const SliderWeight({
    super.key,
    required this.bmiProvider,
  });

  final BmiProvider bmiProvider;

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderThemeData(
        trackHeight: 60,
        thumbShape: SliderComponentShape.noOverlay,
        overlayShape: SliderComponentShape.noOverlay,
        valueIndicatorShape: SliderComponentShape.noOverlay,
        trackShape: const RectangularSliderTrackShape(),
        activeTickMarkColor: Colors.transparent,
        inactiveTickMarkColor: Colors.transparent,
        
      ),
      child: Container(
        padding: const EdgeInsets.all(15),
        width: MediaQuery.of(context).size.width / 2,
        child: Slider(
          value: bmiProvider.weight,
          onChanged: (newValue) => bmiProvider.updateWeight(newValue),
          max: 180,
          min: 0,
        ),
      ),
    );
  }
}
