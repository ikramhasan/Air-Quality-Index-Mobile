import 'package:aqi/pages/location_page/location_page.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

kBackButton(BuildContext context) {
  return BackButton(
    onPressed: () => pushNewScreen(
      context,
      screen: LocationPage(),
      withNavBar: false,
      pageTransitionAnimation: PageTransitionAnimation.cupertino,
    ),
  );
}
