import 'package:flutter/material.dart';

IconData getWeatherIcon(String iconCode) {
  // Mapeo de códigos de iconos a iconos de Material
  switch (iconCode.toLowerCase()) {
    case 'clear-day':
    case 'sunny':
      return Icons.wb_sunny;
    case 'clear-night':
      return Icons.nightlight_round;
    case 'rain':
    case 'showers-day':
    case 'showers-night':
      return Icons.umbrella;
    case 'snow':
      return Icons.ac_unit;
    case 'sleet':
      return Icons.grain;
    case 'wind':
      return Icons.air;
    case 'fog':
      return Icons.cloud;
    case 'cloudy':
      return Icons.cloud_queue;
    case 'partly-cloudy-day':
    case 'partly-cloudy-night':
      return Icons.cloud_circle;
    case 'thunderstorm':
      return Icons.flash_on;
    default:
      return Icons.wb_cloudy;
  }
}
