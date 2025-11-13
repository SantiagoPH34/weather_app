import 'package:dartz/dartz.dart';
import 'package:weather_app/features/weather/domain/repositories/weather_repository.dart';

class DeleteEventUseCase {
  WeatherRepository repository;
  DeleteEventUseCase(this.repository);

  Future<Either<Exception, bool>> call() async {
    return await repository.deleteEvent();
  }
}
