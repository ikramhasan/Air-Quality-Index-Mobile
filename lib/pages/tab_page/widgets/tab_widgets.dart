import 'package:aqi/models/air_quality_index.dart';
import 'package:aqi/pages/about_page/about_page.dart';
import 'package:aqi/pages/home_page/home_page.dart';
import 'package:aqi/pages/settings/settings_page.dart';
import 'package:aqi/pages/statistics_page/statistics_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

List<Widget> buildScreens(AirQualityIndex aqi) {
  return [
    HomePage(
      aqi: aqi,
    ),
    StatisticsPage(
      aqi: aqi,
    ),
    AboutPage(),
    SettingsPage(),
  ];
}

List<PersistentBottomNavBarItem> navBarsItems(context) {
  return [
    PersistentBottomNavBarItem(
      textStyle: GoogleFonts.faunaOne(),
      icon: FaIcon(FontAwesomeIcons.home),
      title: ("Home"),
      activeColor: Colors.blue,
      inactiveColor: Colors.white70,
    ),
    PersistentBottomNavBarItem(
      icon: FaIcon(FontAwesomeIcons.thermometerThreeQuarters),
      title: ("Statistics"),
      textStyle: GoogleFonts.faunaOne(),
      activeColor: Colors.blue,
      inactiveColor: Colors.white70,
    ),
    PersistentBottomNavBarItem(
      icon: FaIcon(FontAwesomeIcons.infoCircle),
      title: ("About"),
      textStyle: GoogleFonts.faunaOne(),
      activeColor: Colors.blue,
      inactiveColor: Colors.white70,
    ),
    PersistentBottomNavBarItem(
      icon: FaIcon(FontAwesomeIcons.slidersH),
      title: ("Settings"),
      textStyle: GoogleFonts.faunaOne(),
      activeColor: Colors.blue,
      inactiveColor: Colors.white70,
    ),
  ];
}
