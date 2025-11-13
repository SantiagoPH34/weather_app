import 'package:dartz/dartz.dart';
import 'package:weather_app/features/weather/domain/repositories/weather_repository.dart';

class SaveEventUseCase {
  WeatherRepository repository;
  SaveEventUseCase(this.repository);
  Future<Either<Exception, bool>> call() async {
    return await repository.saveEvent();
  }
}
