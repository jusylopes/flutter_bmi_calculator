import 'package:bmi_calculator/models/bmi_favorite_model.dart';
import 'package:bmi_calculator/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class FavoriteBmiChart extends StatelessWidget {
  final List<BmiFavoriteModel> favoriteList;

  const FavoriteBmiChart({
    super.key,
    required this.favoriteList,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 200,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: SfCartesianChart(
            backgroundColor: AppColors.colorBmiYellow,
            primaryXAxis: DateTimeAxis(
              dateFormat: DateFormat.yMMMd(),
              intervalType: DateTimeIntervalType.days,
            ),
            title: const ChartTitle(
              text: 'Variação de Imc',
              textStyle: TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            series: [
              LineSeries<BmiFavoriteModel, DateTime>(
                dataSource: favoriteList,
                xValueMapper: (BmiFavoriteModel data, _) => data.date,
                yValueMapper: (BmiFavoriteModel data, _) => data.bmi,
                pointColorMapper: (BmiFavoriteModel data, _) =>
                    data.colorClassification,
                color: AppColors.primaryColor,
                width: 2,
                markerSettings: const MarkerSettings(
                    isVisible: true, shape: DataMarkerType.circle),
                dataLabelSettings: DataLabelSettings(
                  isVisible: true,
                  textStyle: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  builder: (data, point, series, pointIndex, seriesIndex) {
                    return Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: favoriteList[pointIndex].colorClassification,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text(
                        data.bmi.toStringAsFixed(1),
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
