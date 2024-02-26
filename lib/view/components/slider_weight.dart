import 'package:bmi_calculator/controllers/bmi_controller.dart';
import 'package:bmi_calculator/utils/colors.dart';
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
        width: MediaQuery.of(context).size.width / 1.5,
        child: SfSliderTheme(
          data: SfSliderThemeData(
            activeTrackHeight: 60,
            inactiveTrackHeight: 60,
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
    );
  }
}
