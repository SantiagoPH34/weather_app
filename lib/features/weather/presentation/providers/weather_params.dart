// weather_params.dart
import 'package:equatable/equatable.dart';

class WeatherParams extends Equatable {
  final double lat;
  final double lon;

  const WeatherParams({required this.lat, required this.lon});
  @override
  List<Object?> get props => [lat, lon];
}
