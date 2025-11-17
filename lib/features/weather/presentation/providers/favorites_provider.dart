import 'package:flutter_riverpod/legacy.dart';
import 'package:weather_app/features/weather/domain/entities/event.dart';
import 'package:weather_app/features/weather/domain/repositories/weather_repository.dart';
import 'package:weather_app/features/weather/domain/usecases/delete_favorite_event_use_case.dart';
import 'package:weather_app/features/weather/domain/usecases/get_favorites_events_use_case.dart';
import 'package:weather_app/features/weather/domain/usecases/save_favorite_event_use_case.dart';
import 'package:weather_app/features/weather/presentation/providers/weather_repository_provider.dart';

final favoritesProvider =
    StateNotifierProvider<FavoritesStateNotifier, FavoritesState>(
      (ref) => FavoritesStateNotifier(ref.watch(weatherRepositoryProvider)),
    );

class FavoritesState {
  final List<Event> events;
  final bool isLoading;
  final String? error;

  const FavoritesState({
    required this.events,
    required this.isLoading,
    required this.error,
  });

  FavoritesState copyWith({
    List<Event>? events,
    bool? isLoading,
    String? error,
  }) {
    return FavoritesState(
      events: events ?? this.events,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }
}

class FavoritesStateNotifier extends StateNotifier<FavoritesState> {
  final WeatherRepository _repository;

  FavoritesStateNotifier(this._repository)
    : super(const FavoritesState(events: [], isLoading: false, error: null));

  Future<void> loadFavorites() async {
    state = state.copyWith(isLoading: true);
    try {
      final events = await GetFavoritesUseCase(_repository).call();
      state = state.copyWith(events: events, isLoading: false, error: null);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  Future<void> toggleFavorite(Event event) async {
    try {
      await SaveFavoriteUseCase(_repository).call(event);
      await loadFavorites();
    } catch (e) {
      // Manejar error
    }
  }

  Future<void> deleteFavorite(String id) async {
    try {
      await DeleteFavoriteUseCase(_repository).call(id);
      await loadFavorites();
    } catch (e) {
      // Manejar error
    }
  }
}
