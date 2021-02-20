import 'package:aqi/models/air_quality_index.dart';
import 'package:aqi/pages/home_page/widgets/get_data.dart';
import 'package:aqi/pages/widgets/k_back_button.dart';
import 'package:aqi/pages/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marquee/marquee.dart';
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
    return Scaffold(
      appBar: AppBar(
        leading: kBackButton(context),
        title: Text(
          'Home',
          style: GoogleFonts.faunaOne(
            fontSize: 18.h,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: widget.aqi.data == null
            ? Center(
                child: loadingWidget(),
              )
            : Scrollbar(
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: SafeArea(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 16.h,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              FaIcon(
                                FontAwesomeIcons.map,
                                size: 18.h,
                              ),
                              SizedBox(width: 8.w),
                              Container(
                                height: 18.h,
                                width: 325.w,
                                child: Marquee(
                                  text: widget.aqi.data.city.name,
                                  style: GoogleFonts.faunaOne(
                                    fontSize: 18.h,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  scrollAxis: Axis.horizontal,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  blankSpace: 100.0,
                                  velocity: 100.0,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 8.h),
                          Text(
                            DateFormat('MMM d, ' 'h:mm a')
                                .format(widget.aqi.data.time.iso),
                            style: GoogleFonts.faunaOne(
                                color: Colors.grey, fontSize: 12.h),
                          ),
                          SizedBox(height: 60.h),
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
                              padding: EdgeInsets.only(top: 8.h),
                              child: Text(getData(widget.aqi.data.aqi)
                                  .cautionaryStatement),
                            ),
                          ),
                          SizedBox(height: 16.h),
                          Text(
                            'Health Recommendations',
                            style: GoogleFonts.faunaOne(
                              fontSize: 18.h,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF1194AA),
                            ),
                          ),
                          SizedBox(height: 16.h),
                          buildHealthRecommendationWidget(widget.aqi),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
