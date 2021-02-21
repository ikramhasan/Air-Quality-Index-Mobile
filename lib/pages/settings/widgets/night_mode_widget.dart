import 'package:aqi/repositories/theme_service.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:easy_localization/easy_localization.dart';

class NigthModeWidget extends StatefulWidget {
  @override
  _NigthModeWidgetState createState() => _NigthModeWidgetState();
}

class _NigthModeWidgetState extends State<NigthModeWidget> {
  bool switchValue = ThemeService().isDarkMode();

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('dark_mode'.tr()),
      leading: FaIcon(FontAwesomeIcons.adjust),
      trailing: Switch(
        value: switchValue,
        onChanged: (bool value) {
          setState(() {
            switchValue = !switchValue;
            ThemeService().changeThemeMode();
          });
        },
      ),
    );
  }
}
