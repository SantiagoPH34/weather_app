import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:weather_app/core/data/repositories/network_info_repository_impl.dart';
import 'package:weather_app/core/domain/entities/connection_status.dart';
import 'package:weather_app/core/domain/repositories/network_info_repository.dart';

final connectivityProvider = Provider<Connectivity>((ref) => Connectivity());

final networkInfoRepositoryProvider = Provider<NetworkInfoRepository>((ref) {
  return NetworkInfoRepositoryImpl(ref.watch(connectivityProvider));
});

final connectionStatusStreamProvider = StreamProvider<ConnectionStatus>((ref) {
  final networkRepo = ref.watch(networkInfoRepositoryProvider);
  return networkRepo.connectionStatusStream;
});