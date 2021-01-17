import 'package:aqi/models/air_quality_index.dart';
import 'package:aqi/pages/home_page/widgets/get_data.dart';
import 'package:aqi/pages/widgets/back_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import 'widgets/build_circle_gauge.dart';
import 'widgets/build_health_recommendation.dart';

class HomePage extends StatefulWidget {
  final AirQualityIndex aqi;

  const HomePage({
    this.aqi,
  });

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: widget.aqi.data == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Scrollbar(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 34),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ArrowLeftButton(),
                        Text(
                          widget.aqi.data.city.name,
                          style: GoogleFonts.faunaOne(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          DateFormat('EEE, MMM d, ' 'yyyy - h:mm a')
                              .format(widget.aqi.data.time.iso),
                          style: GoogleFonts.faunaOne(
                              color: Colors.grey, fontSize: 12),
                        ),
                        SizedBox(height: 60),
                        Center(
                          child: buildCircleGauge(
                            widget.aqi,
                            context,
                          ),
                        ),
                        ListTile(
                          leading: SvgPicture.asset(
                            getData(widget.aqi.data.aqi).icon,
                            color: getData(widget.aqi.data.aqi).color,
                          ),
                          title: Text(
                            getData(widget.aqi.data.aqi).healthImplecations,
                          ),
                          subtitle: Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(getData(widget.aqi.data.aqi)
                                .cautionaryStatement),
                          ),
                        ),
                        SizedBox(height: 16),
                        Text(
                          'Health Recommendations',
                          style: GoogleFonts.faunaOne(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF1194AA),
                          ),
                        ),
                        SizedBox(height: 8),
                        buildHealthRecommendationWidget(widget.aqi),
                      ],
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}
