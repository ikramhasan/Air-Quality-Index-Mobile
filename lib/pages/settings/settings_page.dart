import 'package:aqi/pages/settings/widgets/night_mode_widget.dart';
import 'package:aqi/pages/settings/widgets/settings_button.dart';
import 'package:aqi/pages/widgets/k_back_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        leading: kBackButton(context),
        title: Text(
          'Settings',
          style: GoogleFonts.faunaOne(
            fontSize: 18.h,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 16.w,
            vertical: 16.h,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 16.w),
                child: Text(
                  'Common',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
              ),
              settingsButton(
                title: 'Language',
                leading: FaIcon(FontAwesomeIcons.language),
                onTap: () {},
              ),
              NigthModeWidget(),
              SizedBox(height: 16.h),
              Padding(
                padding: EdgeInsets.only(left: 16.w),
                child: Text(
                  'Misc',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
              ),
              settingsButton(
                title: 'About',
                leading: FaIcon(FontAwesomeIcons.fileAlt),
                trailing: FaIcon(FontAwesomeIcons.angleRight),
                onTap: () {},
              ),
              settingsButton(
                title: 'Licenses',
                leading: FaIcon(FontAwesomeIcons.scroll),
                trailing: FaIcon(FontAwesomeIcons.angleRight),
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
