import 'package:aqi/pages/location_page/location_page.dart';
import 'package:aqi/repositories/theme_service.dart';
import 'package:aqi/styles/k_theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  // Initialize Get Storage
  await GetStorage.init();

  // Google fonts license file
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
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Air Quality Index',
        theme: lightThemeData,
        darkTheme: darkThemeData,
        themeMode: ThemeService().getThemeMode(),
        home: LocationPage(),
      ),
    );
  }
}
