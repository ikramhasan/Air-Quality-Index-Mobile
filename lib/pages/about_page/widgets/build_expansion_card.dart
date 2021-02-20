import 'package:expansion_card/expansion_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

buildExpansionCard(
    {String title,
    String description,
    String assetLocation,
    BuildContext context}) {
  return ExpansionCard(
    borderRadius: 3.h,
    trailing: FaIcon(
      FontAwesomeIcons.angleDown,
      size: 20,
      color: Colors.grey,
    ),
    backgroundColor: Theme.of(context).primaryColor,
    background: Container(
      height: 225.h,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        border: Border.all(
          color: Colors.blue,
          width: 2,
        ),
      ),
    ),
    title: Text(
      title,
      style: Theme.of(context).textTheme.bodyText2,
    ),
    children: [
      Padding(
        padding: EdgeInsets.all(16.h),
        child: Text(
          description,
          style: Theme.of(context).textTheme.bodyText2,
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
