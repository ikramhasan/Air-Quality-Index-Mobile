import 'package:aqi/pages/about_page/data/page_data.dart';
import 'package:aqi/pages/about_page/widgets/build_expansion_card.dart';
import 'package:aqi/pages/widgets/k_back_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: kBackButton(context),
        title: Text(
          'About',
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
                  horizontal: 16.w,
                  vertical: 16.h,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildExpansionCard(
                      title: 'What is AQI?',
                      assetLocation: 'assets/images/aqi.png',
                      description: aqiText,
                      context: context,
                    ),
                    SizedBox(height: 8.h),
                    buildExpansionCard(
                        title: 'What is UVI?',
                        description: uviText,
                        context: context,
                        assetLocation: 'assets/images/uv.gif'),
                    SizedBox(height: 8.h),
                    buildExpansionCard(
                      title: 'What is PM?',
                      description: pmText,
                      context: context,
                    ),
                    SizedBox(height: 8.h),
                    buildExpansionCard(
                      title: 'What is PM10?',
                      description: pm10Text,
                      context: context,
                      assetLocation: 'assets/images/pm.jpg',
                    ),
                    SizedBox(height: 8.h),
                    buildExpansionCard(
                      title: 'What is PM25?',
                      description: pm25Text,
                      context: context,
                      assetLocation: 'assets/images/pm.jpg',
                    ),
                    SizedBox(height: 8.h),
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
      ),
    );
  }
}
