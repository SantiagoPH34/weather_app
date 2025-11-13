// Archivo: features/weather/domain/usecases/get_weather_five_last_use_case.dart

import 'package:dartz/dartz.dart';
import 'package:weather_app/features/weather/domain/entities/location.dart';
import 'package:weather_app/features/weather/domain/repositories/weather_repository.dart';
import 'package:weather_app/core/domain/repositories/network_info_repository.dart';

class GetWeatherFiveLastUseCase {
  final WeatherRepository repository;
  final NetworkInfoRepository networkInfo; // <- Inyectamos la info de red

  GetWeatherFiveLastUseCase({
    required this.repository,
    required this.networkInfo,
  });

  Future<Either<Exception, Location>> call(double long, double lat) async {
    // 1. Verificar la conexión
    final connected = await networkInfo.isConnected();

    if (connected) {
      final apiResult = await repository.getFiveLastDays(long, lat);
      return apiResult.fold((_) async => repository.getLatestCachedDays(), (
        location,
      ) async {
        await repository.saveFiveLastDays(location.days);
        return Right(location);
      });
    } else {
      return repository.getLatestCachedDays();
    }
  }
}
