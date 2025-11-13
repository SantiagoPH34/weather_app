import 'package:flutter/material.dart';
import 'package:weather_app/app.dart';
import 'package:weather_app/flavors.dart';

void main() {
  F.appFlavor = Flavor.prod;
  runApp(const App());
}
