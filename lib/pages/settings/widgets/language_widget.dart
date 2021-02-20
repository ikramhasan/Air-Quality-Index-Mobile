import 'package:aqi/pages/settings/widgets/settings_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:get/get.dart';

class LanguageWidget extends StatefulWidget {
  @override
  _LanguageWidgetState createState() => _LanguageWidgetState();
}

class _LanguageWidgetState extends State<LanguageWidget> {
  @override
  Widget build(BuildContext context) {
    String value = context.locale.toString() == 'bn_BN' ? 'Bangla' : 'English';
    print(context.locale.toString());
    return settingsButton(
      title: 'Language',
      leading: FaIcon(FontAwesomeIcons.language),
      trailing: Container(
        width: 80,
        child: DropdownButton<String>(
          value: value,
          elevation: 16,
          icon: Icon(Icons.arrow_drop_down_circle),
          isExpanded: true,
          items: <String>['English', 'Bangla'].map((e) {
            return DropdownMenuItem(
              value: e,
              child: Text(e),
            );
          }).toList(),
          onChanged: (newValue) {
            if (newValue == 'English') {
              context.locale = Locale('en', 'US');
            } else {
              context.locale = Locale('bn', 'BN');
            }
            Get.snackbar(
              'Language Changed',
              'Restart the app to see the change',
              snackPosition: SnackPosition.BOTTOM,
            );
            setState(() {
              value = newValue;
            });
          },
        ),
      ),
      onTap: () {},
    );
  }
}
