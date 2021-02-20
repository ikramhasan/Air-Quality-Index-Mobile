import 'package:aqi/pages/widgets/k_back_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:settings_ui/settings_ui.dart';

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
            children: [
              SettingsSection(
                title: 'Common',
                tiles: [
                  SettingsTile(
                    title: 'Language',
                    subtitle: 'English',
                    leading: Icon(Icons.language),
                    onPressed: (BuildContext context) {},
                  ),
                  SettingsTile.switchTile(
                    title: 'Dark mode',
                    leading: FaIcon(FontAwesomeIcons.adjust),
                    switchValue: true,
                    onToggle: (bool value) {},
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              SettingsSection(
                title: 'Misc',
                tiles: [
                  SettingsTile(
                    title: 'About',
                    leading: FaIcon(FontAwesomeIcons.fileAlt),
                    trailing: FaIcon(FontAwesomeIcons.angleRight),
                    onPressed: (BuildContext context) {},
                  ),
                  SettingsTile(
                    title: 'Licenses',
                    leading: FaIcon(FontAwesomeIcons.scroll),
                    trailing: FaIcon(FontAwesomeIcons.angleRight),
                    onPressed: (BuildContext context) {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
