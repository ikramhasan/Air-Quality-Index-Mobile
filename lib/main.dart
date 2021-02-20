import 'package:aqi/pages/location_page/location_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  LicenseRegistry.addLicense(() async* {
    final license = await rootBundle.loadString('assets/google_fonts/OFL.txt');
    yield LicenseEntryWithLineBreaks(['google_fonts'], license);
  });
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
          scaffoldBackgroundColor: Colors.grey[900],
          canvasColor: Color(0xFFFFFAF2),
          primaryColor: Color(0xFF282828),
          accentColor: Colors.white,
          cardColor: Color(0xFF000000),
          primarySwatch: Colors.blue,
          appBarTheme: AppBarTheme(
            centerTitle: true,
          ),
        ),
        home: LocationPage(),
      ),
    );
  }
}
