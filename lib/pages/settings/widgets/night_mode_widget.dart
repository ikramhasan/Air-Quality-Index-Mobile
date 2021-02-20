import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NigthModeWidget extends StatefulWidget {
  @override
  _NigthModeWidgetState createState() => _NigthModeWidgetState();
}

class _NigthModeWidgetState extends State<NigthModeWidget> {
  bool switchValue = false;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('Dark mode'),
      leading: FaIcon(FontAwesomeIcons.adjust),
      trailing: Switch(
        value: switchValue,
        onChanged: (bool value) {
          setState(() {
            switchValue = !switchValue;
          });
          print(switchValue);
        },
      ),
    );
  }
}
