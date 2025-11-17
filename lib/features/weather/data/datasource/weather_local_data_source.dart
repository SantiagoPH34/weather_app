import 'package:realm/realm.dart';
import 'package:weather_app/features/weather/data/models/day_model.dart';
import 'package:weather_app/features/weather/data/models/event_model.dart';
import 'package:weather_app/features/weather/data/models/location_model.dart';
import 'package:weather_app/features/weather/data/realm_models/weather_models_realm.dart';
import 'package:weather_app/features/weather/domain/entities/event.dart';

abstract class WeatherLocalDataSource {
  Future<void> cacheWeather(LocationModel location);
  Future<LocationModel?> getLastWeatherCache();

  // Manejo de favoritos (eventos)
  Future<void> saveFavorite(Event event);
  Future<void> deleteFavorite(String eventId);
  Future<List<Event>> getFavorites();
}

class WeatherLocalDataSourceImpl implements WeatherLocalDataSource {
  final Realm realm;

  WeatherLocalDataSourceImpl(this.realm);

  @override
  Future<void> cacheWeather(LocationModel location) async {
    final realmLocation = LocationRealm(
      location.resolvedAddress,
      location.queryCost,
      location.latitude,
      location.longitude,
      location.address,
      location.timezone,
      location.tzoffset,
      days: location.days.map((day) {
        return (day as DayModel).toRealm();
      }).toList(),
      currentDay: (location.currentDay as DayModel).toRealm(),
    );

    realm.write(() {
      realm.add(realmLocation, update: true);
    });
  }

  @override
  Future<LocationModel?> getLastWeatherCache() async {
    final data = realm.all<LocationRealm>().firstOrNull;

    if (data == null) return null;

    return LocationModel.fromRealm(data);
  }

  @override
  Future<void> saveFavorite(Event event) async {
    final realmEvent = EventModel(
      datetime: event.datetime,
      datetimeEpoch: event.datetimeEpoch,
      type: event.type,
      latitude: event.latitude,
      longitude: event.longitude,
      distance: event.distance,
      desc: event.desc,
      speed: event.speed,
    ).toRealm();

    realm.write(() {
      realm.add(realmEvent, update: true);
    });
  }

  @override
  Future<void> deleteFavorite(String id) async {
    final realmEvent = realm.find<EventRealm>(ObjectId.fromHexString(id));
    if (realmEvent == null) return;

    realm.write(() {
      realm.delete(realmEvent);
    });
  }

  @override
  Future<List<Event>> getFavorites() async {
    return realm.all<EventRealm>().map((e) => EventModel.fromRealm(e)).toList();
  }
}
