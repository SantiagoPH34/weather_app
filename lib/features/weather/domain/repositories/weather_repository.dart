import 'package:weather_app/features/weather/domain/entities/event.dart';
import 'package:weather_app/features/weather/domain/entities/location.dart';

abstract class WeatherRepository {
  /// Obtiene el clima desde remoto o cache (según conexión)
  Future<Location> getWeather(double lat, double lon);

  /// Obtiene SOLO cache 
  Future<Location?> getLastWeatherCache();

  /// Guarda localmente una búsqueda completa de clima
  Future<void> cacheWeather(Location location);

  /// Guarda un evento climático como favorito
  Future<void> saveFavorite(Event event);

  /// Elimina un evento favorito
  Future<void> deleteFavorite(String id);

  /// Retorna los eventos marcados como favoritos
  Future<List<Event>> getFavorites();
}
