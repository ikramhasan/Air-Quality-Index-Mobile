import 'package:aqi/data/data.dart';
import 'package:aqi/models/air_quality_index.dart';
import 'package:aqi/pages/home_page/widgets/get_data.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

buildCircleGauge(AirQualityIndex aqi, BuildContext context) {
    String subText = getData(aqi.data.aqi).pollutionLevel;
    final slider = SleekCircularSlider(
      min: 0,
      max: 500,
      initialValue: aqi.data.aqi.toDouble(),
      appearance: CircularSliderAppearance(
        startAngle: 150,
        infoProperties: InfoProperties(
          topLabelText: 'AQI',
          topLabelStyle: GoogleFonts.faunaOne(
            color: Colors.grey,
          ),
          bottomLabelText: subText,
          bottomLabelStyle: GoogleFonts.faunaOne(
            color: getData(aqi.data.aqi).color,
          ),
          mainLabelStyle: GoogleFonts.faunaOne(
            fontWeight: FontWeight.bold,
            fontSize: 45.h,
            color: getData(aqi.data.aqi).color,
          ),
          modifier: (percentage) {
            return aqi.data.aqi.toString();
          },
        ),
        customColors: CustomSliderColors(
          dotColor: Colors.transparent,
          trackColor: Theme.of(context).primaryColor,
          shadowColor: Color(0xFFFEB486),
          dynamicGradient: true,
          progressBarColors: [
            data[0].color,
            data[1].color,
            data[2].color,
            data[3].color,
            data[4].color,
            data[5].color,
          ],
        ),
        size: 250.h,
        customWidths: CustomSliderWidths(
          progressBarWidth: 10,
        ),
      ),
    );
    return slider;
  }