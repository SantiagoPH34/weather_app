// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_models_realm.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
class EventRealm extends _EventRealm
    with RealmEntity, RealmObjectBase, RealmObject {
  EventRealm(
    ObjectId id,
    DateTime datetime,
    int datetimeEpoch,
    String type,
    double latitude,
    double longitude,
    double distance,
    String desc,
    int speed,
  ) {
    RealmObjectBase.set(this, '_id', id);
    RealmObjectBase.set(this, 'datetime', datetime);
    RealmObjectBase.set(this, 'datetimeEpoch', datetimeEpoch);
    RealmObjectBase.set(this, 'type', type);
    RealmObjectBase.set(this, 'latitude', latitude);
    RealmObjectBase.set(this, 'longitude', longitude);
    RealmObjectBase.set(this, 'distance', distance);
    RealmObjectBase.set(this, 'desc', desc);
    RealmObjectBase.set(this, 'speed', speed);
  }

  EventRealm._();

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, '_id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, '_id', value);

  @override
  DateTime get datetime =>
      RealmObjectBase.get<DateTime>(this, 'datetime') as DateTime;
  @override
  set datetime(DateTime value) => RealmObjectBase.set(this, 'datetime', value);

  @override
  int get datetimeEpoch =>
      RealmObjectBase.get<int>(this, 'datetimeEpoch') as int;
  @override
  set datetimeEpoch(int value) =>
      RealmObjectBase.set(this, 'datetimeEpoch', value);

  @override
  String get type => RealmObjectBase.get<String>(this, 'type') as String;
  @override
  set type(String value) => RealmObjectBase.set(this, 'type', value);

  @override
  double get latitude =>
      RealmObjectBase.get<double>(this, 'latitude') as double;
  @override
  set latitude(double value) => RealmObjectBase.set(this, 'latitude', value);

  @override
  double get longitude =>
      RealmObjectBase.get<double>(this, 'longitude') as double;
  @override
  set longitude(double value) => RealmObjectBase.set(this, 'longitude', value);

  @override
  double get distance =>
      RealmObjectBase.get<double>(this, 'distance') as double;
  @override
  set distance(double value) => RealmObjectBase.set(this, 'distance', value);

  @override
  String get desc => RealmObjectBase.get<String>(this, 'desc') as String;
  @override
  set desc(String value) => RealmObjectBase.set(this, 'desc', value);

  @override
  int get speed => RealmObjectBase.get<int>(this, 'speed') as int;
  @override
  set speed(int value) => RealmObjectBase.set(this, 'speed', value);

  @override
  Stream<RealmObjectChanges<EventRealm>> get changes =>
      RealmObjectBase.getChanges<EventRealm>(this);

  @override
  Stream<RealmObjectChanges<EventRealm>> changesFor([List<String>? keyPaths]) =>
      RealmObjectBase.getChangesFor<EventRealm>(this, keyPaths);

  @override
  EventRealm freeze() => RealmObjectBase.freezeObject<EventRealm>(this);

  EJsonValue toEJson() {
    return <String, dynamic>{
      '_id': id.toEJson(),
      'datetime': datetime.toEJson(),
      'datetimeEpoch': datetimeEpoch.toEJson(),
      'type': type.toEJson(),
      'latitude': latitude.toEJson(),
      'longitude': longitude.toEJson(),
      'distance': distance.toEJson(),
      'desc': desc.toEJson(),
      'speed': speed.toEJson(),
    };
  }

  static EJsonValue _toEJson(EventRealm value) => value.toEJson();
  static EventRealm _fromEJson(EJsonValue ejson) {
    if (ejson is! Map<String, dynamic>) return raiseInvalidEJson(ejson);
    return switch (ejson) {
      {
        '_id': EJsonValue id,
        'datetime': EJsonValue datetime,
        'datetimeEpoch': EJsonValue datetimeEpoch,
        'type': EJsonValue type,
        'latitude': EJsonValue latitude,
        'longitude': EJsonValue longitude,
        'distance': EJsonValue distance,
        'desc': EJsonValue desc,
        'speed': EJsonValue speed,
      } =>
        EventRealm(
          fromEJson(id),
          fromEJson(datetime),
          fromEJson(datetimeEpoch),
          fromEJson(type),
          fromEJson(latitude),
          fromEJson(longitude),
          fromEJson(distance),
          fromEJson(desc),
          fromEJson(speed),
        ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(EventRealm._);
    register(_toEJson, _fromEJson);
    return const SchemaObject(
      ObjectType.realmObject,
      EventRealm,
      'EventRealm',
      [
        SchemaProperty(
          'id',
          RealmPropertyType.objectid,
          mapTo: '_id',
          primaryKey: true,
        ),
        SchemaProperty('datetime', RealmPropertyType.timestamp),
        SchemaProperty('datetimeEpoch', RealmPropertyType.int),
        SchemaProperty('type', RealmPropertyType.string),
        SchemaProperty('latitude', RealmPropertyType.double),
        SchemaProperty('longitude', RealmPropertyType.double),
        SchemaProperty('distance', RealmPropertyType.double),
        SchemaProperty('desc', RealmPropertyType.string),
        SchemaProperty('speed', RealmPropertyType.int),
      ],
    );
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}

class DayRealm extends _DayRealm
    with RealmEntity, RealmObjectBase, RealmObject {
  DayRealm(
    ObjectId id,
    String datetime,
    double temp,
    double feelslike,
    double dew,
    double precip,
    double precipprob,
    double snow,
    double snowdepth,
    double windgust,
    double windspeed,
    double winddir,
    double pressure,
    double cloudcover,
    double visibility,
    double solarradiation,
    double solarenergy,
    double uvindex,
    String sunrise,
    String sunset,
    double moonphase,
    String conditions,
    String icon,
    String source, {
    Iterable<String> preciptype = const [],
    Iterable<String> stations = const [],
    Iterable<EventRealm> events = const [],
  }) {
    RealmObjectBase.set(this, '_id', id);
    RealmObjectBase.set(this, 'datetime', datetime);
    RealmObjectBase.set(this, 'temp', temp);
    RealmObjectBase.set(this, 'feelslike', feelslike);
    RealmObjectBase.set(this, 'dew', dew);
    RealmObjectBase.set(this, 'precip', precip);
    RealmObjectBase.set(this, 'precipprob', precipprob);
    RealmObjectBase.set<RealmList<String>>(
      this,
      'preciptype',
      RealmList<String>(preciptype),
    );
    RealmObjectBase.set(this, 'snow', snow);
    RealmObjectBase.set(this, 'snowdepth', snowdepth);
    RealmObjectBase.set(this, 'windgust', windgust);
    RealmObjectBase.set(this, 'windspeed', windspeed);
    RealmObjectBase.set(this, 'winddir', winddir);
    RealmObjectBase.set(this, 'pressure', pressure);
    RealmObjectBase.set(this, 'cloudcover', cloudcover);
    RealmObjectBase.set(this, 'visibility', visibility);
    RealmObjectBase.set(this, 'solarradiation', solarradiation);
    RealmObjectBase.set(this, 'solarenergy', solarenergy);
    RealmObjectBase.set(this, 'uvindex', uvindex);
    RealmObjectBase.set(this, 'sunrise', sunrise);
    RealmObjectBase.set(this, 'sunset', sunset);
    RealmObjectBase.set(this, 'moonphase', moonphase);
    RealmObjectBase.set(this, 'conditions', conditions);
    RealmObjectBase.set(this, 'icon', icon);
    RealmObjectBase.set<RealmList<String>>(
      this,
      'stations',
      RealmList<String>(stations),
    );
    RealmObjectBase.set(this, 'source', source);
    RealmObjectBase.set<RealmList<EventRealm>>(
      this,
      'events',
      RealmList<EventRealm>(events),
    );
  }

  DayRealm._();

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, '_id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, '_id', value);

  @override
  String get datetime =>
      RealmObjectBase.get<String>(this, 'datetime') as String;
  @override
  set datetime(String value) => RealmObjectBase.set(this, 'datetime', value);

  @override
  double get temp => RealmObjectBase.get<double>(this, 'temp') as double;
  @override
  set temp(double value) => RealmObjectBase.set(this, 'temp', value);

  @override
  double get feelslike =>
      RealmObjectBase.get<double>(this, 'feelslike') as double;
  @override
  set feelslike(double value) => RealmObjectBase.set(this, 'feelslike', value);

  @override
  double get dew => RealmObjectBase.get<double>(this, 'dew') as double;
  @override
  set dew(double value) => RealmObjectBase.set(this, 'dew', value);

  @override
  double get precip => RealmObjectBase.get<double>(this, 'precip') as double;
  @override
  set precip(double value) => RealmObjectBase.set(this, 'precip', value);

  @override
  double get precipprob =>
      RealmObjectBase.get<double>(this, 'precipprob') as double;
  @override
  set precipprob(double value) =>
      RealmObjectBase.set(this, 'precipprob', value);

  @override
  RealmList<String> get preciptype =>
      RealmObjectBase.get<String>(this, 'preciptype') as RealmList<String>;
  @override
  set preciptype(covariant RealmList<String> value) =>
      throw RealmUnsupportedSetError();

  @override
  double get snow => RealmObjectBase.get<double>(this, 'snow') as double;
  @override
  set snow(double value) => RealmObjectBase.set(this, 'snow', value);

  @override
  double get snowdepth =>
      RealmObjectBase.get<double>(this, 'snowdepth') as double;
  @override
  set snowdepth(double value) => RealmObjectBase.set(this, 'snowdepth', value);

  @override
  double get windgust =>
      RealmObjectBase.get<double>(this, 'windgust') as double;
  @override
  set windgust(double value) => RealmObjectBase.set(this, 'windgust', value);

  @override
  double get windspeed =>
      RealmObjectBase.get<double>(this, 'windspeed') as double;
  @override
  set windspeed(double value) => RealmObjectBase.set(this, 'windspeed', value);

  @override
  double get winddir => RealmObjectBase.get<double>(this, 'winddir') as double;
  @override
  set winddir(double value) => RealmObjectBase.set(this, 'winddir', value);

  @override
  double get pressure =>
      RealmObjectBase.get<double>(this, 'pressure') as double;
  @override
  set pressure(double value) => RealmObjectBase.set(this, 'pressure', value);

  @override
  double get cloudcover =>
      RealmObjectBase.get<double>(this, 'cloudcover') as double;
  @override
  set cloudcover(double value) =>
      RealmObjectBase.set(this, 'cloudcover', value);

  @override
  double get visibility =>
      RealmObjectBase.get<double>(this, 'visibility') as double;
  @override
  set visibility(double value) =>
      RealmObjectBase.set(this, 'visibility', value);

  @override
  double get solarradiation =>
      RealmObjectBase.get<double>(this, 'solarradiation') as double;
  @override
  set solarradiation(double value) =>
      RealmObjectBase.set(this, 'solarradiation', value);

  @override
  double get solarenergy =>
      RealmObjectBase.get<double>(this, 'solarenergy') as double;
  @override
  set solarenergy(double value) =>
      RealmObjectBase.set(this, 'solarenergy', value);

  @override
  double get uvindex => RealmObjectBase.get<double>(this, 'uvindex') as double;
  @override
  set uvindex(double value) => RealmObjectBase.set(this, 'uvindex', value);

  @override
  String get sunrise => RealmObjectBase.get<String>(this, 'sunrise') as String;
  @override
  set sunrise(String value) => RealmObjectBase.set(this, 'sunrise', value);

  @override
  String get sunset => RealmObjectBase.get<String>(this, 'sunset') as String;
  @override
  set sunset(String value) => RealmObjectBase.set(this, 'sunset', value);

  @override
  double get moonphase =>
      RealmObjectBase.get<double>(this, 'moonphase') as double;
  @override
  set moonphase(double value) => RealmObjectBase.set(this, 'moonphase', value);

  @override
  String get conditions =>
      RealmObjectBase.get<String>(this, 'conditions') as String;
  @override
  set conditions(String value) =>
      RealmObjectBase.set(this, 'conditions', value);

  @override
  String get icon => RealmObjectBase.get<String>(this, 'icon') as String;
  @override
  set icon(String value) => RealmObjectBase.set(this, 'icon', value);

  @override
  RealmList<String> get stations =>
      RealmObjectBase.get<String>(this, 'stations') as RealmList<String>;
  @override
  set stations(covariant RealmList<String> value) =>
      throw RealmUnsupportedSetError();

  @override
  String get source => RealmObjectBase.get<String>(this, 'source') as String;
  @override
  set source(String value) => RealmObjectBase.set(this, 'source', value);

  @override
  RealmList<EventRealm> get events =>
      RealmObjectBase.get<EventRealm>(this, 'events') as RealmList<EventRealm>;
  @override
  set events(covariant RealmList<EventRealm> value) =>
      throw RealmUnsupportedSetError();

  @override
  Stream<RealmObjectChanges<DayRealm>> get changes =>
      RealmObjectBase.getChanges<DayRealm>(this);

  @override
  Stream<RealmObjectChanges<DayRealm>> changesFor([List<String>? keyPaths]) =>
      RealmObjectBase.getChangesFor<DayRealm>(this, keyPaths);

  @override
  DayRealm freeze() => RealmObjectBase.freezeObject<DayRealm>(this);

  EJsonValue toEJson() {
    return <String, dynamic>{
      '_id': id.toEJson(),
      'datetime': datetime.toEJson(),
      'temp': temp.toEJson(),
      'feelslike': feelslike.toEJson(),
      'dew': dew.toEJson(),
      'precip': precip.toEJson(),
      'precipprob': precipprob.toEJson(),
      'preciptype': preciptype.toEJson(),
      'snow': snow.toEJson(),
      'snowdepth': snowdepth.toEJson(),
      'windgust': windgust.toEJson(),
      'windspeed': windspeed.toEJson(),
      'winddir': winddir.toEJson(),
      'pressure': pressure.toEJson(),
      'cloudcover': cloudcover.toEJson(),
      'visibility': visibility.toEJson(),
      'solarradiation': solarradiation.toEJson(),
      'solarenergy': solarenergy.toEJson(),
      'uvindex': uvindex.toEJson(),
      'sunrise': sunrise.toEJson(),
      'sunset': sunset.toEJson(),
      'moonphase': moonphase.toEJson(),
      'conditions': conditions.toEJson(),
      'icon': icon.toEJson(),
      'stations': stations.toEJson(),
      'source': source.toEJson(),
      'events': events.toEJson(),
    };
  }

  static EJsonValue _toEJson(DayRealm value) => value.toEJson();
  static DayRealm _fromEJson(EJsonValue ejson) {
    if (ejson is! Map<String, dynamic>) return raiseInvalidEJson(ejson);
    return switch (ejson) {
      {
        '_id': EJsonValue id,
        'datetime': EJsonValue datetime,
        'temp': EJsonValue temp,
        'feelslike': EJsonValue feelslike,
        'dew': EJsonValue dew,
        'precip': EJsonValue precip,
        'precipprob': EJsonValue precipprob,
        'snow': EJsonValue snow,
        'snowdepth': EJsonValue snowdepth,
        'windgust': EJsonValue windgust,
        'windspeed': EJsonValue windspeed,
        'winddir': EJsonValue winddir,
        'pressure': EJsonValue pressure,
        'cloudcover': EJsonValue cloudcover,
        'visibility': EJsonValue visibility,
        'solarradiation': EJsonValue solarradiation,
        'solarenergy': EJsonValue solarenergy,
        'uvindex': EJsonValue uvindex,
        'sunrise': EJsonValue sunrise,
        'sunset': EJsonValue sunset,
        'moonphase': EJsonValue moonphase,
        'conditions': EJsonValue conditions,
        'icon': EJsonValue icon,
        'source': EJsonValue source,
      } =>
        DayRealm(
          fromEJson(id),
          fromEJson(datetime),
          fromEJson(temp),
          fromEJson(feelslike),
          fromEJson(dew),
          fromEJson(precip),
          fromEJson(precipprob),
          fromEJson(snow),
          fromEJson(snowdepth),
          fromEJson(windgust),
          fromEJson(windspeed),
          fromEJson(winddir),
          fromEJson(pressure),
          fromEJson(cloudcover),
          fromEJson(visibility),
          fromEJson(solarradiation),
          fromEJson(solarenergy),
          fromEJson(uvindex),
          fromEJson(sunrise),
          fromEJson(sunset),
          fromEJson(moonphase),
          fromEJson(conditions),
          fromEJson(icon),
          fromEJson(source),
          preciptype: fromEJson(ejson['preciptype']),
          stations: fromEJson(ejson['stations']),
          events: fromEJson(ejson['events']),
        ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(DayRealm._);
    register(_toEJson, _fromEJson);
    return const SchemaObject(ObjectType.realmObject, DayRealm, 'DayRealm', [
      SchemaProperty(
        'id',
        RealmPropertyType.objectid,
        mapTo: '_id',
        primaryKey: true,
      ),
      SchemaProperty('datetime', RealmPropertyType.string),
      SchemaProperty('temp', RealmPropertyType.double),
      SchemaProperty('feelslike', RealmPropertyType.double),
      SchemaProperty('dew', RealmPropertyType.double),
      SchemaProperty('precip', RealmPropertyType.double),
      SchemaProperty('precipprob', RealmPropertyType.double),
      SchemaProperty(
        'preciptype',
        RealmPropertyType.string,
        collectionType: RealmCollectionType.list,
      ),
      SchemaProperty('snow', RealmPropertyType.double),
      SchemaProperty('snowdepth', RealmPropertyType.double),
      SchemaProperty('windgust', RealmPropertyType.double),
      SchemaProperty('windspeed', RealmPropertyType.double),
      SchemaProperty('winddir', RealmPropertyType.double),
      SchemaProperty('pressure', RealmPropertyType.double),
      SchemaProperty('cloudcover', RealmPropertyType.double),
      SchemaProperty('visibility', RealmPropertyType.double),
      SchemaProperty('solarradiation', RealmPropertyType.double),
      SchemaProperty('solarenergy', RealmPropertyType.double),
      SchemaProperty('uvindex', RealmPropertyType.double),
      SchemaProperty('sunrise', RealmPropertyType.string),
      SchemaProperty('sunset', RealmPropertyType.string),
      SchemaProperty('moonphase', RealmPropertyType.double),
      SchemaProperty('conditions', RealmPropertyType.string),
      SchemaProperty('icon', RealmPropertyType.string),
      SchemaProperty(
        'stations',
        RealmPropertyType.string,
        collectionType: RealmCollectionType.list,
      ),
      SchemaProperty('source', RealmPropertyType.string),
      SchemaProperty(
        'events',
        RealmPropertyType.object,
        linkTarget: 'EventRealm',
        collectionType: RealmCollectionType.list,
      ),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}

class LocationRealm extends _LocationRealm
    with RealmEntity, RealmObjectBase, RealmObject {
  LocationRealm(
    String resolvedAddress,
    int queryCost,
    double latitude,
    double longitude,
    String address,
    String timezone,
    double tzoffset, {
    Iterable<DayRealm> days = const [],
    DayRealm? currentDay,
  }) {
    RealmObjectBase.set(this, 'resolvedAddress', resolvedAddress);
    RealmObjectBase.set(this, 'queryCost', queryCost);
    RealmObjectBase.set(this, 'latitude', latitude);
    RealmObjectBase.set(this, 'longitude', longitude);
    RealmObjectBase.set(this, 'address', address);
    RealmObjectBase.set(this, 'timezone', timezone);
    RealmObjectBase.set(this, 'tzoffset', tzoffset);
    RealmObjectBase.set<RealmList<DayRealm>>(
      this,
      'days',
      RealmList<DayRealm>(days),
    );
    RealmObjectBase.set(this, 'currentDay', currentDay);
  }

  LocationRealm._();

  @override
  String get resolvedAddress =>
      RealmObjectBase.get<String>(this, 'resolvedAddress') as String;
  @override
  set resolvedAddress(String value) =>
      RealmObjectBase.set(this, 'resolvedAddress', value);

  @override
  int get queryCost => RealmObjectBase.get<int>(this, 'queryCost') as int;
  @override
  set queryCost(int value) => RealmObjectBase.set(this, 'queryCost', value);

  @override
  double get latitude =>
      RealmObjectBase.get<double>(this, 'latitude') as double;
  @override
  set latitude(double value) => RealmObjectBase.set(this, 'latitude', value);

  @override
  double get longitude =>
      RealmObjectBase.get<double>(this, 'longitude') as double;
  @override
  set longitude(double value) => RealmObjectBase.set(this, 'longitude', value);

  @override
  String get address => RealmObjectBase.get<String>(this, 'address') as String;
  @override
  set address(String value) => RealmObjectBase.set(this, 'address', value);

  @override
  String get timezone =>
      RealmObjectBase.get<String>(this, 'timezone') as String;
  @override
  set timezone(String value) => RealmObjectBase.set(this, 'timezone', value);

  @override
  double get tzoffset =>
      RealmObjectBase.get<double>(this, 'tzoffset') as double;
  @override
  set tzoffset(double value) => RealmObjectBase.set(this, 'tzoffset', value);

  @override
  RealmList<DayRealm> get days =>
      RealmObjectBase.get<DayRealm>(this, 'days') as RealmList<DayRealm>;
  @override
  set days(covariant RealmList<DayRealm> value) =>
      throw RealmUnsupportedSetError();

  @override
  DayRealm? get currentDay =>
      RealmObjectBase.get<DayRealm>(this, 'currentDay') as DayRealm?;
  @override
  set currentDay(covariant DayRealm? value) =>
      RealmObjectBase.set(this, 'currentDay', value);

  @override
  Stream<RealmObjectChanges<LocationRealm>> get changes =>
      RealmObjectBase.getChanges<LocationRealm>(this);

  @override
  Stream<RealmObjectChanges<LocationRealm>> changesFor([
    List<String>? keyPaths,
  ]) => RealmObjectBase.getChangesFor<LocationRealm>(this, keyPaths);

  @override
  LocationRealm freeze() => RealmObjectBase.freezeObject<LocationRealm>(this);

  EJsonValue toEJson() {
    return <String, dynamic>{
      'resolvedAddress': resolvedAddress.toEJson(),
      'queryCost': queryCost.toEJson(),
      'latitude': latitude.toEJson(),
      'longitude': longitude.toEJson(),
      'address': address.toEJson(),
      'timezone': timezone.toEJson(),
      'tzoffset': tzoffset.toEJson(),
      'days': days.toEJson(),
      'currentDay': currentDay.toEJson(),
    };
  }

  static EJsonValue _toEJson(LocationRealm value) => value.toEJson();
  static LocationRealm _fromEJson(EJsonValue ejson) {
    if (ejson is! Map<String, dynamic>) return raiseInvalidEJson(ejson);
    return switch (ejson) {
      {
        'resolvedAddress': EJsonValue resolvedAddress,
        'queryCost': EJsonValue queryCost,
        'latitude': EJsonValue latitude,
        'longitude': EJsonValue longitude,
        'address': EJsonValue address,
        'timezone': EJsonValue timezone,
        'tzoffset': EJsonValue tzoffset,
      } =>
        LocationRealm(
          fromEJson(resolvedAddress),
          fromEJson(queryCost),
          fromEJson(latitude),
          fromEJson(longitude),
          fromEJson(address),
          fromEJson(timezone),
          fromEJson(tzoffset),
          days: fromEJson(ejson['days']),
          currentDay: fromEJson(ejson['currentDay']),
        ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(LocationRealm._);
    register(_toEJson, _fromEJson);
    return const SchemaObject(
      ObjectType.realmObject,
      LocationRealm,
      'LocationRealm',
      [
        SchemaProperty(
          'resolvedAddress',
          RealmPropertyType.string,
          primaryKey: true,
        ),
        SchemaProperty('queryCost', RealmPropertyType.int),
        SchemaProperty('latitude', RealmPropertyType.double),
        SchemaProperty('longitude', RealmPropertyType.double),
        SchemaProperty('address', RealmPropertyType.string),
        SchemaProperty('timezone', RealmPropertyType.string),
        SchemaProperty('tzoffset', RealmPropertyType.double),
        SchemaProperty(
          'days',
          RealmPropertyType.object,
          linkTarget: 'DayRealm',
          collectionType: RealmCollectionType.list,
        ),
        SchemaProperty(
          'currentDay',
          RealmPropertyType.object,
          optional: true,
          linkTarget: 'DayRealm',
        ),
      ],
    );
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}
