import 'package:weather_app/flavors.dart';

class WeatherIconMapper {
  static const Map<String, String> iconFileNameMap = {
    // Día/Noche Despejado
    'clear-day': 'clear-day.svg',
    'clear-night': 'clear-night.svg',

    // Nublado / Parcialmente Nublado
    'cloudy': 'cloudy.svg',
    'partly-cloudy-day': 'partly-cloudy-day.svg',
    'partly-cloudy-night': 'partly-cloudy-night.svg',

    // Lluvia
    'rain': 'rain.svg',
    'showers-day': 'showers-day.svg',
    'showers-night': 'showers-night.svg',

    // Nieve y Mezclas
    'snow': 'snow.svg',
    'sleet': 'sleet.svg', // Aguanieve
    'hail': 'hail.svg', // Granizo
    'rain-snow': 'rain-snow.svg',
    'rain-snow-showers-day': 'rain-snow-showers-day.svg',
    'rain-snow-showers-night': 'rain-snow-showers-night.svg',
    'snow-showers-day': 'snow-showers-day.svg',
    'snow-showers-night': 'snow-showers-night.svg',

    // Tormentas
    'thunder': 'thunder.svg',
    'thunder-rain': 'thunder-rain.svg',
    'thunder-showers-day': 'thunder-showers-day.svg',
    'thunder-showers-night': 'thunder-showers-night.svg',

    // Otros
    'fog': 'fog.svg',
    'wind': 'wind.svg',
  };

  static String getIconPath(String apiIconName) {
    final fileName = iconFileNameMap[apiIconName];

    if (fileName == null) {
      return '${F.weatherIconBasePath}default.svg';
    }

    // F.weatherIconBasePath devolverá 'assets/icons/dev/' o 'assets/icons/prod/'.
    return '${F.weatherIconBasePath}$fileName';
  }
}
