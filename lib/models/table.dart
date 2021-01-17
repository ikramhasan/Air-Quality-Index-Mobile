import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class Data {
  final int minAQI;
  final int maxAQI;
  final String pollutionLevel;
  final String healthImplecations;
  final String cautionaryStatement;
  final Color color;
  final String icon;
  final List<Recommendation> recommendations;

  Data
({
    @required this.minAQI,
    @required this.maxAQI,
    @required this.pollutionLevel,
    @required this.healthImplecations,
    @required this.cautionaryStatement,
    @required this.color,
    @required this.icon,
    @required this.recommendations,
  });
}

class Recommendation {
  final String text;
  final String icon;

  Recommendation({
    @required this.text,
    @required this.icon,
  });
}
