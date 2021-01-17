import 'package:aqi/data/data.dart';
import 'package:aqi/models/air_quality_index.dart';
import 'package:aqi/pages/widgets/back_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class HomePage extends StatefulWidget {
  final AirQualityIndex aqi;

  const HomePage({
    this.aqi,
  });

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  getData(int aqi) {
    if (aqi < 50) {
      return data[0];
    } else if (aqi > 51 && aqi < 100) {
      return data[1];
    } else if (aqi > 101 && aqi < 150) {
      return data[2];
    } else if (aqi > 151 && aqi < 200) {
      return data[3];
    } else if (aqi > 201 && aqi < 300) {
      return data[4];
    } else if (aqi > 301 && aqi < 500) {
      return data[5];
    }
  }

  buildCircleGauge(AirQualityIndex aqi) {
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
            fontSize: 45,
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
        size: 250,
        customWidths: CustomSliderWidths(
          progressBarWidth: 10,
        ),
      ),
    );
    return slider;
  }

  buildHealthRecommendationWidget() {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: getData(widget.aqi.data.aqi).recommendations.length,
      itemBuilder: (context, i) {
        var recommendations = getData(widget.aqi.data.aqi).recommendations;
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
                  color: getData(widget.aqi.data.aqi).color,
                ),
                title: Text(
                  recommendations[i].text,
                  style: GoogleFonts.faunaOne(),
                ),
              ),
              i < recommendations.length - 1
                  ? Divider(height: 1)
                  : Container(),
            ],
          ),
        );
      },
    );
  }

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
                        Center(child: buildCircleGauge(widget.aqi)),
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
                        buildHealthRecommendationWidget(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}
