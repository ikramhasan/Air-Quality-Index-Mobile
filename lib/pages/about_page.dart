import 'package:aqi/pages/widgets/back_button.dart';
import 'package:expansion_card/expansion_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutPage extends StatelessWidget {
  buildExpansionCard(
      {String title,
      String description,
      String assetLocation,
      BuildContext context}) {
    return ExpansionCard(
      borderRadius: 16,
      backgroundColor: Theme.of(context).primaryColor,
      background: Container(
        height: 225,
        color: Theme.of(context).primaryColor,
      ),
      title: Text(
        title,
        style: GoogleFonts.faunaOne(),
      ),
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            description,
            style: GoogleFonts.faunaOne(),
          ),
        ),
        assetLocation == null
            ? Container()
            : Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                child: Image.asset(assetLocation),
              ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    String whichHarmful =
        'The smaller particles or PM2.5 are lighter and go deeper into the lungs and cause greater damage longer term. They also stay in the air longer and travel farther. PM10 (big) particles can stay in the air for minutes or hours while PM2.5 (small) particles can stay in the air for days or weeks. And travel? PM10 particles can travel as little as a hundred yards or as much as 30 miles. PM2.5 particles go even farther; many hundreds of miles. As a result, even though we measure both PM2.5 and PM10, we lay much greater stress on PM2.5 which is the more harmful among the two.';
    String aqiText =
        'AQI stands for air quality index. It\'s value runs from 0 to 500. The higher the AQI value, the greater the level of air pollution and the greater the health concern. For example, an AQI value of 50 or below represents good air quality, while an AQI value over 300 represents hazardous air quality.';
    String pmText =
        'PM stands for particulate matter (also called particle pollution): the term for a mixture of solid particles and liquid droplets found in the air. Some particles, such as dust, dirt, soot, or smoke, are large or dark enough to be seen with the naked eye. Others are so small they can only be detected using an electron microscope.';
    String pm10Text =
        'These particles are between 2.5 and 10 micrometers (from about 25 to 100 times thinner than a human hair). These particles are called PM10 (we say "P M ten", which stands for Particulate Matter up to 10 micrometers in size). These particles cause less severe health effects mostly in the upper respiratory tract. These consist of smoke, dirt and dust from factories, farming and roads as well as mold, spores and pollen. They are made from crushing and grinding rocks and soil then blown by wind.';
    String pm25Text =
        'These particles are smaller than 2.5 micrometers (more than 100 times thinner than a human hair). These particles are called PM2.5 (we say "P M two point five", as in Particulate Matter up to 2.5 micrometers in size). These consist of toxic organic compounds and heavy metals. They are made from automobile exhaust, burning garbage and landfill, smelting and processing of metals.';
    String uviText =
        'UVI stands for ultra violet index. It is an international standard measurement of the strength of sunburn-producing ultraviolet (UV) radiation at a particular place and time.';

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
                    'About',
                    style: GoogleFonts.faunaOne(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  buildExpansionCard(
                    title: 'What is AQI?',
                    assetLocation: 'assets/images/aqi.png',
                    description: aqiText,
                    context: context,
                  ),
                  SizedBox(height: 8),
                  buildExpansionCard(
                      title: 'What is UVI?',
                      description: uviText,
                      context: context,
                      assetLocation: 'assets/images/uv.gif'),
                  SizedBox(height: 8),
                  buildExpansionCard(
                    title: 'What is PM?',
                    description: pmText,
                    context: context,
                  ),
                  SizedBox(height: 8),
                  buildExpansionCard(
                    title: 'What is PM10?',
                    description: pm10Text,
                    context: context,
                    assetLocation: 'assets/images/pm.jpg',
                  ),
                  SizedBox(height: 8),
                  buildExpansionCard(
                    title: 'What is PM25?',
                    description: pm25Text,
                    context: context,
                    assetLocation: 'assets/images/pm.jpg',
                  ),
                  SizedBox(height: 8),
                  buildExpansionCard(
                    title: 'Which of PM2.5 and PM10 is more harmful?',
                    description: whichHarmful,
                    context: context,
                    assetLocation: 'assets/images/comparison.jpg',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
