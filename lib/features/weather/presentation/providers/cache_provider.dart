import 'package:flutter_riverpod/legacy.dart';
import 'package:weather_app/features/weather/domain/entities/location.dart';
import 'package:weather_app/features/weather/domain/repositories/weather_repository.dart';
import 'package:weather_app/features/weather/domain/usecases/get_last_weather_cache_use_case.dart';
import 'package:weather_app/features/weather/presentation/providers/weather_repository_provider.dart';

final cacheProvider = StateNotifierProvider<CacheStateNotifier, CacheState>((
  ref,
) {
  final repository = ref.watch(weatherRepositoryProvider);
  return CacheStateNotifier(repository);
});

class CacheState {
  final Location? location;
  final bool isLoading;

  const CacheState({required this.location, required this.isLoading});

  CacheState copyWith({Location? location, bool? isLoading}) {
    return CacheState(
      location: location ?? this.location,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

class CacheStateNotifier extends StateNotifier<CacheState> {
  final WeatherRepository _repository;

  CacheStateNotifier(this._repository)
    : super(const CacheState(location: null, isLoading: false));

  Future<void> loadCachedWeather() async {
    state = state.copyWith(isLoading: true);
    try {
      final location = await GetLastWeatherCacheUseCase(_repository).call();
      state = state.copyWith(location: location, isLoading: false);
    } catch (e) {
      state = state.copyWith(isLoading: false);
    }
  }
}
