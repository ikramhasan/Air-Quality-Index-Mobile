// To parse this JSON data, do
//
//     final airQualityIndex = airQualityIndexFromJson(jsonString);

import 'dart:convert';

AirQualityIndex airQualityIndexFromJson(String str) => AirQualityIndex.fromJson(json.decode(str));

String airQualityIndexToJson(AirQualityIndex data) => json.encode(data.toJson());

class AirQualityIndex {
    AirQualityIndex({
        this.status,
        this.data,
    });

    String status;
    Data data;

    factory AirQualityIndex.fromJson(Map<String, dynamic> json) => AirQualityIndex(
        status: json["status"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": data.toJson(),
    };
}

class Data {
    Data({
        this.aqi,
        this.idx,
        this.attributions,
        this.city,
        this.dominentpol,
        this.iaqi,
        this.time,
        this.forecast,
        this.debug,
    });

    int aqi;
    int idx;
    List<Attribution> attributions;
    City city;
    String dominentpol;
    Iaqi iaqi;
    Time time;
    Forecast forecast;
    Debug debug;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        aqi: json["aqi"],
        idx: json["idx"],
        attributions: List<Attribution>.from(json["attributions"].map((x) => Attribution.fromJson(x))),
        city: City.fromJson(json["city"]),
        dominentpol: json["dominentpol"],
        iaqi: Iaqi.fromJson(json["iaqi"]),
        time: Time.fromJson(json["time"]),
        forecast: Forecast.fromJson(json["forecast"]),
        debug: Debug.fromJson(json["debug"]),
    );

    Map<String, dynamic> toJson() => {
        "aqi": aqi,
        "idx": idx,
        "attributions": List<dynamic>.from(attributions.map((x) => x.toJson())),
        "city": city.toJson(),
        "dominentpol": dominentpol,
        "iaqi": iaqi.toJson(),
        "time": time.toJson(),
        "forecast": forecast.toJson(),
        "debug": debug.toJson(),
    };
}

class Attribution {
    Attribution({
        this.url,
        this.name,
        this.logo,
    });

    String url;
    String name;
    String logo;

    factory Attribution.fromJson(Map<String, dynamic> json) => Attribution(
        url: json["url"],
        name: json["name"],
        logo: json["logo"] == null ? null : json["logo"],
    );

    Map<String, dynamic> toJson() => {
        "url": url,
        "name": name,
        "logo": logo == null ? null : logo,
    };
}

class City {
    City({
        this.geo,
        this.name,
        this.url,
    });

    List<double> geo;
    String name;
    String url;

    factory City.fromJson(Map<String, dynamic> json) => City(
        geo: List<double>.from(json["geo"].map((x) => x.toDouble())),
        name: json["name"],
        url: json["url"],
    );

    Map<String, dynamic> toJson() => {
        "geo": List<dynamic>.from(geo.map((x) => x)),
        "name": name,
        "url": url,
    };
}

class Debug {
    Debug({
        this.sync,
    });

    DateTime sync;

    factory Debug.fromJson(Map<String, dynamic> json) => Debug(
        sync: DateTime.parse(json["sync"]),
    );

    Map<String, dynamic> toJson() => {
        "sync": sync.toIso8601String(),
    };
}

class Forecast {
    Forecast({
        this.daily,
    });

    Daily daily;

    factory Forecast.fromJson(Map<String, dynamic> json) => Forecast(
        daily: Daily.fromJson(json["daily"]),
    );

    Map<String, dynamic> toJson() => {
        "daily": daily.toJson(),
    };
}

class Daily {
    Daily({
        this.o3,
        this.pm10,
        this.pm25,
        this.uvi,
    });

    List<O3> o3;
    List<O3> pm10;
    List<O3> pm25;
    List<O3> uvi;

    factory Daily.fromJson(Map<String, dynamic> json) => Daily(
        o3: List<O3>.from(json["o3"].map((x) => O3.fromJson(x))),
        pm10: List<O3>.from(json["pm10"].map((x) => O3.fromJson(x))),
        pm25: List<O3>.from(json["pm25"].map((x) => O3.fromJson(x))),
        uvi: List<O3>.from(json["uvi"].map((x) => O3.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "o3": List<dynamic>.from(o3.map((x) => x.toJson())),
        "pm10": List<dynamic>.from(pm10.map((x) => x.toJson())),
        "pm25": List<dynamic>.from(pm25.map((x) => x.toJson())),
        "uvi": List<dynamic>.from(uvi.map((x) => x.toJson())),
    };
}

class O3 {
    O3({
        this.avg,
        this.day,
        this.max,
        this.min,
    });

    int avg;
    DateTime day;
    int max;
    int min;

    factory O3.fromJson(Map<String, dynamic> json) => O3(
        avg: json["avg"],
        day: DateTime.parse(json["day"]),
        max: json["max"],
        min: json["min"],
    );

    Map<String, dynamic> toJson() => {
        "avg": avg,
        "day": "${day.year.toString().padLeft(4, '0')}-${day.month.toString().padLeft(2, '0')}-${day.day.toString().padLeft(2, '0')}",
        "max": max,
        "min": min,
    };
}

class Iaqi {
    Iaqi({
        this.dew,
        this.h,
        this.p,
        this.pm25,
        this.t,
        this.w,
    });

    Dew dew;
    Dew h;
    Dew p;
    Dew pm25;
    Dew t;
    Dew w;

    factory Iaqi.fromJson(Map<String, dynamic> json) => Iaqi(
        dew: Dew.fromJson(json["dew"]),
        h: Dew.fromJson(json["h"]),
        p: Dew.fromJson(json["p"]),
        pm25: Dew.fromJson(json["pm25"]),
        t: Dew.fromJson(json["t"]),
        w: Dew.fromJson(json["w"]),
    );

    Map<String, dynamic> toJson() => {
        "dew": dew.toJson(),
        "h": h.toJson(),
        "p": p.toJson(),
        "pm25": pm25.toJson(),
        "t": t.toJson(),
        "w": w.toJson(),
    };
}

class Dew {
    Dew({
        this.v,
    });

    double v;

    factory Dew.fromJson(Map<String, dynamic> json) => Dew(
        v: json["v"].toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "v": v,
    };
}

class Time {
    Time({
        this.s,
        this.tz,
        this.v,
        this.iso,
    });

    DateTime s;
    String tz;
    int v;
    DateTime iso;

    factory Time.fromJson(Map<String, dynamic> json) => Time(
        s: DateTime.parse(json["s"]),
        tz: json["tz"],
        v: json["v"],
        iso: DateTime.parse(json["iso"]),
    );

    Map<String, dynamic> toJson() => {
        "s": s.toIso8601String(),
        "tz": tz,
        "v": v,
        "iso": iso.toIso8601String(),
    };
}
