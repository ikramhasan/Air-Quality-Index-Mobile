import 'package:aqi/models/air_quality_index.dart';
import 'package:aqi/pages/statistics_page/widgets/build_chart.dart';
import 'package:aqi/pages/widgets/back_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StatisticsPage extends StatelessWidget {
  final AirQualityIndex aqi;

  const StatisticsPage({
    this.aqi,
  });

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
                    aqi: aqi,
                  ),
                  SizedBox(height: 8),
                  buildChart(
                      text: 'PM10',
                      list: aqi.data.forecast.daily.pm10,
                      aqi: aqi,
                      labelFormat: '{value} \nug/m3'),
                  SizedBox(height: 8),
                  buildChart(
                      text: 'PM25',
                      list: aqi.data.forecast.daily.pm25,
                      aqi: aqi,
                      labelFormat: '{value} \nug/m3'),
                  SizedBox(height: 8),
                  buildChart(
                      text: 'UVI',
                      list: aqi.data.forecast.daily.uvi,
                      aqi: aqi,
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
