import 'package:aqi/data/data.dart';
import 'package:aqi/models/air_quality_index.dart';
import 'package:aqi/pages/widgets/back_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class StatisticsPage extends StatelessWidget {
  final AirQualityIndex aqi;

  const StatisticsPage({
    this.aqi,
  });

  buildChart({String text, List<O3> list, String labelFormat}) {
    return SfCartesianChart(
      title: ChartTitle(text: text),
      primaryXAxis: NumericAxis(
          interval: 1,
          majorGridLines: MajorGridLines(width: 0),
          labelFormat:
              '{value} \n${DateFormat('MMM').format(aqi.data.time.iso)}',
          edgeLabelPlacement: EdgeLabelPlacement.shift),
      primaryYAxis: NumericAxis(
        labelFormat: labelFormat,
        axisLine: AxisLine(width: 0),
        majorTickLines: MajorTickLines(size: 0),
      ),
      series: getSplieAreaSeries(aqi, list),
      tooltipBehavior: TooltipBehavior(enable: true),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: SafeArea(
        child: Scrollbar(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 34),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ArrowLeftButton(),
                  Text(
                    'Statistics',
                    style: GoogleFonts.faunaOne(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  buildChart(
                    text: 'Ozone',
                    list: aqi.data.forecast.daily.o3,
                    labelFormat: '{value} ppb',
                  ),
                  SizedBox(height: 8),
                  buildChart(
                      text: 'PM10',
                      list: aqi.data.forecast.daily.pm10,
                      labelFormat: '{value} \nug/m3'),
                  SizedBox(height: 8),
                  buildChart(
                      text: 'PM25',
                      list: aqi.data.forecast.daily.pm25,
                      labelFormat: '{value} \nug/m3'),
                  SizedBox(height: 8),
                  buildChart(
                      text: 'UVI',
                      list: aqi.data.forecast.daily.uvi,
                      labelFormat: '{value} \nindex'),
                  SizedBox(height: 8),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
