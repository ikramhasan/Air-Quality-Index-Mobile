import 'package:aqi/pages/settings/widgets/language_widget.dart';
import 'package:aqi/pages/settings/widgets/night_mode_widget.dart';
import 'package:aqi/pages/settings/widgets/settings_button.dart';
import 'package:aqi/pages/widgets/k_back_button.dart';
import 'package:aqi/utils/launch_url.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:easy_localization/easy_localization.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        leading: kBackButton(context),
        title: Text(
          'settings'.tr(),
          style: Theme.of(context).appBarTheme.textTheme.headline1,
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
                  'common'.tr(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
              ),
              LanguageWidget(),
              Divider(),
              NigthModeWidget(),
              Divider(),
              SizedBox(height: 16.h),
              Padding(
                padding: EdgeInsets.only(left: 16.w),
                child: Text(
                  'misc'.tr(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
              ),
              settingsButton(
                title: 'report_a_problem'.tr(),
                leading: FaIcon(FontAwesomeIcons.exclamationTriangle),
                trailing: FaIcon(FontAwesomeIcons.angleRight),
                onTap: () {
                  sendMail();
                },
              ),
              Divider(),
              settingsButton(
                title: 'about_me'.tr(),
                leading: FaIcon(FontAwesomeIcons.fileAlt),
                trailing: FaIcon(FontAwesomeIcons.angleRight),
                onTap: () {
                  launchURL('https://ikramhasan-portfolio.web.app/');
                },
              ),
              Divider(),
              settingsButton(
                title: 'licenses'.tr(),
                leading: FaIcon(FontAwesomeIcons.scroll),
                trailing: FaIcon(FontAwesomeIcons.angleRight),
                onTap: () {},
              ),
              Divider(),
              settingsButton(
                title: 'more_apps'.tr(),
                leading: FaIcon(FontAwesomeIcons.googlePlay),
                trailing: FaIcon(FontAwesomeIcons.angleRight),
                onTap: () {
                  launchURL(
                    'https://play.google.com/store/search?q=pub%3AIkram%20Hasan&c=apps',
                  );
                },
              ),
              Divider(),
            ],
          ),
        ),
      ),
    );
  }
}
