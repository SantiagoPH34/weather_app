// weather_repository_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/core/network/dio_provider.dart';
import 'package:weather_app/core/realm/realm_provider.dart';
import 'package:weather_app/features/weather/data/datasource/weather_local_data_source.dart';
import 'package:weather_app/features/weather/data/datasource/weather_remote_data_source.dart';
import 'package:weather_app/features/weather/data/repositories/weather_repository_imp.dart';
import 'package:weather_app/features/weather/domain/repositories/weather_repository.dart';

// Asegúrate de importar realmProvider y dioProvider aquí

final weatherRepositoryProvider = Provider<WeatherRepository>((ref) {
  final dio = ref.read(dioProvider);
  final realm = ref.read(realmProvider);

  return WeatherRepositoryImpl(
    remoteDataSource: WeatherRemoteDataSourceImpl(
      dio,
    ), 
    localDataSource: WeatherLocalDataSourceImpl(
      realm,
    ), 
  );
});
