import 'package:aqi/models/air_quality_index.dart';
import 'package:aqi/pages/statistics_page/widgets/build_chart.dart';
import 'package:aqi/pages/widgets/k_back_button.dart';
import 'package:aqi/pages/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';

class StatisticsPage extends StatelessWidget {
  final AirQualityIndex aqi;

  const StatisticsPage({
    this.aqi,
  });

  @override
  Widget build(BuildContext context) {
    return aqi.data != null
        ? Scaffold(
            appBar: AppBar(
              leading: kBackButton(context),
              title: Text(
                'statistics'.tr(),
                style: GoogleFonts.faunaOne(
                  fontSize: 18.h,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            body: Container(
              color: Theme.of(context).scaffoldBackgroundColor,
              child: SafeArea(
                child: Scrollbar(
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 16.h,
                        horizontal: 16.h,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          buildChart(
                            text: 'Ozone',
                            list: aqi.data.forecast.daily.o3,
                            labelFormat: '{value} ppb',
                            aqi: aqi,
                            context: context,
                          ),
                          SizedBox(height: 16.h),
                          buildChart(
                              text: 'PM10',
                              list: aqi.data.forecast.daily.pm10,
                              aqi: aqi,
                              context: context,
                              labelFormat: '{value} \nug/m3'),
                          SizedBox(height: 16.h),
                          buildChart(
                              text: 'PM25',
                              list: aqi.data.forecast.daily.pm25,
                              aqi: aqi,
                              context: context,
                              labelFormat: '{value} \nug/m3'),
                          SizedBox(height: 16.h),
                          buildChart(
                              text: 'UVI',
                              list: aqi.data.forecast.daily.uvi,
                              aqi: aqi,
                              context: context,
                              labelFormat: '{value} \nindex'),
                          SizedBox(height: 16.h),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
        : Center(
            child: loadingWidget(),
          );
  }
}
