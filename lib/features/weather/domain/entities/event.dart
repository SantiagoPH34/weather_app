class Event {
  DateTime datetime;
  int datetimeEpoch;
  String type;
  double latitude;
  double longitude;
  double distance;
  String desc;
  int speed;

  Event({
    required this.datetime,
    required this.datetimeEpoch,
    required this.type,
    required this.latitude,
    required this.longitude,
    required this.distance,
    required this.desc,
    required this.speed,
  });
}
