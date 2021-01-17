import 'package:aqi/pages/location_page/location_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(392.72727272727275, 737.4545454545455),
      allowFontScaling: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Air Quality Index',
        theme: ThemeData(
          brightness: Brightness.dark,
          scaffoldBackgroundColor: Color(0xFF1F1F1F),
          canvasColor: Color(0xFFFFFAF2),
          primaryColor: Color(0xFF282828),
          accentColor: Colors.white,
          cardColor: Color(0xFF000000),
          primarySwatch: Colors.blue,
        ),
        home: LocationPage(),
      ),
    );
  }
}
