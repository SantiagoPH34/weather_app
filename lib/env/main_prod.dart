import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/features/weather/presentation/view/weather_view.dart';
import 'package:weather_app/flavors.dart';

void main() {
  F.appFlavor = Flavor.prod;

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: F.title,
      debugShowCheckedModeBanner: false,
      home: const WeatherHomeScreen(),
    );
  }
}
