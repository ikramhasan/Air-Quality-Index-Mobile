import 'package:aqi/pages/tab_page/tabs_page.dart';
import 'package:aqi/repositories/location_service.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:location/location.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';

buildCurrentLocationButton(BuildContext context) {
  return InkWell(
    onTap: () async {
      LocationData location = await getCurrentLocation();
      if (location != null) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TabsPage(
              location: location,
            ),
          ),
        );
      }
    },
    borderRadius: BorderRadius.circular(10),
    child: Ink(
      height: 60.h,
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 3),
        title: Text(
          'get_current_location'.tr(),
          style: GoogleFonts.faunaOne(
            fontWeight: FontWeight.bold,
            fontSize: 16.h,
            color: Colors.white,
          ),
        ),
        leading: FaIcon(
          FontAwesomeIcons.mapMarkedAlt,
          color: Colors.white,
        ),
      ),
    ),
  );
}
