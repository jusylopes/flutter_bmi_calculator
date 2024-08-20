import 'package:bmi_calculator/controllers/bmi_controller.dart';
import 'package:bmi_calculator/utils/utils.dart';
import 'package:flutter/material.dart';

class ScoreBmiProgressIndicator extends StatefulWidget {
  const ScoreBmiProgressIndicator({
    super.key,
    required this.bmi,
  });

  final BmiController bmi;

  @override
  State<ScoreBmiProgressIndicator> createState() =>
      _ScoreBmiProgressIndicatorState();
}

class _ScoreBmiProgressIndicatorState extends State<ScoreBmiProgressIndicator> {
  final double barProgressWidth = 280;
  double arrowPosition = 0;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _startArrowAnimation();
    });
  }

  void _startArrowAnimation() {
    final double scaleWidth = barProgressWidth;

    final double segmentWidth = scaleWidth / 5;
    double targetPosition = 0;

    if (widget.bmi.bmiValue < 18.5) {
      targetPosition = 0;
    } else if (widget.bmi.bmiValue < 25) {
      targetPosition = segmentWidth * 1;
    } else if (widget.bmi.bmiValue < 29.9) {
      targetPosition = segmentWidth * 2;
    } else if (widget.bmi.bmiValue < 35) {
      targetPosition = segmentWidth * 3;
    } else {
      targetPosition = segmentWidth * 4;
    }

    setState(() {
      arrowPosition = targetPosition.clamp(0.0, scaleWidth - 40);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: Stack(
        alignment: AlignmentDirectional.centerEnd,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: SizedBox(
              width: barProgressWidth,
              height: 60,
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(color: AppColors.colorBmiRed),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(color: AppColors.colorBmiGreen),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(color: AppColors.colorBmiYellow),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(color: AppColors.colorBmiOrange),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(color: AppColors.colorBmiRed),
                  ),
                ],
              ),
            ),
          ),
          AnimatedPositioned(
              duration: const Duration(milliseconds: 800),
              curve: Curves.easeInOut,
              left: arrowPosition,
              bottom: 22,
              child: const Icon(
                Icons.arrow_drop_down_rounded,
                size: 80,
                color: Colors.black,
              )),
        ],
      ),
    );
  }
}
