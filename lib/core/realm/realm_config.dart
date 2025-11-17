import 'package:realm/realm.dart';
import 'package:weather_app/features/weather/data/realm_models/weather_models_realm.dart';

class RealmConfig {
  static final config = Configuration.local(
    [
      // Lista de esquemas
      EventRealm.schema,
      DayRealm.schema,
      LocationRealm.schema,
    ],
    shouldDeleteIfMigrationNeeded: true, 
  );
}