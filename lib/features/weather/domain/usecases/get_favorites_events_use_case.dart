import 'package:weather_app/features/weather/domain/entities/event.dart';
import 'package:weather_app/features/weather/domain/repositories/weather_repository.dart';

class GetFavoritesUseCase {
  final WeatherRepository repo;

  GetFavoritesUseCase(this.repo);

  Future<List<Event>> call() => repo.getFavorites();
}
