import 'package:bmi_calculator/controllers/bmi_controller.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:syncfusion_flutter_core/theme.dart';

class SliderWeight extends StatefulWidget {
  const SliderWeight({
    super.key,
    required this.bmiController,
  });

  final BmiController bmiController;

  @override
  State<SliderWeight> createState() => _SliderWeightState();
}

class _SliderWeightState extends State<SliderWeight> {
  final TextEditingController _weightController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _weightController.text = widget.bmiController.weight.toStringAsFixed(1);
    widget.bmiController.addListener(_updateWeightText);
  }

  @override
  void dispose() {
    widget.bmiController.removeListener(_updateWeightText);
    _weightController.dispose();
    super.dispose();
  }

  void _updateWeightText() {
    _weightController.text = widget.bmiController.weight.toStringAsFixed(1);
  }

  void _updateWeightFromInput() {
    final double? newWeight = double.tryParse(_weightController.text);
    if (newWeight != null) {
      widget.bmiController.updateWeight(newWeight);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                widget.bmiController
                    .updateWeight(widget.bmiController.weight - 1);
              },
              child: const Icon(Icons.remove),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 8,
              ),
              child: SizedBox(
                width: 150,
                child: TextField(
                  controller: _weightController,
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleLarge,
                  decoration: const InputDecoration(
                      suffixText: 'Kg', border: InputBorder.none),
                  onSubmitted: (value) => _updateWeightFromInput(),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                widget.bmiController
                    .updateWeight(widget.bmiController.weight + 1);
              },
              child: const Icon(Icons.add),
            ),
          ],
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
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
              value: widget.bmiController.weight,
              onChanged: (newValue) {
                setState(() {
                  widget.bmiController.updateWeight(newValue);
                });
              },
              stepSize: 0.1,
            ),
          ),
        ),
      ],
    );
  }
}
