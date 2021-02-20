import 'package:aqi/pages/settings/widgets/settings_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LanguageWidget extends StatefulWidget {
  @override
  _LanguageWidgetState createState() => _LanguageWidgetState();
}

class _LanguageWidgetState extends State<LanguageWidget> {
  String value = 'English';
  @override
  Widget build(BuildContext context) {
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
