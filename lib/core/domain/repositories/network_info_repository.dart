import 'package:weather_app/core/domain/entities/connection_status.dart';

abstract class NetworkInfoRepository {
  /// Verifica el estado actual de la conexión.
  Future<bool> isConnected();

  /// Emite el estado de la conexión cada vez que cambia.
  Stream<ConnectionStatus> get connectionStatusStream;
}
