import 'package:flutter/material.dart';
import 'package:weather_app/features/weather/domain/entities/location.dart';

Widget buildLocationHeader(Location address) {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: [Colors.blue.shade700, Colors.blue.shade500],
      ),
    ),
    child: Column(
      children: [
        const Icon(Icons.location_on, color: Colors.white, size: 30),
        const SizedBox(height: 8),
        Text(
          "Ubicacion",
          style: const TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          " ${address.address}",
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    ),
  );
}
