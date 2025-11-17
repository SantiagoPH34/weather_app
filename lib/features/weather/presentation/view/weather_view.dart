import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:weather_app/core/domain/entities/connection_status.dart';
import 'package:weather_app/features/weather/presentation/providers/location_provider.dart';
import 'package:weather_app/features/weather/domain/entities/day.dart';
import 'package:weather_app/features/weather/presentation/providers/network_providers.dart';
import 'package:weather_app/features/weather/presentation/providers/weather_params.dart';
import 'package:weather_app/features/weather/presentation/providers/weather_providers.dart';
import 'package:weather_app/features/weather/presentation/widgets/card_day.dart';
import 'package:weather_app/features/weather/presentation/widgets/current_day.dart';
import 'package:weather_app/features/weather/presentation/widgets/event_section.dart';
import 'package:weather_app/features/weather/presentation/widgets/location_header.dart';

class WeatherHomeScreen extends ConsumerStatefulWidget {
  const WeatherHomeScreen({super.key});

  @override
  ConsumerState<WeatherHomeScreen> createState() => _WeatherHomeScreenState();
}

class _WeatherHomeScreenState extends ConsumerState<WeatherHomeScreen> {
  // Coordenadas de respaldo (ej. Londres) si la geolocalización falla
  static const double _fallbackLat = 51.5074;
  static const double _fallbackLon = -0.1278;

  GoogleMapController? mapController;

  Set<Marker> markers = {};

  @override
  void initState() {
    super.initState();
    Future.microtask(() => getCurrentLocation(ref));
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  void _onMapTap(LatLng newPosition) {
    final newCoords = Coordinates(
      lat: newPosition.latitude,
      lon: newPosition.longitude,
    );

    ref.read(currentCoordinatesProvider.notifier).state = newCoords;

    setState(() {
      markers = {
        Marker(
          markerId: const MarkerId('selected_location'),
          position: newPosition,
          infoWindow: InfoWindow(
            title: 'Ubicación Seleccionada',
            snippet: 'Clima de esta zona cargado',
          ),
        ),
      };
    });

    mapController?.animateCamera(CameraUpdate.newLatLng(newPosition));
  }

  void _setInitialMarker(double lat, double lon) {
    final center = LatLng(lat, lon);

    if (markers.isEmpty || markers.first.position != center) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        setState(() {
          markers = {
            Marker(
              markerId: const MarkerId('current_location'),
              position: center,
              infoWindow: InfoWindow(
                title: (lat == _fallbackLat && lon == _fallbackLon)
                    ? 'Ubicación de Respaldo (Londres)'
                    : 'Ubicación Actual',
                snippet: 'Toca el mapa para seleccionar otra zona',
              ),
            ),
          };
        });
        mapController?.animateCamera(CameraUpdate.newLatLng(center));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final connectionStatusAsync = ref.watch(connectionStatusStreamProvider);
    final isOnline = connectionStatusAsync.value == ConnectionStatus.online;
    final isOffline = connectionStatusAsync.value == ConnectionStatus.offline;

    final currentCoords = ref.watch(currentCoordinatesProvider);

    final lat = currentCoords?.lat ?? _fallbackLat;
    final lon = currentCoords?.lon ?? _fallbackLon;

    _setInitialMarker(lat, lon);

    final weatherAsync = ref.watch(
      getWeatherProvider(WeatherParams(lat: lat, lon: lon)),
    );

    final showingOfflineData = isOffline && weatherAsync.hasValue;

    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Weather App'),
            if (connectionStatusAsync.isLoading)
              const SizedBox(
                width: 15,
                height: 15,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: Colors.white,
                ),
              )
            else if (isOnline)
              const Icon(Icons.wifi, size: 20, color: Colors.greenAccent)
            else if (isOffline)
              const Icon(Icons.wifi_off, size: 20, color: Colors.redAccent),
          ],
        ),
        backgroundColor: Colors.blue.shade700,
        elevation: 0,
      ),
      body: Column(
        children: [
          if (showingOfflineData)
            Container(
              padding: const EdgeInsets.all(8),
              color: Colors.orange.shade700,
              child: const Row(
                children: [
                  Icon(Icons.offline_bolt, color: Colors.white),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'Modo Offline: Mostrando últimos datos guardados.',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          Expanded(
            child:
                currentCoords == null &&
                    (lat == _fallbackLat && lon == _fallbackLon)
                ? _buildPermissionPrompt()
                : weatherAsync.when(
                    data: (location) {
                      final currentDay =
                          location.currentDay ??
                          (location.days.isNotEmpty
                              ? location.days.first
                              : null);

                      if (currentDay == null) {
                        return const Center(
                          child: Text('No weather data available'),
                        );
                      }

                      final nextDays = location.days.length > 1
                          ? location.days.skip(1).take(5).toList()
                          : <Day>[];

                      return RefreshIndicator(
                        onRefresh: () async {
                          ref.invalidate(getWeatherProvider);
                        },
                        child: SingleChildScrollView(
                          physics: const AlwaysScrollableScrollPhysics(),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              buildLocationHeader(location),

                              _buildMapSection(lat, lon),

                              buildCurrentDayCard(currentDay),

                              if (currentDay.events != null &&
                                  currentDay.events!.isNotEmpty)
                                buildEventsSection(
                                  currentDay.events!,
                                  'Hoy\'s Events',
                                ),

                              // Próximos días
                              if (nextDays.isNotEmpty) ...[
                                const Padding(
                                  padding: EdgeInsets.all(16.0),
                                  child: Text(
                                    'Proximos dias',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                ...nextDays.map((day) => buildDayCard(day)),
                              ],

                              const SizedBox(height: 20),
                            ],
                          ),
                        ),
                      );
                    },
                    loading: () => const Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircularProgressIndicator(),
                          SizedBox(height: 16),
                          Text('Loading weather data...'),
                        ],
                      ),
                    ),
                    error: (error, stack) => Center(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.error_outline,
                              color: Colors.red,
                              size: 60,
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'Error loading weather data',
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              error.toString(),
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            const SizedBox(height: 16),
                            ElevatedButton.icon(
                              onPressed: () {
                                getCurrentLocation(ref).then((_) {
                                  ref.invalidate(getWeatherProvider);
                                });
                              },
                              icon: const Icon(Icons.refresh),
                              label: const Text('Retry / Get Location'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildMapSection(double lat, double lon) {
    final LatLng center = LatLng(lat, lon);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Ubicación GPS | Toca para cambiar la zona',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.blueGrey,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(
              'Lat: ${lat.toStringAsFixed(4)} | Lon: ${lon.toStringAsFixed(4)}',
            ),
          ),
          Container(
            height: 250,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.15),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: GoogleMap(
                onMapCreated: _onMapCreated,
                initialCameraPosition: CameraPosition(
                  target: center,
                  zoom: 10.0,
                ),
                scrollGesturesEnabled: true,
                zoomGesturesEnabled: true,
                onTap: _onMapTap,
                markers: markers,

                gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>{
                  Factory<OneSequenceGestureRecognizer>(
                    () => EagerGestureRecognizer(),
                  ),
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPermissionPrompt() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.location_on, size: 80, color: Colors.blueAccent),
            const SizedBox(height: 24),
            Text(
              '¿Dónde estás?',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 8),
            const Text(
              'Permite el acceso a tu ubicación para obtener el clima local. Si no, se mostrará el clima de Londres.',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: () {
                getCurrentLocation(ref).then((_) {
                  ref.invalidate(getWeatherProvider);
                });
              },
              icon: const Icon(Icons.my_location),
              label: const Text('Usar mi ubicación'),
            ),
          ],
        ),
      ),
    );
  }
}
