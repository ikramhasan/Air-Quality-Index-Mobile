import 'package:aqi/pages/about_page/widgets/build_expansion_card.dart';
import 'package:aqi/pages/widgets/k_back_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: kBackButton(context),
        title: Text(
          'about'.tr(),
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
                      title: 'what_is_aqi'.tr(),
                      assetLocation: 'assets/images/aqi.png',
                      description: 'aqi_description'.tr(),
                      context: context,
                    ),
                    SizedBox(height: 8.h),
                    buildExpansionCard(
                        title: 'what_is_uvi'.tr(),
                        description: 'uvi_decription'.tr(),
                        context: context,
                        assetLocation: 'assets/images/uv.gif'),
                    SizedBox(height: 8.h),
                    buildExpansionCard(
                      title: 'what_is_pm'.tr(),
                      description: 'pm_description'.tr(),
                      context: context,
                    ),
                    SizedBox(height: 8.h),
                    buildExpansionCard(
                      title: 'what_is_pm10'.tr(),
                      description: 'pm10_description'.tr(),
                      context: context,
                      assetLocation: 'assets/images/pm.jpg',
                    ),
                    SizedBox(height: 8.h),
                    buildExpansionCard(
                      title: 'what_is_pm25'.tr(),
                      description: 'pm25_description'.tr(),
                      context: context,
                      assetLocation: 'assets/images/pm.jpg',
                    ),
                    SizedBox(height: 8.h),
                    buildExpansionCard(
                      title: 'which_harmful'.tr(),
                      description: 'which_harmful_decription'.tr(),
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
