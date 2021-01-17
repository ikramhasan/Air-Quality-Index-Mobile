import 'package:aqi/models/air_quality_index.dart';
import 'package:aqi/repositories/repository.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:aqi/pages/tab_page/widgets/tab_widgets.dart';

class TabPage extends StatefulWidget {
  final String placeName;
  final LocationData location;

  TabPage({
    this.placeName,
    this.location,
  });

  @override
  _TabPageState createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> {
  final _repository = Repository();
  AirQualityIndex _aqi = AirQualityIndex();

  getAQI({
    String placeName,
    String latitude,
    String longitude,
  }) async {
    AirQualityIndex aqi = AirQualityIndex();
    if (placeName.isEmpty) {
      aqi = await _repository.getDataFromLatLng(
          latitude: latitude, longitude: longitude);
      setState(() {
        _aqi = aqi;
      });
    } else {
      aqi = await _repository.getDataFromPlaceName(placeName: placeName);
      setState(() {
        _aqi = aqi;
      });
    }
  }

  @override
  void initState() {
    getAQI(
      placeName: widget.placeName ?? '',
      latitude: widget.location?.latitude.toString(),
      longitude: widget.location?.longitude.toString(),
    );
    super.initState();
  }

  PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: buildScreens(_aqi),
      items: navBarsItems(context),
      confineInSafeArea: true,
      backgroundColor: Colors.grey[900],
      handleAndroidBackButtonPress: true,
      stateManagement: true,
      padding: NavBarPadding.all(0),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: ItemAnimationProperties(
        duration: Duration(milliseconds: 50),
        curve: Curves.easeIn,
      ),
      screenTransitionAnimation: ScreenTransitionAnimation(
        animateTabTransition: true,
        curve: Curves.easeIn,
        duration: Duration(milliseconds: 100),
      ),
      navBarStyle: NavBarStyle.style9,
    );
  }
}
