import 'package:realm/realm.dart';
import 'package:weather_app/features/weather/data/models/event_model.dart';
import 'package:weather_app/features/weather/data/realm_models/weather_models_realm.dart';
import 'package:weather_app/features/weather/domain/entities/day.dart';
import 'package:weather_app/features/weather/domain/entities/event.dart';

class DayModel extends Day {
  DayModel({
    required super.datetime,
    required super.temp,
    required super.feelslike,
    required super.dew,
    required super.precip,
    required super.precipprob,
    required super.preciptype,
    required super.snow,
    required super.snowdepth,
    required super.windgust,
    required super.windspeed,
    required super.winddir,
    required super.pressure,
    required super.cloudcover,
    required super.visibility,
    required super.solarradiation,
    required super.solarenergy,
    required super.uvindex,
    required super.sunrise,
    required super.sunset,
    required super.moonphase,
    required super.conditions,
    required super.icon,
    required super.stations,
    required super.source,
    super.events,
  });

  factory DayModel.fromJson(Map<String, dynamic> json) => DayModel(
    datetime: (json["datetime"]),
    temp: json["temp"]?.toDouble(),
    feelslike: json["feelslike"]?.toDouble(),
    dew: json["dew"]?.toDouble(),
    precip: json["precip"]?.toDouble(),
    precipprob: json["precipprob"],
    preciptype: json["preciptype"] == null
        ? []
        : List<String>.from(json["preciptype"]!.map((x) => x)),
    snow: json["snow"],
    snowdepth: json["snowdepth"] == null ? 0.0 : json["snowdepth"]?.toDouble(),
    windgust: json["windgust"]?.toDouble(),
    windspeed: json["windspeed"]?.toDouble(),
    winddir: json["winddir"]?.toDouble(),
    pressure: json["pressure"]?.toDouble(),
    cloudcover: json["cloudcover"]?.toDouble(),
    visibility: json["visibility"]?.toDouble(),
    solarradiation: json["solarradiation"]?.toDouble(),
    solarenergy: json["solarenergy"]?.toDouble(),
    uvindex: json["uvindex"],
    sunrise: json["sunrise"],
    sunset: json["sunset"],
    moonphase: json["moonphase"]?.toDouble(),
    conditions: json["conditions"],
    icon: json["icon"],
    stations: json["stations"] == null
        ? []
        : List<String>.from(json["stations"].map((x) => x)),
    source: json["source"],
    events: json["events"] == null
        ? []
        : List<Event>.from(json["events"]!.map((x) => EventModel.fromJson(x))),
  );

  factory DayModel.fromRealm(DayRealm realm) => DayModel(
    datetime: realm.datetime,
    temp: realm.temp,
    feelslike: realm.feelslike,
    dew: realm.dew,
    precip: realm.precip,
    precipprob: realm.precipprob,
    preciptype: realm.preciptype.toList(),
    snow: realm.snow,
    snowdepth: realm.snowdepth,
    windgust: realm.windgust,
    windspeed: realm.windspeed,
    winddir: realm.winddir,
    pressure: realm.pressure,
    cloudcover: realm.cloudcover,
    visibility: realm.visibility,
    solarradiation: realm.solarradiation,
    solarenergy: realm.solarenergy,
    uvindex: realm.uvindex,
    sunrise: realm.sunrise,
    sunset: realm.sunset,
    moonphase: realm.moonphase,
    conditions: realm.conditions,
    icon: realm.icon,
    stations: realm.stations.toList(),
    source: realm.source,
    events: realm.events.map((e) => EventModel.fromRealm(e)).toList(),
  );

  DayRealm toRealm() {
    return DayRealm(
      ObjectId(),
      datetime,
      temp,
      feelslike,
      dew,
      precip,
      precipprob,
      snow,
      snowdepth,
      windgust,
      windspeed,
      winddir,
      pressure,
      cloudcover,
      visibility ?? 0.0,
      solarradiation,
      solarenergy,
      uvindex,
      sunrise,
      sunset,
      moonphase,
      conditions,
      icon,
      source,
    );
  }
}
