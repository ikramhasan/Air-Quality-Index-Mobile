import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

InkWell settingsButton({
  @required String title,
  @required FaIcon leading,
  @required Function onTap,
  Widget trailing,
}) {
  return InkWell(
    onTap: onTap,
    child: ListTile(
      title: Text(title),
      leading: leading,
      trailing: trailing,
    ),
  );
}
