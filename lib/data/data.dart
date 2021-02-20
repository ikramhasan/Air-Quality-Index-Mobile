import 'package:aqi/models/air_quality_index.dart' as aqiPackage;
import 'package:aqi/models/table.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

List<Data> data = [
  Data(
    minAQI: 0,
    maxAQI: 50,
    pollutionLevel: 'Good',
    healthImplecations:
        'Air quality is considered satisfactory, and air pollution poses little or no risk.',
    cautionaryStatement: 'None.',
    icon: 'assets/good.svg',
    color: Color(0xFF009966),
    recommendations: [
      Recommendation(
        text: 'Open your windows to bring clean, fresh air indoors',
        icon: 'assets/window.svg',
      ),
      Recommendation(
        text: 'Enjoy outdoor activities',
        icon: 'assets/sport.svg',
      ),
    ],
  ),
  Data(
    minAQI: 51,
    maxAQI: 100,
    pollutionLevel: 'Moderate',
    healthImplecations:
        'Air quality is acceptable; however, for some pollutants there may be a moderate health concern for a very small number of people who are unusually sensitive to air pollution.',
    cautionaryStatement:
        'Active children and adults, and people with respiratory disease, such as asthma, should limit prolonged outdoor exertion.',
    icon: 'assets/moderate.svg',
    color: Color(0xFFFFDE33),
    recommendations: [
      Recommendation(
        text: 'Close your windows to avoid dirty outdoor air',
        icon: 'assets/no-window.svg',
      ),
      Recommendation(
        text: 'Sensitive groups should reduce outdoor exercise',
        icon: 'assets/no-sport.svg',
      ),
    ],
  ),
  Data(
    minAQI: 101,
    maxAQI: 150,
    pollutionLevel: 'Unhealthy for Sensitive Groups',
    healthImplecations:
        'Members of sensitive groups may experience health effects. The general public is not likely to be affected.',
    cautionaryStatement:
        'Active children and adults, and people with respiratory disease, such as asthma, should limit prolonged outdoor exertion.',
    icon: 'assets/unhealthy-sensitive.svg',
    color: Color(0xFFEEFF3E),
    recommendations: [
      Recommendation(
        text: 'Sensitive groups should wear a mask outdoors',
        icon: 'assets/health-mask.svg',
      ),
      Recommendation(
        text: 'Close your windows to avoid dirty outdoor air',
        icon: 'assets/no-window.svg',
      ),
      Recommendation(
        text: 'Get an air purifier',
        icon: 'assets/airpurifier.svg',
      ),
      Recommendation(
        text: 'Everyone should reduce outdoor exercise',
        icon: 'assets/no-sport.svg',
      ),
    ],
  ),
  Data(
    minAQI: 151,
    maxAQI: 200,
    pollutionLevel: 'Unhealthy',
    healthImplecations:
        'Everyone may begin to experience health effects; members of sensitive groups may experience more serious health effects.',
    cautionaryStatement:
        'Active children and adults, and people with respiratory disease, such as asthma, should avoid prolonged outdoor exertion; everyone else, especially children, should limit prolonged outdoor exertion.',
    icon: 'assets/unhealthy.svg',
    color: Colors.orange,
    recommendations: [
      Recommendation(
        text: 'Wear a mask outdoors',
        icon: 'assets/health-mask.svg',
      ),
      Recommendation(
        text: 'Close your windows to avoid dirty outdoor air',
        icon: 'assets/no-window.svg',
      ),
      Recommendation(
        text: 'Get an air purifier',
        icon: 'assets/airpurifier.svg',
      ),
      Recommendation(
        text: 'Avoid outdoor exercise',
        icon: 'assets/no-sport.svg',
      ),
    ],
  ),
  Data(
    minAQI: 201,
    maxAQI: 300,
    pollutionLevel: 'Very Unhealthy',
    healthImplecations:
        'Health warnings of emergency conditions. The entire population is more likely to be affected.',
    cautionaryStatement:
        'Active children and adults, and people with respiratory disease, such as asthma, should avoid all outdoor exertion; everyone else, especially children, should limit outdoor exertion.',
    icon: 'assets/very-unhealthy.svg',
    color: Colors.deepOrange[400],
    recommendations: [
      Recommendation(
        text: 'Wear a mask outdoors',
        icon: 'assets/health-mask.svg',
      ),
      Recommendation(
        text: 'Close your windows to avoid dirty outdoor air',
        icon: 'assets/no-window.svg',
      ),
      Recommendation(
        text: 'Get an air purifier',
        icon: 'assets/airpurifier.svg',
      ),
      Recommendation(
        text: 'Avoid outdoor exercise',
        icon: 'assets/no-sport.svg',
      ),
    ],
  ),
  Data(
    minAQI: 300,
    maxAQI: 500,
    pollutionLevel: 'Hazardous',
    healthImplecations:
        'Health alert: everyone may experience serious health effects.',
    cautionaryStatement: 'Everyone should avoid all outdoor exertion.',
    icon: 'assets/hazardous.svg',
    color: Colors.red[700],
    recommendations: [
      Recommendation(
        text: 'Wear a mask outdoors',
        icon: 'assets/health-mask.svg',
      ),
      Recommendation(
        text: 'Close your windows to avoid dirty outdoor air',
        icon: 'assets/no-window.svg',
      ),
      Recommendation(
        text: 'Get an air purifier',
        icon: 'assets/airpurifier.svg',
      ),
      Recommendation(
        text: 'Avoid outdoor exercise',
        icon: 'assets/no-sport.svg',
      ),
    ],
  ),
];

/// Returns the list of chart series
/// which need to render on the spline area chart.
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
