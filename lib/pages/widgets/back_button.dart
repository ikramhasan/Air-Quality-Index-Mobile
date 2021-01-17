import 'package:aqi/pages/location_page/location_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class ArrowLeftButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: InkWell(
        child: FaIcon(
          FontAwesomeIcons.chevronLeft,
          color: Color(0xFF1194AA),
        ),
        onTap: () => pushNewScreen(
          context,
          screen: LocationPage(),
          withNavBar: false,
          pageTransitionAnimation: PageTransitionAnimation.cupertino,
        ),
      ),
    );
  }
}
