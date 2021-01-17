import 'package:expansion_card/expansion_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

buildExpansionCard(
    {String title,
    String description,
    String assetLocation,
    BuildContext context}) {
  return ExpansionCard(
    borderRadius: 16.h,
    backgroundColor: Theme.of(context).primaryColor,
    background: Container(
      height: 225.h,
      color: Theme.of(context).primaryColor,
    ),
    title: Text(
      title,
      style: GoogleFonts.faunaOne(),
    ),
    children: [
      Padding(
        padding: EdgeInsets.all(16.h),
        child: Text(
          description,
          style: GoogleFonts.faunaOne(),
        ),
      ),
      assetLocation == null
          ? Container()
          : Padding(
              padding: EdgeInsets.fromLTRB(16.h, 0, 16.h, 16.h),
              child: Image.asset(assetLocation),
            ),
    ],
  );
}
