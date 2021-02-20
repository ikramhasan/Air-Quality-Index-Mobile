import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

var lightThemeData = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: Color(0xFFFFFAF2),
  canvasColor: Color(0xFFFFFAF2),
  primaryColor: Colors.white,
  accentColor: Colors.grey[500],
  cardColor: Color(0xFF000000),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Colors.white70,
  ),
  primarySwatch: Colors.blue,
  textTheme: TextTheme(
    headline6: GoogleFonts.faunaOne(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    bodyText1: GoogleFonts.faunaOne(
      fontSize: 16,
      color: Colors.black,
    ),
    bodyText2: GoogleFonts.faunaOne(
      fontSize: 14,
      color: Colors.black,
    ),
    subtitle1: GoogleFonts.faunaOne(
      fontSize: 12,
      color: Colors.grey[900],
    ),
  ),
  appBarTheme: AppBarTheme(
    brightness: Brightness.light,
    centerTitle: true,
    backgroundColor: Color(0xFFFFFAF2),
    textTheme: TextTheme(
      headline1: GoogleFonts.faunaOne(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    ),
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
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Colors.grey[850].withOpacity(0.7),
  ),
  textTheme: TextTheme(
    headline6: GoogleFonts.faunaOne(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    bodyText1: GoogleFonts.faunaOne(
      fontSize: 16,
      color: Colors.white,
    ),bodyText2: GoogleFonts.faunaOne(
      fontSize: 14,
      color: Colors.white,
    ),
    subtitle1: GoogleFonts.faunaOne(
      fontSize: 12,
      color: Colors.grey,
    ),
  ),
  appBarTheme: AppBarTheme(
    brightness: Brightness.dark,
    centerTitle: true,
    backgroundColor: Colors.grey[900],
    textTheme: TextTheme(
      headline1: GoogleFonts.faunaOne(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
  ),
);
