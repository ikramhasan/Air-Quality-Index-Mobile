import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

buildSideBar(BuildContext context) {
  return Container(
    height: MediaQuery.of(context).size.height,
    color: Theme.of(context).cardColor,
    child: Padding(
      padding: EdgeInsets.all(8.h),
      child: Center(
        child: RotatedBox(
          quarterTurns: 3,
          child: Text(
            'Air Quality Index',
            style: GoogleFonts.faunaOne(
              fontSize: 18.h,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    ),
  );
}
