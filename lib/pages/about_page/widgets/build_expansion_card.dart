import 'package:expansion_card/expansion_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

buildExpansionCard(
    {String title,
    String description,
    String assetLocation,
    BuildContext context}) {
  return ExpansionCard(
    borderRadius: 16,
    backgroundColor: Theme.of(context).primaryColor,
    background: Container(
      height: 225,
      color: Theme.of(context).primaryColor,
    ),
    title: Text(
      title,
      style: GoogleFonts.faunaOne(),
    ),
    children: [
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          description,
          style: GoogleFonts.faunaOne(),
        ),
      ),
      assetLocation == null
          ? Container()
          : Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: Image.asset(assetLocation),
            ),
    ],
  );
}
