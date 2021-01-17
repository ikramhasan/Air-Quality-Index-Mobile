import 'package:aqi/pages/tab_page/tab_page.dart';
import 'package:aqi/repositories/location_service.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:location/location.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

buildCurrentLocationButton(BuildContext context) {
  return InkWell(
    onTap: () async {
      LocationData location = await getCurrentLocation();
      if (location != null) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TabPage(
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
      child: Center(
        child: Row(
          children: [
            Padding(
              padding:  EdgeInsets.all(10.h),
              child: Icon(Icons.place),
            ),
            SizedBox(width: 30.w),
            Text(
              'Get Current Location',
              style: GoogleFonts.faunaOne(
                fontWeight: FontWeight.bold,
                fontSize: 16.h,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
