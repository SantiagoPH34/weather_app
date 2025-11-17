import 'package:weather_app/features/weather/domain/entities/location.dart';
import 'package:weather_app/features/weather/domain/repositories/weather_repository.dart';

class GetLastWeatherCacheUseCase {
  final WeatherRepository repo;

  GetLastWeatherCacheUseCase(this.repo);

  Future<Location?> call() => repo.getLastWeatherCache();
}
