import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/features/weather/domain/entities/location.dart';
import 'package:weather_app/features/weather/domain/usecases/get_weather_use_case.dart';
import 'package:weather_app/features/weather/presentation/providers/weather_params.dart';
import 'package:weather_app/features/weather/presentation/providers/weather_repository_provider.dart';

final getWeatherProvider = FutureProvider.family<Location, WeatherParams>((
  ref,
  params,
) async {
  final repository = ref.read(weatherRepositoryProvider);
  return await GetWeatherUseCase(repository).call(params.lat, params.lon);
});
