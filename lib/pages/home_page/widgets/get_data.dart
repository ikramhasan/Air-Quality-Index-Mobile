import 'package:aqi/data/data.dart';

getData(int aqi) {
    if (aqi < 50) {
      return data[0];
    } else if (aqi > 51 && aqi < 100) {
      return data[1];
    } else if (aqi > 101 && aqi < 150) {
      return data[2];
    } else if (aqi > 151 && aqi < 200) {
      return data[3];
    } else if (aqi > 201 && aqi < 300) {
      return data[4];
    } else if (aqi > 301 && aqi < 500) {
      return data[5];
    }
  }