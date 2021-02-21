import 'package:aqi/models/air_quality_index.dart';
import 'package:aqi/pages/error_page/unknow_station_error_page.dart';
import 'package:aqi/repositories/repository.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:aqi/pages/about_page/about_page.dart';
import 'package:aqi/pages/home_page/home_page.dart';
import 'package:aqi/pages/settings/settings_page.dart';
import 'package:aqi/pages/statistics_page/statistics_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:location/location.dart';
import 'package:easy_localization/easy_localization.dart';

class TabsPage extends StatefulWidget {
  final String placeName;
  final LocationData location;

  TabsPage({
    this.placeName,
    this.location,
  });

  @override
  _TabsPageState createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> {
  int _currentIndex = 0;

  final _repository = Repository();
  AirQualityIndex _aqi = AirQualityIndex();
  List<Widget> _screens = [];

  @override
  void initState() {
    _repository
        .getAQI(
      placeName: widget.placeName ?? '',
      latitude: widget.location?.latitude.toString(),
      longitude: widget.location?.longitude.toString(),
    )
        .then((value) {
      setState(() {
        _aqi = value;
        buildPages(_aqi);
      });
    });
    _pageController = PageController();
    super.initState();
  }

  PageController _pageController;

  buildPages(aqi) {
    _screens = [
      HomePage(aqi: aqi),
      StatisticsPage(aqi: aqi),
      AboutPage(),
      SettingsPage(),
    ];
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _aqi == null
        ? UnknownStationErrorPage()
        : Scaffold(
            body: SizedBox.expand(
              child: PageView(
                controller: _pageController,
                onPageChanged: _onPageChanged,
                children: _screens,
              ),
            ),
            bottomNavigationBar: BottomNavyBar(
              animationDuration: Duration(milliseconds: 150),
              selectedIndex: _currentIndex,
              onItemSelected: _onItemSelected,
              itemCornerRadius: 8,
              items: <BottomNavyBarItem>[
                BottomNavyBarItem(
                  title: Text("home".tr()),
                  icon: FaIcon(FontAwesomeIcons.home),
                  activeColor: Colors.blue,
                ),
                BottomNavyBarItem(
                  title: Text("statistics".tr()),
                  icon: FaIcon(FontAwesomeIcons.chartBar),
                  activeColor: Colors.blue,
                ),
                BottomNavyBarItem(
                  title: Text("about".tr()),
                  icon: FaIcon(FontAwesomeIcons.questionCircle),
                  activeColor: Colors.blue,
                ),
                BottomNavyBarItem(
                  title: Text("settings".tr()),
                  icon: FaIcon(FontAwesomeIcons.cog),
                  activeColor: Colors.blue,
                ),
              ],
            ),
          );
  }

  _onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  _onItemSelected(int selectedIndex) {
    setState(() {
      _currentIndex = selectedIndex;
    });
    _pageController.jumpToPage(selectedIndex);
  }
}
