import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:realm/realm.dart';
import 'package:weather_app/core/realm/realm_config.dart';

final realmProvider = Provider<Realm>((ref) {
  try {
    final realmInstance = Realm(RealmConfig.config);
    return realmInstance;
  } catch (e, stack) {
    debugPrint('REALM INITIALIZATION ERROR: $e');
    debugPrint('STACK TRACE: $stack');
    
    rethrow; 
  }
});