import 'package:aqi/models/air_quality_index.dart' as aqiPackage;
import 'package:aqi/models/table.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:easy_localization/easy_localization.dart';

List<Data> data = [
  Data(
    minAQI: 0,
    maxAQI: 50,
    pollutionLevel: 'Good',
    healthImplecations: 'good_health_implications'.tr(),
    cautionaryStatement: 'good_cautionary_statement'.tr(),
    icon: 'assets/good.svg',
    color: Color(0xFF009966),
    recommendations: [
      Recommendation(
        text: 'open_windows'.tr(),
        icon: 'assets/window.svg',
      ),
      Recommendation(
        text: 'enjoy_outdoor'.tr(),
        icon: 'assets/sport.svg',
      ),
    ],
  ),
  Data(
    minAQI: 51,
    maxAQI: 100,
    pollutionLevel: 'moderate'.tr(),
    healthImplecations: 'moderate_health_implications'.tr(),
    cautionaryStatement: 'moderate_cautionary_statement'.tr(),
    icon: 'assets/moderate.svg',
    color: Color(0xFFFFDE33),
    recommendations: [
      Recommendation(
        text: 'close_windows'.tr(),
        icon: 'assets/no-window.svg',
      ),
      Recommendation(
        text: 'sensitive_groups_reduce_exercise'.tr(),
        icon: 'assets/no-sport.svg',
      ),
    ],
  ),
  Data(
    minAQI: 101,
    maxAQI: 150,
    pollutionLevel: 'unhealthy_sensitive'.tr(),
    healthImplecations: 'unhealthy_sensitive_health_implications'.tr(),
    cautionaryStatement: 'unhealthy_sensitive_cautionary_statement'.tr(),
    icon: 'assets/unhealthy-sensitive.svg',
    color: Color(0xFFEEFF3E),
    recommendations: [
      Recommendation(
        text: 'sensitive_groups_should_wear_mask'.tr(),
        icon: 'assets/health-mask.svg',
      ),
      Recommendation(
        text: 'close_windows'.tr(),
        icon: 'assets/no-window.svg',
      ),
      Recommendation(
        text: 'get_air_purifier'.tr(),
        icon: 'assets/airpurifier.svg',
      ),
      Recommendation(
        text: 'reduce_outdoor_exercise'.tr(),
        icon: 'assets/no-sport.svg',
      ),
    ],
  ),
  Data(
    minAQI: 151,
    maxAQI: 200,
    pollutionLevel: 'unhealthy'.tr(),
    healthImplecations: 'unhealthy_health_implications'.tr(),
    cautionaryStatement: 'unhealthy_cautionary_statement'.tr(),
    icon: 'assets/unhealthy.svg',
    color: Colors.orange,
    recommendations: [
      Recommendation(
        text: 'wear_mask_outdoors'.tr(),
        icon: 'assets/health-mask.svg',
      ),
      Recommendation(
        text: 'close_windows'.tr(),
        icon: 'assets/no-window.svg',
      ),
      Recommendation(
        text: 'get_air_purifier'.tr(),
        icon: 'assets/airpurifier.svg',
      ),
      Recommendation(
        text: 'avoid_outdoor_exercise'.tr(),
        icon: 'assets/no-sport.svg',
      ),
    ],
  ),
  Data(
    minAQI: 201,
    maxAQI: 300,
    pollutionLevel: 'very_unhealthy'.tr(),
    healthImplecations: 'very_unhealthy_health_implications'.tr(),
    cautionaryStatement: 'very_unhealthy_cautionary_statement'.tr(),
    icon: 'assets/very-unhealthy.svg',
    color: Colors.deepOrange[400],
    recommendations: [
      Recommendation(
        text: 'wear_mask_outdoors'.tr(),
        icon: 'assets/health-mask.svg',
      ),
      Recommendation(
        text: 'close_windows'.tr(),
        icon: 'assets/no-window.svg',
      ),
      Recommendation(
        text: 'get_air_purifier'.tr(),
        icon: 'assets/airpurifier.svg',
      ),
      Recommendation(
        text: 'avoid_outdoor_exercise'.tr(),
        icon: 'assets/no-sport.svg',
      ),
    ],
  ),
  Data(
    minAQI: 300,
    maxAQI: 500,
    pollutionLevel: 'hazardous'.tr(),
    healthImplecations: 'hazardous_health_implications'.tr(),
    cautionaryStatement: 'hazardous_cautionary_statement'.tr(),
    icon: 'assets/hazardous.svg',
    color: Colors.red[700],
    recommendations: [
      Recommendation(
        text: 'wear_mask_outdoors'.tr(),
        icon: 'assets/health-mask.svg',
      ),
      Recommendation(
        text: 'close_windows'.tr(),
        icon: 'assets/no-window.svg',
      ),
      Recommendation(
        text: 'get_air_purifier'.tr(),
        icon: 'assets/airpurifier.svg',
      ),
      Recommendation(
        text: 'avoid_outdoor_exercise'.tr(),
        icon: 'assets/no-sport.svg',
      ),
    ],
  ),
];

/// Returns the list of chart series
/// that is needed to render on the spline area chart.
List<ChartSeries<_SplineAreaData, double>> getSplieAreaSeries(
    aqiPackage.AirQualityIndex aqi, List<aqiPackage.O3> list) {
  final List<_SplineAreaData> chartData = List.generate(list.length, (index) {
    return _SplineAreaData(
      list[index].day.day.toDouble(),
      list[index].min.toDouble(),
      list[index].max.toDouble(),
      list[index].avg.toDouble(),
    );
  });
  return <ChartSeries<_SplineAreaData, double>>[
    SplineAreaSeries<_SplineAreaData, double>(
      dataSource: chartData,
      color: Colors.blue.withOpacity(0.2),
      borderColor: Colors.blue,
      borderWidth: 2,
      name: aqi.data.city.name,
      xValueMapper: (_SplineAreaData pollution, _) => pollution.date,
      yValueMapper: (_SplineAreaData pollution, _) => pollution.avg,
    ),
  ];
}

/// Private class for storing the spline area chart datapoints.
class _SplineAreaData {
  _SplineAreaData(this.date, this.min, this.max, this.avg);
  final double date;
  final double min;
  final double max;
  final double avg;
}
