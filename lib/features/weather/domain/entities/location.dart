import 'package:weather_app/features/weather/domain/entities/day.dart';

class Location {
  int queryCost;
  double latitude;
  double longitude;
  String resolvedAddress;
  String address;
  String timezone;
  double tzoffset;
  List<Day> days;
  Day? currentDay;

  Location({
    required this.queryCost,
    required this.latitude,
    required this.longitude,
    required this.resolvedAddress,
    required this.address,
    required this.timezone,
    required this.tzoffset,
    required this.days,
    required this.currentDay,
  });
  
}
