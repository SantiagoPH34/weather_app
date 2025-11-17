import 'package:realm/realm.dart';
import 'package:weather_app/features/weather/data/realm_models/weather_models_realm.dart';
import 'package:weather_app/features/weather/domain/entities/event.dart';

class EventModel extends Event {
  EventModel({
    required super.datetime,
    required super.datetimeEpoch,
    required super.type,
    required super.latitude,
    required super.longitude,
    required super.distance,
    required super.desc,
    required super.speed,
  });

  factory EventModel.fromJson(Map<String, dynamic> json) => EventModel(
    datetime: DateTime.parse(json["datetime"]),
    datetimeEpoch: json["datetimeEpoch"],
    type: json["type"],
    latitude: json["latitude"]?.toDouble(),
    longitude: json["longitude"]?.toDouble(),
    distance: json["distance"]?.toDouble(),
    desc: json["desc"],
    speed: json["speed"],
  );
  factory EventModel.fromRealm(EventRealm realm) => EventModel(
    datetime: realm.datetime,
    datetimeEpoch: realm.datetimeEpoch,
    type: realm.type,
    latitude: realm.latitude,
    longitude: realm.longitude,
    distance: realm.distance,
    desc: realm.desc,
    speed: realm.speed,
  );

  factory EventModel.fromEntity(Event entity) => EventModel(
    datetime: entity.datetime,
    datetimeEpoch: entity.datetimeEpoch,
    type: entity.type,
    latitude: entity.latitude,
    longitude: entity.longitude,
    distance: entity.distance,
    desc: entity.desc,
    speed: entity.speed,
  );

  EventRealm toRealm() {
    return EventRealm(
      ObjectId(),
      datetime,
      datetimeEpoch,
      type,
      latitude,
      longitude,
      distance,
      desc,
      speed,
    );
  }
}
