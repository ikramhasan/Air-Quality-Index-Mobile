import 'package:aqi/models/air_quality_index.dart';
import 'package:aqi/pages/home_page/widgets/get_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

buildHealthRecommendationWidget(AirQualityIndex aqi) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: getData(aqi.data.aqi).recommendations.length,
      itemBuilder: (context, i) {
        var recommendations = getData(aqi.data.aqi).recommendations;
        return Container(
          height: 60,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.only(
              topLeft: i == 0 ? Radius.circular(16) : Radius.circular(0),
              topRight: i == 0 ? Radius.circular(16) : Radius.circular(0),
              bottomLeft: i == recommendations.length - 1
                  ? Radius.circular(16)
                  : Radius.circular(0),
              bottomRight: i == recommendations.length - 1
                  ? Radius.circular(16)
                  : Radius.circular(0),
            ),
          ),
          child: Column(
            children: [
              ListTile(
                leading: SvgPicture.asset(
                  recommendations[i].icon,
                  color: getData(aqi.data.aqi).color,
                ),
                title: Text(
                  recommendations[i].text,
                  style: GoogleFonts.faunaOne(),
                ),
              ),
              i < recommendations.length - 1 ? Divider(height: 1) : Container(),
            ],
          ),
        );
      },
    );
  }