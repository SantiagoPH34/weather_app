// Archivo: lib/core/data/repositories/network_info_repository_impl.dart

import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:weather_app/core/domain/entities/connection_status.dart';
import 'package:weather_app/core/domain/repositories/network_info_repository.dart';

class NetworkInfoRepositoryImpl implements NetworkInfoRepository {
  final Connectivity connectivity;

  NetworkInfoRepositoryImpl(this.connectivity);

  @override
  Future<bool> isConnected() async {
    final results = await connectivity.checkConnectivity();
    return results.any(
      (result) =>
          result == ConnectivityResult.wifi ||
          result == ConnectivityResult.mobile,
    );
  }

  @override
  Stream<ConnectionStatus> get connectionStatusStream {
    return connectivity.onConnectivityChanged.map((results) {
      final isOnline = results.any(
        (result) =>
            result == ConnectivityResult.wifi ||
            result == ConnectivityResult.mobile,
      );

      if (isOnline) {
        return ConnectionStatus.online;
      } else {
        return ConnectionStatus.offline;
      }
    });
  }
}
