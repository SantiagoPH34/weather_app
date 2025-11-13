import 'package:dartz/dartz.dart';
import 'package:weather_app/features/weather/domain/repositories/weather_repository.dart';

class GetEventsUseCase {
  WeatherRepository repository;
  GetEventsUseCase(this.repository);

  Future<Either<Exception, List<dynamic>>> call() async {
    return await repository.getEvents();
  }
}
