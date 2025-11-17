import 'package:flutter/material.dart';
import 'package:weather_app/core/utils/weather_icon_mapper.dart';
import 'package:weather_app/features/weather/domain/entities/day.dart';
import 'package:weather_app/features/weather/presentation/widgets/weather_details.dart';

Widget buildCurrentDayCard(Day day) {
  return Container(
    margin: const EdgeInsets.all(16),
    padding: const EdgeInsets.all(20),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
      boxShadow: [
        BoxShadow(
          color: Colors.blue.shade200.withOpacity(0.5),
          spreadRadius: 2,
          blurRadius: 10,
          offset: const Offset(0, 3),
        ),
      ],
    ),
    child: Column(
      children: [
        Text(
          'Hoy',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.blue.shade700,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          day.datetime,
          style: const TextStyle(fontSize: 14, color: Colors.grey),
        ),
        const SizedBox(height: 16),

        // Icono del clima
        Icon(getWeatherIcon(day.icon), size: 80, color: Colors.blue.shade600),
        const SizedBox(height: 16),

        // Temperatura actual
        Text(
          '${day.temp.round()}°',
          style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
        ),

        // Temperatura máxima y mínima
        const SizedBox(height: 16),

        // Condiciones
        Text(
          day.conditions,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 8),
        Text(
          day.conditions,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 14, color: Colors.grey),
        ),
        const SizedBox(height: 20),

        // Detalles adicionales
        buildWeatherDetails(day),
      ],
    ),
  );
}
