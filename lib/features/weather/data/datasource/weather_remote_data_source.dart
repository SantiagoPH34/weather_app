import 'package:dio/dio.dart';
import 'package:weather_app/features/weather/data/models/location_model.dart';
import 'package:weather_app/flavors.dart';

abstract class WeatherRemoteDataSource {
  Future<LocationModel> fetchWeather({
    required double lat,
    required double lon,
  });
  Future<LocationModel> fetchLast5Days({
    required double lat,
    required double lon,
  });
}

class WeatherRemoteDataSourceImpl implements WeatherRemoteDataSource {
  final Dio dio;

  WeatherRemoteDataSourceImpl(this.dio);

  @override
  Future<LocationModel> fetchWeather({
    required double lat,
    required double lon,
  }) async {
    final url =
        "${F.baseUrl}timeline/$lat,$lon?unitGroup=metric&lang=es&contentType=json&include=events,current,days&key=${F.apiKey}";

    final response = await dio.get(url);

    if (response.statusCode != 200) {
      throw Exception("Error al consultar el clima");
    }
    print("PETICION REALIZADA");
    return LocationModel.fromJson(response.data);
  }

  @override
  Future<LocationModel> fetchLast5Days({
    required double lat,
    required double lon,
  }) async {
    final url =
        "${F.baseUrl}timeline/$lat,$lon?unitGroup=metric&lang=es&contentType=json&include=events,current,days&key=${F.apiKey}";

    final response = await dio.get(url);

    if (response.statusCode != 200) {
      throw Exception("Error al consultar el clima");
    }
    print("PETICION REALIZADA");
    return LocationModel.fromJson(response.data);
  }
}
