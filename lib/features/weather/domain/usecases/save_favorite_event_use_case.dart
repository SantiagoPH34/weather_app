import 'package:weather_app/features/weather/domain/entities/event.dart';
import 'package:weather_app/features/weather/domain/repositories/weather_repository.dart';

class SaveFavoriteUseCase {
  final WeatherRepository repo;

  SaveFavoriteUseCase(this.repo);

  Future<void> call(Event event) => repo.saveFavorite(event);
}
