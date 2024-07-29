import 'package:bmi_calculator/controllers/bmi_controller.dart';
import 'package:bmi_calculator/utils/utils.dart';
import 'package:flutter/material.dart';

class ScoreBmiProgressIndicator extends StatelessWidget {
  const ScoreBmiProgressIndicator({
    super.key,
    required this.bmi,
  });

  final BmiController bmi;

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
              width: MediaQuery.of(context).size.width * 0.8,
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
          Positioned(
              left: (bmi.bmiValue / 180.0) *
                  MediaQuery.of(context).size.width *
                  (bmi.bmiValue / 13.5),
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
