import 'package:weather_app/features/weather/data/models/day_model.dart';
import 'package:weather_app/features/weather/data/realm_models/weather_models_realm.dart';
import 'package:weather_app/features/weather/domain/entities/day.dart';
import 'package:weather_app/features/weather/domain/entities/location.dart';

class LocationModel extends Location {
  LocationModel({
    required super.queryCost,
    required super.latitude,
    required super.longitude,
    required super.resolvedAddress,
    required super.address,
    required super.timezone,
    required super.tzoffset,
    required super.days,
    super.currentDay,
  });

  factory LocationModel.fromJson(Map<String, dynamic> json) => LocationModel(
    queryCost: json["queryCost"],
    latitude: json["latitude"]?.toDouble(),
    longitude: json["longitude"]?.toDouble(),
    resolvedAddress: json["resolvedAddress"],
    address: json["address"],
    timezone: json["timezone"],
    tzoffset: json["tzoffset"],
    days: List<Day>.from(json["days"].map((x) => DayModel.fromJson(x))),
    currentDay: DayModel.fromJson(json["currentConditions"]),
  );

  factory LocationModel.fromRealm(LocationRealm realm) => LocationModel(
    queryCost: realm.queryCost,
    latitude: realm.latitude,
    longitude: realm.longitude,
    resolvedAddress: realm.resolvedAddress,
    address: realm.address,
    timezone: realm.timezone,
    tzoffset: realm.tzoffset,
    days: realm.days.map((d) => DayModel.fromRealm(d)).toList(),
    currentDay: realm.currentDay != null
        ? DayModel.fromRealm(realm.currentDay!)
        : null,
  );

  factory LocationModel.fromDomain(Location location) => LocationModel(
    queryCost: location.queryCost,
    latitude: location.latitude,
    longitude: location.longitude,
    resolvedAddress: location.resolvedAddress,
    address: location.address,
    timezone: location.timezone,
    tzoffset: location.tzoffset,
    days: location.days,
    currentDay: location.currentDay,
  );
}
