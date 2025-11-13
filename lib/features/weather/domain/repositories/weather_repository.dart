import 'package:dartz/dartz.dart';
import 'package:weather_app/features/weather/domain/entities/day.dart';
import 'package:weather_app/features/weather/domain/entities/location.dart';

abstract class WeatherRepository {
  Future<Either<Exception, Location>> getFiveLastDays(double long, double lat);
  Future<Either<Exception, bool>> saveFiveLastDays(List<Day> days);
  Future<Either<Exception, Location>> getLatestCachedDays();
  //TODO: Complementar funcionalidad al crear entidad del evento
  Future<Either<Exception, bool>> saveEvent();
  Future<Either<Exception, bool>> deleteEvent();
  Future<Either<Exception, List<dynamic>>> getEvents();
}
