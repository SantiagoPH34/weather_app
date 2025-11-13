class Hour {
  String datetime;
  int datetimeEpoch;
  double temp;
  double feelslike;
  double humidity;
  double dew;
  double precip;
  int precipprob;
  int snow;
  int snowdepth;
  List<String>? preciptype;
  double windgust;
  double windspeed;
  double winddir;
  double pressure;
  double visibility;
  double cloudcover;
  int solarradiation;
  double solarenergy;
  int uvindex;
  int severerisk;
  String conditions;
  String icon;
  List<String> stations;
  String source;

  Hour({
    required this.datetime,
    required this.datetimeEpoch,
    required this.temp,
    required this.feelslike,
    required this.humidity,
    required this.dew,
    required this.precip,
    required this.precipprob,
    required this.snow,
    required this.snowdepth,
    required this.preciptype,
    required this.windgust,
    required this.windspeed,
    required this.winddir,
    required this.pressure,
    required this.visibility,
    required this.cloudcover,
    required this.solarradiation,
    required this.solarenergy,
    required this.uvindex,
    required this.severerisk,
    required this.conditions,
    required this.icon,
    required this.stations,
    required this.source,
  });

  Map<String, dynamic> toJson() {
    throw UnimplementedError('toJson debe ser implementado por HourModel');
  }
}
