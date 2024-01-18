import 'package:bmi_calculator/controllers/bmi_controller.dart';
import 'package:bmi_calculator/utils/colors.dart';
import 'package:flutter/material.dart';

class SliderWeight extends StatelessWidget {
  const SliderWeight({
    super.key,
    required this.bmiController,
  });

  final BmiController bmiController;

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderThemeData(
        trackHeight: 60,
        thumbShape: SliderComponentShape.noOverlay,
        overlayShape: SliderComponentShape.noOverlay,
        valueIndicatorShape: SliderComponentShape.noOverlay,
        trackShape: const RectangularSliderTrackShape(),
        activeTrackColor: AppColors.colorPrimarySwatch,
        inactiveTrackColor: AppColors.colorPrimarySwatch.withOpacity(0.4),
      ),
      child: Container(
        padding: const EdgeInsets.all(15),
        width: MediaQuery.of(context).size.width / 2,
        child: Slider(
          value: bmiController.weight,
          onChanged: (newValue) => bmiController.updateWeight(newValue),
          max: 180,
          min: 0,
        ),
      ),
    );
  }
}
