import 'package:flutter/material.dart';
import 'package:weather_app/core/utils/weather_icon_mapper.dart';
import 'package:weather_app/features/weather/domain/entities/day.dart';
import 'package:weather_app/features/weather/presentation/widgets/event_section.dart';
import 'package:weather_app/features/weather/presentation/widgets/weather_details.dart';

Widget buildDayCard(Day day) {
  final hasEvents = day.events != null && day.events!.isNotEmpty;

  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    child: Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ExpansionTile(
        leading: Icon(
          getWeatherIcon(day.icon),
          size: 40,
          color: Colors.blue.shade600,
        ),
        title: Text(
          day.datetime,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(day.conditions),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (hasEvents)
              Container(
                margin: const EdgeInsets.only(right: 8),
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: Colors.orange.shade100,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.event,
                  size: 16,
                  color: Colors.orange.shade700,
                ),
              ),
          ],
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(day.conditions),
                const SizedBox(height: 12),
                buildWeatherDetails(day),
                if (hasEvents) ...[
                  const SizedBox(height: 16),
                  buildEventsSection(day.events!, 'Events'),
                ],
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
