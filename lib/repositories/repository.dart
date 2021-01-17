import 'package:aqi/keys/keys.dart';
import 'package:aqi/models/air_quality_index.dart';
import 'package:aqi/models/error.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class Repository {
  static const String BASE_URL = 'https://api.waqi.info/feed/';

  getDataFromLatLng({
    @required String latitude,
    @required String longitude,
  }) async {
    String url = BASE_URL + 'geo:$latitude;$longitude/?token=$API_KEY';
    var response = await http.get(url);
    try {
      var aqi = airQualityIndexFromJson(response.body);
      return aqi;
    } catch (e) {
      var error = errorFromJson(response.body);
      print(error.data);
      return error;
    }
  }

  getDataFromPlaceName({
    @required String placeName,
  }) async {
    String url = BASE_URL + '$placeName/?token=$API_KEY';
    var response = await http.get(url);

    try {
      var aqi = airQualityIndexFromJson(response.body);
      print(aqi.data.city.name);
      return aqi;
    } catch (e) {
      var error = errorFromJson(response.body);
      print(error.data);
      return error;
    }
  }

}
