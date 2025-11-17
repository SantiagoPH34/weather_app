import 'package:weather_app/features/weather/domain/entities/event.dart';

class Day {
  String datetime;
  double temp;
  double feelslike;
  double dew;
  double precip;
  double precipprob;
  List<String>? preciptype;
  double snow;
  double snowdepth;
  double windgust;
  double windspeed;
  double winddir;
  double pressure;
  double cloudcover;
  double? visibility;
  double solarradiation;
  double solarenergy;
  double uvindex;
  String sunrise;
  String sunset;
  double moonphase;
  String conditions;
  String icon;
  List<String> stations;
  String source;
  List<Event>? events;

  Day({
    required this.datetime,
    required this.temp,
    required this.feelslike,
    required this.dew,
    required this.precip,
    required this.precipprob,
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
    required this.sunrise,
    required this.sunset,
    required this.moonphase,
    required this.conditions,
    required this.icon,
    required this.stations,
    required this.source,
    this.events,
  });
}
