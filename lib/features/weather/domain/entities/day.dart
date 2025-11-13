// To parse this JSON data, do
//
//     final location = locationFromJson(jsonString);

import 'package:weather_app/features/weather/domain/entities/hour.dart';

class Day {
  DateTime datetime;
  int datetimeEpoch;
  double tempmax;
  int tempmin;
  double temp;
  double feelslikemax;
  int feelslikemin;
  double feelslike;
  double dew;
  double humidity;
  double precip;
  int precipprob;
  double precipcover;
  List<String> preciptype;
  int snow;
  int snowdepth;
  double windgust;
  double windspeed;
  double winddir;
  double pressure;
  double cloudcover;
  double visibility;
  double solarradiation;
  double solarenergy;
  int uvindex;
  int severerisk;
  String sunrise;
  int sunriseEpoch;
  String sunset;
  int sunsetEpoch;
  double moonphase;
  String conditions;
  String description;
  String icon;
  List<String> stations;
  String source;
  List<Hour> hours;

  Day({
    required this.datetime,
    required this.datetimeEpoch,
    required this.tempmax,
    required this.tempmin,
    required this.temp,
    required this.feelslikemax,
    required this.feelslikemin,
    required this.feelslike,
    required this.dew,
    required this.humidity,
    required this.precip,
    required this.precipprob,
    required this.precipcover,
    required this.preciptype,
    required this.snow,
    required this.snowdepth,
    required this.windgust,
    required this.windspeed,
    required this.winddir,
    required this.pressure,
    required this.cloudcover,
    required this.visibility,
    required this.solarradiation,
    required this.solarenergy,
    required this.uvindex,
    required this.severerisk,
    required this.sunrise,
    required this.sunriseEpoch,
    required this.sunset,
    required this.sunsetEpoch,
    required this.moonphase,
    required this.conditions,
    required this.description,
    required this.icon,
    required this.stations,
    required this.source,
    required this.hours,
  });

  Map<String, dynamic> toJson() {
    throw UnimplementedError('toJson debe ser implementado por DayModel');
  }
}
