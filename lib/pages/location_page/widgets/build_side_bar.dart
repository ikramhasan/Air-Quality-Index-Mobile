import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

buildSideBar(BuildContext context) {
  return Container(
    width: 50,
    height: 800,
    color: Theme.of(context).cardColor,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: RotatedBox(
          quarterTurns: 3,
          child: Text(
            'Air Quality Index',
            style: GoogleFonts.faunaOne(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    ),
  );
}