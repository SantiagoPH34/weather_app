import 'package:weather_app/features/weather/domain/repositories/weather_repository.dart';

class DeleteFavoriteUseCase {
  final WeatherRepository repo;

  DeleteFavoriteUseCase(this.repo);

  Future<void> call(String id) => repo.deleteFavorite(id);
}
