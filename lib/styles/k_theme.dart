import 'package:flutter/material.dart';

var lightThemeData = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: Colors.white,
  canvasColor: Color(0xFFFFFAF2),
  primaryColor: Color(0xFF282828),
  accentColor: Colors.white,
  cardColor: Color(0xFF000000),
  primarySwatch: Colors.blue,
  appBarTheme: AppBarTheme(
    centerTitle: true,
  ),
);

var darkThemeData = ThemeData(
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
);
