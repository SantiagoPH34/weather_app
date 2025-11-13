import 'dart:convert';

import 'package:weather_app/features/weather/data/models/day_model.dart';
import 'package:weather_app/features/weather/domain/entities/location.dart';

LocationModel locationFromJson(String str) =>
    LocationModel.fromJson(json.decode(str));

String locationToJson(LocationModel data) => json.encode(data.toJson());

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
  });

  factory LocationModel.fromJson(Map<String, dynamic> json) => LocationModel(
    queryCost: json["queryCost"],
    latitude: json["latitude"]?.toDouble(),
    longitude: json["longitude"]?.toDouble(),
    resolvedAddress: json["resolvedAddress"],
    address: json["address"],
    timezone: json["timezone"],
    tzoffset: json["tzoffset"],
    days: List<DayModel>.from(json["days"].map((x) => DayModel.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "queryCost": queryCost,
    "latitude": latitude,
    "longitude": longitude,
    "resolvedAddress": resolvedAddress,
    "address": address,
    "timezone": timezone,
    "tzoffset": tzoffset,
    "days": List<DayModel>.from(days.map((x) => x.toJson())),
  };
}
