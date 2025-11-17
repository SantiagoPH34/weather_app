import 'package:realm/realm.dart';

part 'weather_models_realm.realm.dart';

/// ------------------------------------------------------
/// EVENT REALM MODEL
/// ------------------------------------------------------
@RealmModel()
class _EventRealm {
  @PrimaryKey()
  @MapTo('_id')
  late ObjectId id;

  late DateTime datetime;
  late int datetimeEpoch;

  late String type;
  late double latitude;
  late double longitude;
  late double distance;
  late String desc;
  late int speed;
}

/// ------------------------------------------------------
/// DAY REALM MODEL
/// ------------------------------------------------------
@RealmModel()
class _DayRealm {
  @PrimaryKey()
  @MapTo('_id')
  late ObjectId id;
  late String datetime;
  late double temp;
  late double feelslike;
  late double dew;
  late double precip;
  late double precipprob;
  late List<String> preciptype;
  late double snow;
  late double snowdepth;
  late double windgust;
  late double windspeed;
  late double winddir;
  late double pressure;
  late double cloudcover;
  late double visibility;
  late double solarradiation;
  late double solarenergy;
  late double uvindex;
  late String sunrise;
  late String sunset;
  late double moonphase;
  late String conditions;
  late String icon;
  late List<String> stations;
  late String source;
  late List<_EventRealm> events;
}

/// ------------------------------------------------------
/// LOCATION REALM MODEL
/// ------------------------------------------------------
@RealmModel()
class _LocationRealm {
  @PrimaryKey()
  late String resolvedAddress;

  late int queryCost;
  late double latitude;
  late double longitude;

  late String address;
  late String timezone;
  late double tzoffset;

  late List<_DayRealm> days;

  _DayRealm? currentDay;
}
