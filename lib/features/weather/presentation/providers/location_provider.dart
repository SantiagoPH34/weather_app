// location_provider.dart

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:geolocator/geolocator.dart';

class Coordinates {
  final double lat;
  final double lon;
  const Coordinates({required this.lat, required this.lon});
}

final currentCoordinatesProvider = StateProvider<Coordinates?>((ref) => null);

Future<void> getCurrentLocation(WidgetRef ref) async {
  bool serviceEnabled;
  LocationPermission permission;

  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    return Future.error('Location services are disabled.');
  }

  // 2. Verificar el estado del permiso
  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    // Si el permiso está denegado, solicitarlo
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      // Permiso denegado nuevamente
      return Future.error('Location permissions are denied');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    // Permiso denegado permanentemente. No se puede solicitar más.
    return Future.error(
      'Location permissions are permanently denied, we cannot request permissions.',
    );
  }

  // 3. Obtener la posición
  try {
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    // 4. Actualizar el StateProvider con las nuevas coordenadas
    ref.read(currentCoordinatesProvider.notifier).state = Coordinates(
      lat: position.latitude,
      lon: position.longitude,
    );
  } catch (e) {
    // Manejo de errores al obtener la posición
    return Future.error('Error getting location: $e');
  }
}
