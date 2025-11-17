import 'package:weather_app/features/weather/data/datasource/weather_local_data_source.dart';
import 'package:weather_app/features/weather/data/datasource/weather_remote_data_source.dart';
import 'package:weather_app/features/weather/data/models/event_model.dart';
import 'package:weather_app/features/weather/data/models/location_model.dart';
import 'package:weather_app/features/weather/domain/entities/event.dart';
import 'package:weather_app/features/weather/domain/entities/location.dart';
import 'package:weather_app/features/weather/domain/repositories/weather_repository.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherRemoteDataSource remoteDataSource;
  final WeatherLocalDataSource localDataSource;

  WeatherRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<LocationModel> getWeather(double lat, double lon) async {
    try {
      final remoteLocation = await remoteDataSource.fetchWeather(
        lat: lat,
        lon: lon,
      );

      await cacheWeather(remoteLocation);

      return LocationModel.fromDomain(remoteLocation);
    } catch (networkError) {

      final cachedLocation = await getLastWeatherCache();
      if (cachedLocation != null) {
        return LocationModel.fromDomain(cachedLocation);
      }

      // Esto significa: ni red ni caché disponibles.
      throw Exception(
        'Error al obtener el clima: No hay conexión a Internet y no se encontró información previa en caché. Detalle: $networkError',
      );
    }
  }

  @override
  Future<Location?> getLastWeatherCache() async {
    final cached = await localDataSource.getLastWeatherCache();
    return cached != null ? LocationModel.fromDomain(cached) : null;
  }

  @override
  Future<void> cacheWeather(Location location) async {
    await localDataSource.cacheWeather(LocationModel.fromDomain(location));
  }

  @override
  Future<void> saveFavorite(Event event) async {
    await localDataSource.saveFavorite(event);
  }

  @override
  Future<void> deleteFavorite(String id) async {
    await localDataSource.deleteFavorite(id);
  }

  @override
  Future<List<Event>> getFavorites() async {
    final favorites = await localDataSource.getFavorites();
    return favorites.map((event) => EventModel.fromEntity(event)).toList();
  }
}
