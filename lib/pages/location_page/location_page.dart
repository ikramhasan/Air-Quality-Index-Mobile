import 'package:aqi/pages/location_page/widgets/build_address_field.dart';
import 'package:aqi/pages/location_page/widgets/build_current_location_button.dart';
import 'package:aqi/pages/location_page/widgets/build_side_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:lottie/lottie.dart';

class LocationPage extends StatelessWidget {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Theme.of(context).canvasColor,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Row(
          children: [
            Flexible(
              flex: 6,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 34.h),
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 60.h),
                      Lottie.asset('assets/lottie/window-view.json'),
                      SizedBox(height: 60.h),
                      Text(
                        'where_are_you'.tr(),
                        style: GoogleFonts.faunaOne(
                            color: Colors.black, fontSize: 24),
                      ),
                      SizedBox(height: 16.h),
                      buildCurrentLocationButton(context),
                      SizedBox(height: 16.h),
                      buildAddressTextField(
                        context: context,
                        controller: controller,
                        scaffoldKey: _scaffoldKey,
                      ),
                      SizedBox(height: 16.h),
                      Text(
                        'enter_exact_location'.tr(),
                        style: GoogleFonts.faunaOne(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: buildSideBar(context),
            )
          ],
        ),
      ),
    );
  }
}
