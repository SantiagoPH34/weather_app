import 'package:flutter/material.dart';
import 'package:weather_app/features/weather/domain/entities/day.dart';
import 'package:weather_app/features/weather/presentation/widgets/detail_item.dart';

Widget buildWeatherDetails(Day day) {
  return Container(
    padding: const EdgeInsets.all(12),
    decoration: BoxDecoration(
      color: Colors.blue.shade50,
      borderRadius: BorderRadius.circular(12),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        buildDetailItem(Icons.air, '${day.windspeed.round()} km/h', 'Viento'),
        buildDetailItem(Icons.umbrella, '${day.precipprob}%', 'Lluvia'),
      ],
    ),
  );
}
