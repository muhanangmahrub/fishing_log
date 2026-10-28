// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $SessionsTable extends Sessions with TableInfo<$SessionsTable, Session> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SessionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _startedAtMeta = const VerificationMeta(
    'startedAt',
  );
  @override
  late final GeneratedColumn<DateTime> startedAt = GeneratedColumn<DateTime>(
    'started_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _endedAtMeta = const VerificationMeta(
    'endedAt',
  );
  @override
  late final GeneratedColumn<DateTime> endedAt = GeneratedColumn<DateTime>(
    'ended_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _latitudeMeta = const VerificationMeta(
    'latitude',
  );
  @override
  late final GeneratedColumn<double> latitude = GeneratedColumn<double>(
    'latitude',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _longitudeMeta = const VerificationMeta(
    'longitude',
  );
  @override
  late final GeneratedColumn<double> longitude = GeneratedColumn<double>(
    'longitude',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _locationNameMeta = const VerificationMeta(
    'locationName',
  );
  @override
  late final GeneratedColumn<String> locationName = GeneratedColumn<String>(
    'location_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _ratingMeta = const VerificationMeta('rating');
  @override
  late final GeneratedColumn<int> rating = GeneratedColumn<int>(
    'rating',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    startedAt,
    endedAt,
    latitude,
    longitude,
    locationName,
    notes,
    rating,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'sessions';
  @override
  VerificationContext validateIntegrity(
    Insertable<Session> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('started_at')) {
      context.handle(
        _startedAtMeta,
        startedAt.isAcceptableOrUnknown(data['started_at']!, _startedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_startedAtMeta);
    }
    if (data.containsKey('ended_at')) {
      context.handle(
        _endedAtMeta,
        endedAt.isAcceptableOrUnknown(data['ended_at']!, _endedAtMeta),
      );
    }
    if (data.containsKey('latitude')) {
      context.handle(
        _latitudeMeta,
        latitude.isAcceptableOrUnknown(data['latitude']!, _latitudeMeta),
      );
    } else if (isInserting) {
      context.missing(_latitudeMeta);
    }
    if (data.containsKey('longitude')) {
      context.handle(
        _longitudeMeta,
        longitude.isAcceptableOrUnknown(data['longitude']!, _longitudeMeta),
      );
    } else if (isInserting) {
      context.missing(_longitudeMeta);
    }
    if (data.containsKey('location_name')) {
      context.handle(
        _locationNameMeta,
        locationName.isAcceptableOrUnknown(
          data['location_name']!,
          _locationNameMeta,
        ),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('rating')) {
      context.handle(
        _ratingMeta,
        rating.isAcceptableOrUnknown(data['rating']!, _ratingMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Session map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Session(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      startedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}started_at'],
      )!,
      endedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}ended_at'],
      ),
      latitude: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}latitude'],
      )!,
      longitude: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}longitude'],
      )!,
      locationName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}location_name'],
      ),
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
      rating: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}rating'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $SessionsTable createAlias(String alias) {
    return $SessionsTable(attachedDatabase, alias);
  }
}

class Session extends DataClass implements Insertable<Session> {
  final String id;
  final DateTime startedAt;
  final DateTime? endedAt;
  final double latitude;
  final double longitude;
  final String? locationName;
  final String? notes;
  final int? rating;
  final DateTime createdAt;
  final DateTime updatedAt;
  const Session({
    required this.id,
    required this.startedAt,
    this.endedAt,
    required this.latitude,
    required this.longitude,
    this.locationName,
    this.notes,
    this.rating,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['started_at'] = Variable<DateTime>(startedAt);
    if (!nullToAbsent || endedAt != null) {
      map['ended_at'] = Variable<DateTime>(endedAt);
    }
    map['latitude'] = Variable<double>(latitude);
    map['longitude'] = Variable<double>(longitude);
    if (!nullToAbsent || locationName != null) {
      map['location_name'] = Variable<String>(locationName);
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    if (!nullToAbsent || rating != null) {
      map['rating'] = Variable<int>(rating);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  SessionsCompanion toCompanion(bool nullToAbsent) {
    return SessionsCompanion(
      id: Value(id),
      startedAt: Value(startedAt),
      endedAt: endedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(endedAt),
      latitude: Value(latitude),
      longitude: Value(longitude),
      locationName: locationName == null && nullToAbsent
          ? const Value.absent()
          : Value(locationName),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
      rating: rating == null && nullToAbsent
          ? const Value.absent()
          : Value(rating),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory Session.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Session(
      id: serializer.fromJson<String>(json['id']),
      startedAt: serializer.fromJson<DateTime>(json['startedAt']),
      endedAt: serializer.fromJson<DateTime?>(json['endedAt']),
      latitude: serializer.fromJson<double>(json['latitude']),
      longitude: serializer.fromJson<double>(json['longitude']),
      locationName: serializer.fromJson<String?>(json['locationName']),
      notes: serializer.fromJson<String?>(json['notes']),
      rating: serializer.fromJson<int?>(json['rating']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'startedAt': serializer.toJson<DateTime>(startedAt),
      'endedAt': serializer.toJson<DateTime?>(endedAt),
      'latitude': serializer.toJson<double>(latitude),
      'longitude': serializer.toJson<double>(longitude),
      'locationName': serializer.toJson<String?>(locationName),
      'notes': serializer.toJson<String?>(notes),
      'rating': serializer.toJson<int?>(rating),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  Session copyWith({
    String? id,
    DateTime? startedAt,
    Value<DateTime?> endedAt = const Value.absent(),
    double? latitude,
    double? longitude,
    Value<String?> locationName = const Value.absent(),
    Value<String?> notes = const Value.absent(),
    Value<int?> rating = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => Session(
    id: id ?? this.id,
    startedAt: startedAt ?? this.startedAt,
    endedAt: endedAt.present ? endedAt.value : this.endedAt,
    latitude: latitude ?? this.latitude,
    longitude: longitude ?? this.longitude,
    locationName: locationName.present ? locationName.value : this.locationName,
    notes: notes.present ? notes.value : this.notes,
    rating: rating.present ? rating.value : this.rating,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  Session copyWithCompanion(SessionsCompanion data) {
    return Session(
      id: data.id.present ? data.id.value : this.id,
      startedAt: data.startedAt.present ? data.startedAt.value : this.startedAt,
      endedAt: data.endedAt.present ? data.endedAt.value : this.endedAt,
      latitude: data.latitude.present ? data.latitude.value : this.latitude,
      longitude: data.longitude.present ? data.longitude.value : this.longitude,
      locationName: data.locationName.present
          ? data.locationName.value
          : this.locationName,
      notes: data.notes.present ? data.notes.value : this.notes,
      rating: data.rating.present ? data.rating.value : this.rating,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Session(')
          ..write('id: $id, ')
          ..write('startedAt: $startedAt, ')
          ..write('endedAt: $endedAt, ')
          ..write('latitude: $latitude, ')
          ..write('longitude: $longitude, ')
          ..write('locationName: $locationName, ')
          ..write('notes: $notes, ')
          ..write('rating: $rating, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    startedAt,
    endedAt,
    latitude,
    longitude,
    locationName,
    notes,
    rating,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Session &&
          other.id == this.id &&
          other.startedAt == this.startedAt &&
          other.endedAt == this.endedAt &&
          other.latitude == this.latitude &&
          other.longitude == this.longitude &&
          other.locationName == this.locationName &&
          other.notes == this.notes &&
          other.rating == this.rating &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class SessionsCompanion extends UpdateCompanion<Session> {
  final Value<String> id;
  final Value<DateTime> startedAt;
  final Value<DateTime?> endedAt;
  final Value<double> latitude;
  final Value<double> longitude;
  final Value<String?> locationName;
  final Value<String?> notes;
  final Value<int?> rating;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const SessionsCompanion({
    this.id = const Value.absent(),
    this.startedAt = const Value.absent(),
    this.endedAt = const Value.absent(),
    this.latitude = const Value.absent(),
    this.longitude = const Value.absent(),
    this.locationName = const Value.absent(),
    this.notes = const Value.absent(),
    this.rating = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SessionsCompanion.insert({
    required String id,
    required DateTime startedAt,
    this.endedAt = const Value.absent(),
    required double latitude,
    required double longitude,
    this.locationName = const Value.absent(),
    this.notes = const Value.absent(),
    this.rating = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       startedAt = Value(startedAt),
       latitude = Value(latitude),
       longitude = Value(longitude),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<Session> custom({
    Expression<String>? id,
    Expression<DateTime>? startedAt,
    Expression<DateTime>? endedAt,
    Expression<double>? latitude,
    Expression<double>? longitude,
    Expression<String>? locationName,
    Expression<String>? notes,
    Expression<int>? rating,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (startedAt != null) 'started_at': startedAt,
      if (endedAt != null) 'ended_at': endedAt,
      if (latitude != null) 'latitude': latitude,
      if (longitude != null) 'longitude': longitude,
      if (locationName != null) 'location_name': locationName,
      if (notes != null) 'notes': notes,
      if (rating != null) 'rating': rating,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SessionsCompanion copyWith({
    Value<String>? id,
    Value<DateTime>? startedAt,
    Value<DateTime?>? endedAt,
    Value<double>? latitude,
    Value<double>? longitude,
    Value<String?>? locationName,
    Value<String?>? notes,
    Value<int?>? rating,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return SessionsCompanion(
      id: id ?? this.id,
      startedAt: startedAt ?? this.startedAt,
      endedAt: endedAt ?? this.endedAt,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      locationName: locationName ?? this.locationName,
      notes: notes ?? this.notes,
      rating: rating ?? this.rating,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (startedAt.present) {
      map['started_at'] = Variable<DateTime>(startedAt.value);
    }
    if (endedAt.present) {
      map['ended_at'] = Variable<DateTime>(endedAt.value);
    }
    if (latitude.present) {
      map['latitude'] = Variable<double>(latitude.value);
    }
    if (longitude.present) {
      map['longitude'] = Variable<double>(longitude.value);
    }
    if (locationName.present) {
      map['location_name'] = Variable<String>(locationName.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (rating.present) {
      map['rating'] = Variable<int>(rating.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SessionsCompanion(')
          ..write('id: $id, ')
          ..write('startedAt: $startedAt, ')
          ..write('endedAt: $endedAt, ')
          ..write('latitude: $latitude, ')
          ..write('longitude: $longitude, ')
          ..write('locationName: $locationName, ')
          ..write('notes: $notes, ')
          ..write('rating: $rating, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SpeciesTable extends Species with TableInfo<$SpeciesTable, Specy> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SpeciesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _isCustomMeta = const VerificationMeta(
    'isCustom',
  );
  @override
  late final GeneratedColumn<bool> isCustom = GeneratedColumn<bool>(
    'is_custom',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_custom" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [id, name, isCustom];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'species';
  @override
  VerificationContext validateIntegrity(
    Insertable<Specy> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('is_custom')) {
      context.handle(
        _isCustomMeta,
        isCustom.isAcceptableOrUnknown(data['is_custom']!, _isCustomMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Specy map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Specy(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      isCustom: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_custom'],
      )!,
    );
  }

  @override
  $SpeciesTable createAlias(String alias) {
    return $SpeciesTable(attachedDatabase, alias);
  }
}

class Specy extends DataClass implements Insertable<Specy> {
  final int id;
  final String name;
  final bool isCustom;
  const Specy({required this.id, required this.name, required this.isCustom});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['is_custom'] = Variable<bool>(isCustom);
    return map;
  }

  SpeciesCompanion toCompanion(bool nullToAbsent) {
    return SpeciesCompanion(
      id: Value(id),
      name: Value(name),
      isCustom: Value(isCustom),
    );
  }

  factory Specy.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Specy(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      isCustom: serializer.fromJson<bool>(json['isCustom']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'isCustom': serializer.toJson<bool>(isCustom),
    };
  }

  Specy copyWith({int? id, String? name, bool? isCustom}) => Specy(
    id: id ?? this.id,
    name: name ?? this.name,
    isCustom: isCustom ?? this.isCustom,
  );
  Specy copyWithCompanion(SpeciesCompanion data) {
    return Specy(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      isCustom: data.isCustom.present ? data.isCustom.value : this.isCustom,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Specy(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('isCustom: $isCustom')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, isCustom);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Specy &&
          other.id == this.id &&
          other.name == this.name &&
          other.isCustom == this.isCustom);
}

class SpeciesCompanion extends UpdateCompanion<Specy> {
  final Value<int> id;
  final Value<String> name;
  final Value<bool> isCustom;
  const SpeciesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.isCustom = const Value.absent(),
  });
  SpeciesCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.isCustom = const Value.absent(),
  }) : name = Value(name);
  static Insertable<Specy> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<bool>? isCustom,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (isCustom != null) 'is_custom': isCustom,
    });
  }

  SpeciesCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<bool>? isCustom,
  }) {
    return SpeciesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      isCustom: isCustom ?? this.isCustom,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (isCustom.present) {
      map['is_custom'] = Variable<bool>(isCustom.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SpeciesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('isCustom: $isCustom')
          ..write(')'))
        .toString();
  }
}

class $BaitsTable extends Baits with TableInfo<$BaitsTable, Bait> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BaitsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _isCustomMeta = const VerificationMeta(
    'isCustom',
  );
  @override
  late final GeneratedColumn<bool> isCustom = GeneratedColumn<bool>(
    'is_custom',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_custom" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [id, name, isCustom];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'baits';
  @override
  VerificationContext validateIntegrity(
    Insertable<Bait> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('is_custom')) {
      context.handle(
        _isCustomMeta,
        isCustom.isAcceptableOrUnknown(data['is_custom']!, _isCustomMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Bait map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Bait(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      isCustom: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_custom'],
      )!,
    );
  }

  @override
  $BaitsTable createAlias(String alias) {
    return $BaitsTable(attachedDatabase, alias);
  }
}

class Bait extends DataClass implements Insertable<Bait> {
  final int id;
  final String name;
  final bool isCustom;
  const Bait({required this.id, required this.name, required this.isCustom});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['is_custom'] = Variable<bool>(isCustom);
    return map;
  }

  BaitsCompanion toCompanion(bool nullToAbsent) {
    return BaitsCompanion(
      id: Value(id),
      name: Value(name),
      isCustom: Value(isCustom),
    );
  }

  factory Bait.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Bait(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      isCustom: serializer.fromJson<bool>(json['isCustom']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'isCustom': serializer.toJson<bool>(isCustom),
    };
  }

  Bait copyWith({int? id, String? name, bool? isCustom}) => Bait(
    id: id ?? this.id,
    name: name ?? this.name,
    isCustom: isCustom ?? this.isCustom,
  );
  Bait copyWithCompanion(BaitsCompanion data) {
    return Bait(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      isCustom: data.isCustom.present ? data.isCustom.value : this.isCustom,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Bait(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('isCustom: $isCustom')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, isCustom);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Bait &&
          other.id == this.id &&
          other.name == this.name &&
          other.isCustom == this.isCustom);
}

class BaitsCompanion extends UpdateCompanion<Bait> {
  final Value<int> id;
  final Value<String> name;
  final Value<bool> isCustom;
  const BaitsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.isCustom = const Value.absent(),
  });
  BaitsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.isCustom = const Value.absent(),
  }) : name = Value(name);
  static Insertable<Bait> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<bool>? isCustom,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (isCustom != null) 'is_custom': isCustom,
    });
  }

  BaitsCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<bool>? isCustom,
  }) {
    return BaitsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      isCustom: isCustom ?? this.isCustom,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (isCustom.present) {
      map['is_custom'] = Variable<bool>(isCustom.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BaitsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('isCustom: $isCustom')
          ..write(')'))
        .toString();
  }
}

class $RigsTable extends Rigs with TableInfo<$RigsTable, Rig> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RigsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _isCustomMeta = const VerificationMeta(
    'isCustom',
  );
  @override
  late final GeneratedColumn<bool> isCustom = GeneratedColumn<bool>(
    'is_custom',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_custom" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [id, name, isCustom];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'rigs';
  @override
  VerificationContext validateIntegrity(
    Insertable<Rig> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('is_custom')) {
      context.handle(
        _isCustomMeta,
        isCustom.isAcceptableOrUnknown(data['is_custom']!, _isCustomMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Rig map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Rig(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      isCustom: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_custom'],
      )!,
    );
  }

  @override
  $RigsTable createAlias(String alias) {
    return $RigsTable(attachedDatabase, alias);
  }
}

class Rig extends DataClass implements Insertable<Rig> {
  final int id;
  final String name;
  final bool isCustom;
  const Rig({required this.id, required this.name, required this.isCustom});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['is_custom'] = Variable<bool>(isCustom);
    return map;
  }

  RigsCompanion toCompanion(bool nullToAbsent) {
    return RigsCompanion(
      id: Value(id),
      name: Value(name),
      isCustom: Value(isCustom),
    );
  }

  factory Rig.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Rig(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      isCustom: serializer.fromJson<bool>(json['isCustom']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'isCustom': serializer.toJson<bool>(isCustom),
    };
  }

  Rig copyWith({int? id, String? name, bool? isCustom}) => Rig(
    id: id ?? this.id,
    name: name ?? this.name,
    isCustom: isCustom ?? this.isCustom,
  );
  Rig copyWithCompanion(RigsCompanion data) {
    return Rig(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      isCustom: data.isCustom.present ? data.isCustom.value : this.isCustom,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Rig(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('isCustom: $isCustom')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, isCustom);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Rig &&
          other.id == this.id &&
          other.name == this.name &&
          other.isCustom == this.isCustom);
}

class RigsCompanion extends UpdateCompanion<Rig> {
  final Value<int> id;
  final Value<String> name;
  final Value<bool> isCustom;
  const RigsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.isCustom = const Value.absent(),
  });
  RigsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.isCustom = const Value.absent(),
  }) : name = Value(name);
  static Insertable<Rig> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<bool>? isCustom,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (isCustom != null) 'is_custom': isCustom,
    });
  }

  RigsCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<bool>? isCustom,
  }) {
    return RigsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      isCustom: isCustom ?? this.isCustom,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (isCustom.present) {
      map['is_custom'] = Variable<bool>(isCustom.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RigsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('isCustom: $isCustom')
          ..write(')'))
        .toString();
  }
}

class $CatchesTable extends Catches with TableInfo<$CatchesTable, Catche> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CatchesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sessionIdMeta = const VerificationMeta(
    'sessionId',
  );
  @override
  late final GeneratedColumn<String> sessionId = GeneratedColumn<String>(
    'session_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES sessions (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _speciesIdMeta = const VerificationMeta(
    'speciesId',
  );
  @override
  late final GeneratedColumn<int> speciesId = GeneratedColumn<int>(
    'species_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES species (id)',
    ),
  );
  static const VerificationMeta _baitIdMeta = const VerificationMeta('baitId');
  @override
  late final GeneratedColumn<int> baitId = GeneratedColumn<int>(
    'bait_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES baits (id)',
    ),
  );
  static const VerificationMeta _rigIdMeta = const VerificationMeta('rigId');
  @override
  late final GeneratedColumn<int> rigId = GeneratedColumn<int>(
    'rig_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES rigs (id)',
    ),
  );
  static const VerificationMeta _lengthCmMeta = const VerificationMeta(
    'lengthCm',
  );
  @override
  late final GeneratedColumn<double> lengthCm = GeneratedColumn<double>(
    'length_cm',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _weightKgMeta = const VerificationMeta(
    'weightKg',
  );
  @override
  late final GeneratedColumn<double> weightKg = GeneratedColumn<double>(
    'weight_kg',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _caughtAtMeta = const VerificationMeta(
    'caughtAt',
  );
  @override
  late final GeneratedColumn<DateTime> caughtAt = GeneratedColumn<DateTime>(
    'caught_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _releasedMeta = const VerificationMeta(
    'released',
  );
  @override
  late final GeneratedColumn<bool> released = GeneratedColumn<bool>(
    'released',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("released" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    sessionId,
    speciesId,
    baitId,
    rigId,
    lengthCm,
    weightKg,
    caughtAt,
    released,
    notes,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'catches';
  @override
  VerificationContext validateIntegrity(
    Insertable<Catche> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('session_id')) {
      context.handle(
        _sessionIdMeta,
        sessionId.isAcceptableOrUnknown(data['session_id']!, _sessionIdMeta),
      );
    } else if (isInserting) {
      context.missing(_sessionIdMeta);
    }
    if (data.containsKey('species_id')) {
      context.handle(
        _speciesIdMeta,
        speciesId.isAcceptableOrUnknown(data['species_id']!, _speciesIdMeta),
      );
    } else if (isInserting) {
      context.missing(_speciesIdMeta);
    }
    if (data.containsKey('bait_id')) {
      context.handle(
        _baitIdMeta,
        baitId.isAcceptableOrUnknown(data['bait_id']!, _baitIdMeta),
      );
    }
    if (data.containsKey('rig_id')) {
      context.handle(
        _rigIdMeta,
        rigId.isAcceptableOrUnknown(data['rig_id']!, _rigIdMeta),
      );
    }
    if (data.containsKey('length_cm')) {
      context.handle(
        _lengthCmMeta,
        lengthCm.isAcceptableOrUnknown(data['length_cm']!, _lengthCmMeta),
      );
    }
    if (data.containsKey('weight_kg')) {
      context.handle(
        _weightKgMeta,
        weightKg.isAcceptableOrUnknown(data['weight_kg']!, _weightKgMeta),
      );
    }
    if (data.containsKey('caught_at')) {
      context.handle(
        _caughtAtMeta,
        caughtAt.isAcceptableOrUnknown(data['caught_at']!, _caughtAtMeta),
      );
    } else if (isInserting) {
      context.missing(_caughtAtMeta);
    }
    if (data.containsKey('released')) {
      context.handle(
        _releasedMeta,
        released.isAcceptableOrUnknown(data['released']!, _releasedMeta),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Catche map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Catche(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      sessionId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}session_id'],
      )!,
      speciesId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}species_id'],
      )!,
      baitId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}bait_id'],
      ),
      rigId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}rig_id'],
      ),
      lengthCm: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}length_cm'],
      ),
      weightKg: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}weight_kg'],
      ),
      caughtAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}caught_at'],
      )!,
      released: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}released'],
      )!,
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
    );
  }

  @override
  $CatchesTable createAlias(String alias) {
    return $CatchesTable(attachedDatabase, alias);
  }
}

class Catche extends DataClass implements Insertable<Catche> {
  final String id;
  final String sessionId;
  final int speciesId;
  final int? baitId;
  final int? rigId;
  final double? lengthCm;
  final double? weightKg;
  final DateTime caughtAt;
  final bool released;
  final String? notes;
  const Catche({
    required this.id,
    required this.sessionId,
    required this.speciesId,
    this.baitId,
    this.rigId,
    this.lengthCm,
    this.weightKg,
    required this.caughtAt,
    required this.released,
    this.notes,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['session_id'] = Variable<String>(sessionId);
    map['species_id'] = Variable<int>(speciesId);
    if (!nullToAbsent || baitId != null) {
      map['bait_id'] = Variable<int>(baitId);
    }
    if (!nullToAbsent || rigId != null) {
      map['rig_id'] = Variable<int>(rigId);
    }
    if (!nullToAbsent || lengthCm != null) {
      map['length_cm'] = Variable<double>(lengthCm);
    }
    if (!nullToAbsent || weightKg != null) {
      map['weight_kg'] = Variable<double>(weightKg);
    }
    map['caught_at'] = Variable<DateTime>(caughtAt);
    map['released'] = Variable<bool>(released);
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    return map;
  }

  CatchesCompanion toCompanion(bool nullToAbsent) {
    return CatchesCompanion(
      id: Value(id),
      sessionId: Value(sessionId),
      speciesId: Value(speciesId),
      baitId: baitId == null && nullToAbsent
          ? const Value.absent()
          : Value(baitId),
      rigId: rigId == null && nullToAbsent
          ? const Value.absent()
          : Value(rigId),
      lengthCm: lengthCm == null && nullToAbsent
          ? const Value.absent()
          : Value(lengthCm),
      weightKg: weightKg == null && nullToAbsent
          ? const Value.absent()
          : Value(weightKg),
      caughtAt: Value(caughtAt),
      released: Value(released),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
    );
  }

  factory Catche.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Catche(
      id: serializer.fromJson<String>(json['id']),
      sessionId: serializer.fromJson<String>(json['sessionId']),
      speciesId: serializer.fromJson<int>(json['speciesId']),
      baitId: serializer.fromJson<int?>(json['baitId']),
      rigId: serializer.fromJson<int?>(json['rigId']),
      lengthCm: serializer.fromJson<double?>(json['lengthCm']),
      weightKg: serializer.fromJson<double?>(json['weightKg']),
      caughtAt: serializer.fromJson<DateTime>(json['caughtAt']),
      released: serializer.fromJson<bool>(json['released']),
      notes: serializer.fromJson<String?>(json['notes']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'sessionId': serializer.toJson<String>(sessionId),
      'speciesId': serializer.toJson<int>(speciesId),
      'baitId': serializer.toJson<int?>(baitId),
      'rigId': serializer.toJson<int?>(rigId),
      'lengthCm': serializer.toJson<double?>(lengthCm),
      'weightKg': serializer.toJson<double?>(weightKg),
      'caughtAt': serializer.toJson<DateTime>(caughtAt),
      'released': serializer.toJson<bool>(released),
      'notes': serializer.toJson<String?>(notes),
    };
  }

  Catche copyWith({
    String? id,
    String? sessionId,
    int? speciesId,
    Value<int?> baitId = const Value.absent(),
    Value<int?> rigId = const Value.absent(),
    Value<double?> lengthCm = const Value.absent(),
    Value<double?> weightKg = const Value.absent(),
    DateTime? caughtAt,
    bool? released,
    Value<String?> notes = const Value.absent(),
  }) => Catche(
    id: id ?? this.id,
    sessionId: sessionId ?? this.sessionId,
    speciesId: speciesId ?? this.speciesId,
    baitId: baitId.present ? baitId.value : this.baitId,
    rigId: rigId.present ? rigId.value : this.rigId,
    lengthCm: lengthCm.present ? lengthCm.value : this.lengthCm,
    weightKg: weightKg.present ? weightKg.value : this.weightKg,
    caughtAt: caughtAt ?? this.caughtAt,
    released: released ?? this.released,
    notes: notes.present ? notes.value : this.notes,
  );
  Catche copyWithCompanion(CatchesCompanion data) {
    return Catche(
      id: data.id.present ? data.id.value : this.id,
      sessionId: data.sessionId.present ? data.sessionId.value : this.sessionId,
      speciesId: data.speciesId.present ? data.speciesId.value : this.speciesId,
      baitId: data.baitId.present ? data.baitId.value : this.baitId,
      rigId: data.rigId.present ? data.rigId.value : this.rigId,
      lengthCm: data.lengthCm.present ? data.lengthCm.value : this.lengthCm,
      weightKg: data.weightKg.present ? data.weightKg.value : this.weightKg,
      caughtAt: data.caughtAt.present ? data.caughtAt.value : this.caughtAt,
      released: data.released.present ? data.released.value : this.released,
      notes: data.notes.present ? data.notes.value : this.notes,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Catche(')
          ..write('id: $id, ')
          ..write('sessionId: $sessionId, ')
          ..write('speciesId: $speciesId, ')
          ..write('baitId: $baitId, ')
          ..write('rigId: $rigId, ')
          ..write('lengthCm: $lengthCm, ')
          ..write('weightKg: $weightKg, ')
          ..write('caughtAt: $caughtAt, ')
          ..write('released: $released, ')
          ..write('notes: $notes')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    sessionId,
    speciesId,
    baitId,
    rigId,
    lengthCm,
    weightKg,
    caughtAt,
    released,
    notes,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Catche &&
          other.id == this.id &&
          other.sessionId == this.sessionId &&
          other.speciesId == this.speciesId &&
          other.baitId == this.baitId &&
          other.rigId == this.rigId &&
          other.lengthCm == this.lengthCm &&
          other.weightKg == this.weightKg &&
          other.caughtAt == this.caughtAt &&
          other.released == this.released &&
          other.notes == this.notes);
}

class CatchesCompanion extends UpdateCompanion<Catche> {
  final Value<String> id;
  final Value<String> sessionId;
  final Value<int> speciesId;
  final Value<int?> baitId;
  final Value<int?> rigId;
  final Value<double?> lengthCm;
  final Value<double?> weightKg;
  final Value<DateTime> caughtAt;
  final Value<bool> released;
  final Value<String?> notes;
  final Value<int> rowid;
  const CatchesCompanion({
    this.id = const Value.absent(),
    this.sessionId = const Value.absent(),
    this.speciesId = const Value.absent(),
    this.baitId = const Value.absent(),
    this.rigId = const Value.absent(),
    this.lengthCm = const Value.absent(),
    this.weightKg = const Value.absent(),
    this.caughtAt = const Value.absent(),
    this.released = const Value.absent(),
    this.notes = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CatchesCompanion.insert({
    required String id,
    required String sessionId,
    required int speciesId,
    this.baitId = const Value.absent(),
    this.rigId = const Value.absent(),
    this.lengthCm = const Value.absent(),
    this.weightKg = const Value.absent(),
    required DateTime caughtAt,
    this.released = const Value.absent(),
    this.notes = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       sessionId = Value(sessionId),
       speciesId = Value(speciesId),
       caughtAt = Value(caughtAt);
  static Insertable<Catche> custom({
    Expression<String>? id,
    Expression<String>? sessionId,
    Expression<int>? speciesId,
    Expression<int>? baitId,
    Expression<int>? rigId,
    Expression<double>? lengthCm,
    Expression<double>? weightKg,
    Expression<DateTime>? caughtAt,
    Expression<bool>? released,
    Expression<String>? notes,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (sessionId != null) 'session_id': sessionId,
      if (speciesId != null) 'species_id': speciesId,
      if (baitId != null) 'bait_id': baitId,
      if (rigId != null) 'rig_id': rigId,
      if (lengthCm != null) 'length_cm': lengthCm,
      if (weightKg != null) 'weight_kg': weightKg,
      if (caughtAt != null) 'caught_at': caughtAt,
      if (released != null) 'released': released,
      if (notes != null) 'notes': notes,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CatchesCompanion copyWith({
    Value<String>? id,
    Value<String>? sessionId,
    Value<int>? speciesId,
    Value<int?>? baitId,
    Value<int?>? rigId,
    Value<double?>? lengthCm,
    Value<double?>? weightKg,
    Value<DateTime>? caughtAt,
    Value<bool>? released,
    Value<String?>? notes,
    Value<int>? rowid,
  }) {
    return CatchesCompanion(
      id: id ?? this.id,
      sessionId: sessionId ?? this.sessionId,
      speciesId: speciesId ?? this.speciesId,
      baitId: baitId ?? this.baitId,
      rigId: rigId ?? this.rigId,
      lengthCm: lengthCm ?? this.lengthCm,
      weightKg: weightKg ?? this.weightKg,
      caughtAt: caughtAt ?? this.caughtAt,
      released: released ?? this.released,
      notes: notes ?? this.notes,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (sessionId.present) {
      map['session_id'] = Variable<String>(sessionId.value);
    }
    if (speciesId.present) {
      map['species_id'] = Variable<int>(speciesId.value);
    }
    if (baitId.present) {
      map['bait_id'] = Variable<int>(baitId.value);
    }
    if (rigId.present) {
      map['rig_id'] = Variable<int>(rigId.value);
    }
    if (lengthCm.present) {
      map['length_cm'] = Variable<double>(lengthCm.value);
    }
    if (weightKg.present) {
      map['weight_kg'] = Variable<double>(weightKg.value);
    }
    if (caughtAt.present) {
      map['caught_at'] = Variable<DateTime>(caughtAt.value);
    }
    if (released.present) {
      map['released'] = Variable<bool>(released.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CatchesCompanion(')
          ..write('id: $id, ')
          ..write('sessionId: $sessionId, ')
          ..write('speciesId: $speciesId, ')
          ..write('baitId: $baitId, ')
          ..write('rigId: $rigId, ')
          ..write('lengthCm: $lengthCm, ')
          ..write('weightKg: $weightKg, ')
          ..write('caughtAt: $caughtAt, ')
          ..write('released: $released, ')
          ..write('notes: $notes, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CatchPhotosTable extends CatchPhotos
    with TableInfo<$CatchPhotosTable, CatchPhoto> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CatchPhotosTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _catchIdMeta = const VerificationMeta(
    'catchId',
  );
  @override
  late final GeneratedColumn<String> catchId = GeneratedColumn<String>(
    'catch_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES catches (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _filePathMeta = const VerificationMeta(
    'filePath',
  );
  @override
  late final GeneratedColumn<String> filePath = GeneratedColumn<String>(
    'file_path',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, catchId, filePath, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'catch_photos';
  @override
  VerificationContext validateIntegrity(
    Insertable<CatchPhoto> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('catch_id')) {
      context.handle(
        _catchIdMeta,
        catchId.isAcceptableOrUnknown(data['catch_id']!, _catchIdMeta),
      );
    } else if (isInserting) {
      context.missing(_catchIdMeta);
    }
    if (data.containsKey('file_path')) {
      context.handle(
        _filePathMeta,
        filePath.isAcceptableOrUnknown(data['file_path']!, _filePathMeta),
      );
    } else if (isInserting) {
      context.missing(_filePathMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CatchPhoto map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CatchPhoto(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      catchId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}catch_id'],
      )!,
      filePath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}file_path'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $CatchPhotosTable createAlias(String alias) {
    return $CatchPhotosTable(attachedDatabase, alias);
  }
}

class CatchPhoto extends DataClass implements Insertable<CatchPhoto> {
  final String id;
  final String catchId;

  /// Relatif ke direktori dokumen aplikasi.
  final String filePath;
  final DateTime createdAt;
  const CatchPhoto({
    required this.id,
    required this.catchId,
    required this.filePath,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['catch_id'] = Variable<String>(catchId);
    map['file_path'] = Variable<String>(filePath);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  CatchPhotosCompanion toCompanion(bool nullToAbsent) {
    return CatchPhotosCompanion(
      id: Value(id),
      catchId: Value(catchId),
      filePath: Value(filePath),
      createdAt: Value(createdAt),
    );
  }

  factory CatchPhoto.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CatchPhoto(
      id: serializer.fromJson<String>(json['id']),
      catchId: serializer.fromJson<String>(json['catchId']),
      filePath: serializer.fromJson<String>(json['filePath']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'catchId': serializer.toJson<String>(catchId),
      'filePath': serializer.toJson<String>(filePath),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  CatchPhoto copyWith({
    String? id,
    String? catchId,
    String? filePath,
    DateTime? createdAt,
  }) => CatchPhoto(
    id: id ?? this.id,
    catchId: catchId ?? this.catchId,
    filePath: filePath ?? this.filePath,
    createdAt: createdAt ?? this.createdAt,
  );
  CatchPhoto copyWithCompanion(CatchPhotosCompanion data) {
    return CatchPhoto(
      id: data.id.present ? data.id.value : this.id,
      catchId: data.catchId.present ? data.catchId.value : this.catchId,
      filePath: data.filePath.present ? data.filePath.value : this.filePath,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CatchPhoto(')
          ..write('id: $id, ')
          ..write('catchId: $catchId, ')
          ..write('filePath: $filePath, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, catchId, filePath, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CatchPhoto &&
          other.id == this.id &&
          other.catchId == this.catchId &&
          other.filePath == this.filePath &&
          other.createdAt == this.createdAt);
}

class CatchPhotosCompanion extends UpdateCompanion<CatchPhoto> {
  final Value<String> id;
  final Value<String> catchId;
  final Value<String> filePath;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const CatchPhotosCompanion({
    this.id = const Value.absent(),
    this.catchId = const Value.absent(),
    this.filePath = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CatchPhotosCompanion.insert({
    required String id,
    required String catchId,
    required String filePath,
    required DateTime createdAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       catchId = Value(catchId),
       filePath = Value(filePath),
       createdAt = Value(createdAt);
  static Insertable<CatchPhoto> custom({
    Expression<String>? id,
    Expression<String>? catchId,
    Expression<String>? filePath,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (catchId != null) 'catch_id': catchId,
      if (filePath != null) 'file_path': filePath,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CatchPhotosCompanion copyWith({
    Value<String>? id,
    Value<String>? catchId,
    Value<String>? filePath,
    Value<DateTime>? createdAt,
    Value<int>? rowid,
  }) {
    return CatchPhotosCompanion(
      id: id ?? this.id,
      catchId: catchId ?? this.catchId,
      filePath: filePath ?? this.filePath,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (catchId.present) {
      map['catch_id'] = Variable<String>(catchId.value);
    }
    if (filePath.present) {
      map['file_path'] = Variable<String>(filePath.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CatchPhotosCompanion(')
          ..write('id: $id, ')
          ..write('catchId: $catchId, ')
          ..write('filePath: $filePath, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $WeatherSnapshotsTable extends WeatherSnapshots
    with TableInfo<$WeatherSnapshotsTable, WeatherSnapshot> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WeatherSnapshotsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _sessionIdMeta = const VerificationMeta(
    'sessionId',
  );
  @override
  late final GeneratedColumn<String> sessionId = GeneratedColumn<String>(
    'session_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES sessions (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _fetchedAtMeta = const VerificationMeta(
    'fetchedAt',
  );
  @override
  late final GeneratedColumn<DateTime> fetchedAt = GeneratedColumn<DateTime>(
    'fetched_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _temperatureCMeta = const VerificationMeta(
    'temperatureC',
  );
  @override
  late final GeneratedColumn<double> temperatureC = GeneratedColumn<double>(
    'temperature_c',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _apparentTempCMeta = const VerificationMeta(
    'apparentTempC',
  );
  @override
  late final GeneratedColumn<double> apparentTempC = GeneratedColumn<double>(
    'apparent_temp_c',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _humidityMeta = const VerificationMeta(
    'humidity',
  );
  @override
  late final GeneratedColumn<double> humidity = GeneratedColumn<double>(
    'humidity',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _pressureHpaMeta = const VerificationMeta(
    'pressureHpa',
  );
  @override
  late final GeneratedColumn<double> pressureHpa = GeneratedColumn<double>(
    'pressure_hpa',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _windSpeedKmhMeta = const VerificationMeta(
    'windSpeedKmh',
  );
  @override
  late final GeneratedColumn<double> windSpeedKmh = GeneratedColumn<double>(
    'wind_speed_kmh',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _windDirectionDegMeta = const VerificationMeta(
    'windDirectionDeg',
  );
  @override
  late final GeneratedColumn<double> windDirectionDeg = GeneratedColumn<double>(
    'wind_direction_deg',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _cloudCoverMeta = const VerificationMeta(
    'cloudCover',
  );
  @override
  late final GeneratedColumn<double> cloudCover = GeneratedColumn<double>(
    'cloud_cover',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _precipitationMmMeta = const VerificationMeta(
    'precipitationMm',
  );
  @override
  late final GeneratedColumn<double> precipitationMm = GeneratedColumn<double>(
    'precipitation_mm',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _weatherCodeMeta = const VerificationMeta(
    'weatherCode',
  );
  @override
  late final GeneratedColumn<int> weatherCode = GeneratedColumn<int>(
    'weather_code',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _rawJsonMeta = const VerificationMeta(
    'rawJson',
  );
  @override
  late final GeneratedColumn<String> rawJson = GeneratedColumn<String>(
    'raw_json',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    sessionId,
    fetchedAt,
    temperatureC,
    apparentTempC,
    humidity,
    pressureHpa,
    windSpeedKmh,
    windDirectionDeg,
    cloudCover,
    precipitationMm,
    weatherCode,
    rawJson,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'weather_snapshots';
  @override
  VerificationContext validateIntegrity(
    Insertable<WeatherSnapshot> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('session_id')) {
      context.handle(
        _sessionIdMeta,
        sessionId.isAcceptableOrUnknown(data['session_id']!, _sessionIdMeta),
      );
    } else if (isInserting) {
      context.missing(_sessionIdMeta);
    }
    if (data.containsKey('fetched_at')) {
      context.handle(
        _fetchedAtMeta,
        fetchedAt.isAcceptableOrUnknown(data['fetched_at']!, _fetchedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_fetchedAtMeta);
    }
    if (data.containsKey('temperature_c')) {
      context.handle(
        _temperatureCMeta,
        temperatureC.isAcceptableOrUnknown(
          data['temperature_c']!,
          _temperatureCMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_temperatureCMeta);
    }
    if (data.containsKey('apparent_temp_c')) {
      context.handle(
        _apparentTempCMeta,
        apparentTempC.isAcceptableOrUnknown(
          data['apparent_temp_c']!,
          _apparentTempCMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_apparentTempCMeta);
    }
    if (data.containsKey('humidity')) {
      context.handle(
        _humidityMeta,
        humidity.isAcceptableOrUnknown(data['humidity']!, _humidityMeta),
      );
    } else if (isInserting) {
      context.missing(_humidityMeta);
    }
    if (data.containsKey('pressure_hpa')) {
      context.handle(
        _pressureHpaMeta,
        pressureHpa.isAcceptableOrUnknown(
          data['pressure_hpa']!,
          _pressureHpaMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_pressureHpaMeta);
    }
    if (data.containsKey('wind_speed_kmh')) {
      context.handle(
        _windSpeedKmhMeta,
        windSpeedKmh.isAcceptableOrUnknown(
          data['wind_speed_kmh']!,
          _windSpeedKmhMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_windSpeedKmhMeta);
    }
    if (data.containsKey('wind_direction_deg')) {
      context.handle(
        _windDirectionDegMeta,
        windDirectionDeg.isAcceptableOrUnknown(
          data['wind_direction_deg']!,
          _windDirectionDegMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_windDirectionDegMeta);
    }
    if (data.containsKey('cloud_cover')) {
      context.handle(
        _cloudCoverMeta,
        cloudCover.isAcceptableOrUnknown(data['cloud_cover']!, _cloudCoverMeta),
      );
    } else if (isInserting) {
      context.missing(_cloudCoverMeta);
    }
    if (data.containsKey('precipitation_mm')) {
      context.handle(
        _precipitationMmMeta,
        precipitationMm.isAcceptableOrUnknown(
          data['precipitation_mm']!,
          _precipitationMmMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_precipitationMmMeta);
    }
    if (data.containsKey('weather_code')) {
      context.handle(
        _weatherCodeMeta,
        weatherCode.isAcceptableOrUnknown(
          data['weather_code']!,
          _weatherCodeMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_weatherCodeMeta);
    }
    if (data.containsKey('raw_json')) {
      context.handle(
        _rawJsonMeta,
        rawJson.isAcceptableOrUnknown(data['raw_json']!, _rawJsonMeta),
      );
    } else if (isInserting) {
      context.missing(_rawJsonMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {sessionId};
  @override
  WeatherSnapshot map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return WeatherSnapshot(
      sessionId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}session_id'],
      )!,
      fetchedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}fetched_at'],
      )!,
      temperatureC: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}temperature_c'],
      )!,
      apparentTempC: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}apparent_temp_c'],
      )!,
      humidity: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}humidity'],
      )!,
      pressureHpa: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}pressure_hpa'],
      )!,
      windSpeedKmh: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}wind_speed_kmh'],
      )!,
      windDirectionDeg: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}wind_direction_deg'],
      )!,
      cloudCover: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}cloud_cover'],
      )!,
      precipitationMm: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}precipitation_mm'],
      )!,
      weatherCode: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}weather_code'],
      )!,
      rawJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}raw_json'],
      )!,
    );
  }

  @override
  $WeatherSnapshotsTable createAlias(String alias) {
    return $WeatherSnapshotsTable(attachedDatabase, alias);
  }
}

class WeatherSnapshot extends DataClass implements Insertable<WeatherSnapshot> {
  final String sessionId;
  final DateTime fetchedAt;
  final double temperatureC;
  final double apparentTempC;
  final double humidity;
  final double pressureHpa;
  final double windSpeedKmh;
  final double windDirectionDeg;
  final double cloudCover;
  final double precipitationMm;
  final int weatherCode;
  final String rawJson;
  const WeatherSnapshot({
    required this.sessionId,
    required this.fetchedAt,
    required this.temperatureC,
    required this.apparentTempC,
    required this.humidity,
    required this.pressureHpa,
    required this.windSpeedKmh,
    required this.windDirectionDeg,
    required this.cloudCover,
    required this.precipitationMm,
    required this.weatherCode,
    required this.rawJson,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['session_id'] = Variable<String>(sessionId);
    map['fetched_at'] = Variable<DateTime>(fetchedAt);
    map['temperature_c'] = Variable<double>(temperatureC);
    map['apparent_temp_c'] = Variable<double>(apparentTempC);
    map['humidity'] = Variable<double>(humidity);
    map['pressure_hpa'] = Variable<double>(pressureHpa);
    map['wind_speed_kmh'] = Variable<double>(windSpeedKmh);
    map['wind_direction_deg'] = Variable<double>(windDirectionDeg);
    map['cloud_cover'] = Variable<double>(cloudCover);
    map['precipitation_mm'] = Variable<double>(precipitationMm);
    map['weather_code'] = Variable<int>(weatherCode);
    map['raw_json'] = Variable<String>(rawJson);
    return map;
  }

  WeatherSnapshotsCompanion toCompanion(bool nullToAbsent) {
    return WeatherSnapshotsCompanion(
      sessionId: Value(sessionId),
      fetchedAt: Value(fetchedAt),
      temperatureC: Value(temperatureC),
      apparentTempC: Value(apparentTempC),
      humidity: Value(humidity),
      pressureHpa: Value(pressureHpa),
      windSpeedKmh: Value(windSpeedKmh),
      windDirectionDeg: Value(windDirectionDeg),
      cloudCover: Value(cloudCover),
      precipitationMm: Value(precipitationMm),
      weatherCode: Value(weatherCode),
      rawJson: Value(rawJson),
    );
  }

  factory WeatherSnapshot.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return WeatherSnapshot(
      sessionId: serializer.fromJson<String>(json['sessionId']),
      fetchedAt: serializer.fromJson<DateTime>(json['fetchedAt']),
      temperatureC: serializer.fromJson<double>(json['temperatureC']),
      apparentTempC: serializer.fromJson<double>(json['apparentTempC']),
      humidity: serializer.fromJson<double>(json['humidity']),
      pressureHpa: serializer.fromJson<double>(json['pressureHpa']),
      windSpeedKmh: serializer.fromJson<double>(json['windSpeedKmh']),
      windDirectionDeg: serializer.fromJson<double>(json['windDirectionDeg']),
      cloudCover: serializer.fromJson<double>(json['cloudCover']),
      precipitationMm: serializer.fromJson<double>(json['precipitationMm']),
      weatherCode: serializer.fromJson<int>(json['weatherCode']),
      rawJson: serializer.fromJson<String>(json['rawJson']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'sessionId': serializer.toJson<String>(sessionId),
      'fetchedAt': serializer.toJson<DateTime>(fetchedAt),
      'temperatureC': serializer.toJson<double>(temperatureC),
      'apparentTempC': serializer.toJson<double>(apparentTempC),
      'humidity': serializer.toJson<double>(humidity),
      'pressureHpa': serializer.toJson<double>(pressureHpa),
      'windSpeedKmh': serializer.toJson<double>(windSpeedKmh),
      'windDirectionDeg': serializer.toJson<double>(windDirectionDeg),
      'cloudCover': serializer.toJson<double>(cloudCover),
      'precipitationMm': serializer.toJson<double>(precipitationMm),
      'weatherCode': serializer.toJson<int>(weatherCode),
      'rawJson': serializer.toJson<String>(rawJson),
    };
  }

  WeatherSnapshot copyWith({
    String? sessionId,
    DateTime? fetchedAt,
    double? temperatureC,
    double? apparentTempC,
    double? humidity,
    double? pressureHpa,
    double? windSpeedKmh,
    double? windDirectionDeg,
    double? cloudCover,
    double? precipitationMm,
    int? weatherCode,
    String? rawJson,
  }) => WeatherSnapshot(
    sessionId: sessionId ?? this.sessionId,
    fetchedAt: fetchedAt ?? this.fetchedAt,
    temperatureC: temperatureC ?? this.temperatureC,
    apparentTempC: apparentTempC ?? this.apparentTempC,
    humidity: humidity ?? this.humidity,
    pressureHpa: pressureHpa ?? this.pressureHpa,
    windSpeedKmh: windSpeedKmh ?? this.windSpeedKmh,
    windDirectionDeg: windDirectionDeg ?? this.windDirectionDeg,
    cloudCover: cloudCover ?? this.cloudCover,
    precipitationMm: precipitationMm ?? this.precipitationMm,
    weatherCode: weatherCode ?? this.weatherCode,
    rawJson: rawJson ?? this.rawJson,
  );
  WeatherSnapshot copyWithCompanion(WeatherSnapshotsCompanion data) {
    return WeatherSnapshot(
      sessionId: data.sessionId.present ? data.sessionId.value : this.sessionId,
      fetchedAt: data.fetchedAt.present ? data.fetchedAt.value : this.fetchedAt,
      temperatureC: data.temperatureC.present
          ? data.temperatureC.value
          : this.temperatureC,
      apparentTempC: data.apparentTempC.present
          ? data.apparentTempC.value
          : this.apparentTempC,
      humidity: data.humidity.present ? data.humidity.value : this.humidity,
      pressureHpa: data.pressureHpa.present
          ? data.pressureHpa.value
          : this.pressureHpa,
      windSpeedKmh: data.windSpeedKmh.present
          ? data.windSpeedKmh.value
          : this.windSpeedKmh,
      windDirectionDeg: data.windDirectionDeg.present
          ? data.windDirectionDeg.value
          : this.windDirectionDeg,
      cloudCover: data.cloudCover.present
          ? data.cloudCover.value
          : this.cloudCover,
      precipitationMm: data.precipitationMm.present
          ? data.precipitationMm.value
          : this.precipitationMm,
      weatherCode: data.weatherCode.present
          ? data.weatherCode.value
          : this.weatherCode,
      rawJson: data.rawJson.present ? data.rawJson.value : this.rawJson,
    );
  }

  @override
  String toString() {
    return (StringBuffer('WeatherSnapshot(')
          ..write('sessionId: $sessionId, ')
          ..write('fetchedAt: $fetchedAt, ')
          ..write('temperatureC: $temperatureC, ')
          ..write('apparentTempC: $apparentTempC, ')
          ..write('humidity: $humidity, ')
          ..write('pressureHpa: $pressureHpa, ')
          ..write('windSpeedKmh: $windSpeedKmh, ')
          ..write('windDirectionDeg: $windDirectionDeg, ')
          ..write('cloudCover: $cloudCover, ')
          ..write('precipitationMm: $precipitationMm, ')
          ..write('weatherCode: $weatherCode, ')
          ..write('rawJson: $rawJson')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    sessionId,
    fetchedAt,
    temperatureC,
    apparentTempC,
    humidity,
    pressureHpa,
    windSpeedKmh,
    windDirectionDeg,
    cloudCover,
    precipitationMm,
    weatherCode,
    rawJson,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WeatherSnapshot &&
          other.sessionId == this.sessionId &&
          other.fetchedAt == this.fetchedAt &&
          other.temperatureC == this.temperatureC &&
          other.apparentTempC == this.apparentTempC &&
          other.humidity == this.humidity &&
          other.pressureHpa == this.pressureHpa &&
          other.windSpeedKmh == this.windSpeedKmh &&
          other.windDirectionDeg == this.windDirectionDeg &&
          other.cloudCover == this.cloudCover &&
          other.precipitationMm == this.precipitationMm &&
          other.weatherCode == this.weatherCode &&
          other.rawJson == this.rawJson);
}

class WeatherSnapshotsCompanion extends UpdateCompanion<WeatherSnapshot> {
  final Value<String> sessionId;
  final Value<DateTime> fetchedAt;
  final Value<double> temperatureC;
  final Value<double> apparentTempC;
  final Value<double> humidity;
  final Value<double> pressureHpa;
  final Value<double> windSpeedKmh;
  final Value<double> windDirectionDeg;
  final Value<double> cloudCover;
  final Value<double> precipitationMm;
  final Value<int> weatherCode;
  final Value<String> rawJson;
  final Value<int> rowid;
  const WeatherSnapshotsCompanion({
    this.sessionId = const Value.absent(),
    this.fetchedAt = const Value.absent(),
    this.temperatureC = const Value.absent(),
    this.apparentTempC = const Value.absent(),
    this.humidity = const Value.absent(),
    this.pressureHpa = const Value.absent(),
    this.windSpeedKmh = const Value.absent(),
    this.windDirectionDeg = const Value.absent(),
    this.cloudCover = const Value.absent(),
    this.precipitationMm = const Value.absent(),
    this.weatherCode = const Value.absent(),
    this.rawJson = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  WeatherSnapshotsCompanion.insert({
    required String sessionId,
    required DateTime fetchedAt,
    required double temperatureC,
    required double apparentTempC,
    required double humidity,
    required double pressureHpa,
    required double windSpeedKmh,
    required double windDirectionDeg,
    required double cloudCover,
    required double precipitationMm,
    required int weatherCode,
    required String rawJson,
    this.rowid = const Value.absent(),
  }) : sessionId = Value(sessionId),
       fetchedAt = Value(fetchedAt),
       temperatureC = Value(temperatureC),
       apparentTempC = Value(apparentTempC),
       humidity = Value(humidity),
       pressureHpa = Value(pressureHpa),
       windSpeedKmh = Value(windSpeedKmh),
       windDirectionDeg = Value(windDirectionDeg),
       cloudCover = Value(cloudCover),
       precipitationMm = Value(precipitationMm),
       weatherCode = Value(weatherCode),
       rawJson = Value(rawJson);
  static Insertable<WeatherSnapshot> custom({
    Expression<String>? sessionId,
    Expression<DateTime>? fetchedAt,
    Expression<double>? temperatureC,
    Expression<double>? apparentTempC,
    Expression<double>? humidity,
    Expression<double>? pressureHpa,
    Expression<double>? windSpeedKmh,
    Expression<double>? windDirectionDeg,
    Expression<double>? cloudCover,
    Expression<double>? precipitationMm,
    Expression<int>? weatherCode,
    Expression<String>? rawJson,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (sessionId != null) 'session_id': sessionId,
      if (fetchedAt != null) 'fetched_at': fetchedAt,
      if (temperatureC != null) 'temperature_c': temperatureC,
      if (apparentTempC != null) 'apparent_temp_c': apparentTempC,
      if (humidity != null) 'humidity': humidity,
      if (pressureHpa != null) 'pressure_hpa': pressureHpa,
      if (windSpeedKmh != null) 'wind_speed_kmh': windSpeedKmh,
      if (windDirectionDeg != null) 'wind_direction_deg': windDirectionDeg,
      if (cloudCover != null) 'cloud_cover': cloudCover,
      if (precipitationMm != null) 'precipitation_mm': precipitationMm,
      if (weatherCode != null) 'weather_code': weatherCode,
      if (rawJson != null) 'raw_json': rawJson,
      if (rowid != null) 'rowid': rowid,
    });
  }

  WeatherSnapshotsCompanion copyWith({
    Value<String>? sessionId,
    Value<DateTime>? fetchedAt,
    Value<double>? temperatureC,
    Value<double>? apparentTempC,
    Value<double>? humidity,
    Value<double>? pressureHpa,
    Value<double>? windSpeedKmh,
    Value<double>? windDirectionDeg,
    Value<double>? cloudCover,
    Value<double>? precipitationMm,
    Value<int>? weatherCode,
    Value<String>? rawJson,
    Value<int>? rowid,
  }) {
    return WeatherSnapshotsCompanion(
      sessionId: sessionId ?? this.sessionId,
      fetchedAt: fetchedAt ?? this.fetchedAt,
      temperatureC: temperatureC ?? this.temperatureC,
      apparentTempC: apparentTempC ?? this.apparentTempC,
      humidity: humidity ?? this.humidity,
      pressureHpa: pressureHpa ?? this.pressureHpa,
      windSpeedKmh: windSpeedKmh ?? this.windSpeedKmh,
      windDirectionDeg: windDirectionDeg ?? this.windDirectionDeg,
      cloudCover: cloudCover ?? this.cloudCover,
      precipitationMm: precipitationMm ?? this.precipitationMm,
      weatherCode: weatherCode ?? this.weatherCode,
      rawJson: rawJson ?? this.rawJson,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (sessionId.present) {
      map['session_id'] = Variable<String>(sessionId.value);
    }
    if (fetchedAt.present) {
      map['fetched_at'] = Variable<DateTime>(fetchedAt.value);
    }
    if (temperatureC.present) {
      map['temperature_c'] = Variable<double>(temperatureC.value);
    }
    if (apparentTempC.present) {
      map['apparent_temp_c'] = Variable<double>(apparentTempC.value);
    }
    if (humidity.present) {
      map['humidity'] = Variable<double>(humidity.value);
    }
    if (pressureHpa.present) {
      map['pressure_hpa'] = Variable<double>(pressureHpa.value);
    }
    if (windSpeedKmh.present) {
      map['wind_speed_kmh'] = Variable<double>(windSpeedKmh.value);
    }
    if (windDirectionDeg.present) {
      map['wind_direction_deg'] = Variable<double>(windDirectionDeg.value);
    }
    if (cloudCover.present) {
      map['cloud_cover'] = Variable<double>(cloudCover.value);
    }
    if (precipitationMm.present) {
      map['precipitation_mm'] = Variable<double>(precipitationMm.value);
    }
    if (weatherCode.present) {
      map['weather_code'] = Variable<int>(weatherCode.value);
    }
    if (rawJson.present) {
      map['raw_json'] = Variable<String>(rawJson.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WeatherSnapshotsCompanion(')
          ..write('sessionId: $sessionId, ')
          ..write('fetchedAt: $fetchedAt, ')
          ..write('temperatureC: $temperatureC, ')
          ..write('apparentTempC: $apparentTempC, ')
          ..write('humidity: $humidity, ')
          ..write('pressureHpa: $pressureHpa, ')
          ..write('windSpeedKmh: $windSpeedKmh, ')
          ..write('windDirectionDeg: $windDirectionDeg, ')
          ..write('cloudCover: $cloudCover, ')
          ..write('precipitationMm: $precipitationMm, ')
          ..write('weatherCode: $weatherCode, ')
          ..write('rawJson: $rawJson, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $SessionsTable sessions = $SessionsTable(this);
  late final $SpeciesTable species = $SpeciesTable(this);
  late final $BaitsTable baits = $BaitsTable(this);
  late final $RigsTable rigs = $RigsTable(this);
  late final $CatchesTable catches = $CatchesTable(this);
  late final $CatchPhotosTable catchPhotos = $CatchPhotosTable(this);
  late final $WeatherSnapshotsTable weatherSnapshots = $WeatherSnapshotsTable(
    this,
  );
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    sessions,
    species,
    baits,
    rigs,
    catches,
    catchPhotos,
    weatherSnapshots,
  ];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules([
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'sessions',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('catches', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'catches',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('catch_photos', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'sessions',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('weather_snapshots', kind: UpdateKind.delete)],
    ),
  ]);
}

typedef $$SessionsTableCreateCompanionBuilder = SessionsCompanion Function({
  required String id,
  required DateTime startedAt,
  Value<DateTime?> endedAt,
  required double latitude,
  required double longitude,
  Value<String?> locationName,
  Value<String?> notes,
  Value<int?> rating,
  required DateTime createdAt,
  required DateTime updatedAt,
  Value<int> rowid,
});
typedef $$SessionsTableUpdateCompanionBuilder = SessionsCompanion Function({
  Value<String> id,
  Value<DateTime> startedAt,
  Value<DateTime?> endedAt,
  Value<double> latitude,
  Value<double> longitude,
  Value<String?> locationName,
  Value<String?> notes,
  Value<int?> rating,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<int> rowid,
});

final class $$SessionsTableReferences
    extends BaseReferences<_$AppDatabase, $SessionsTable, Session> {
  $$SessionsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$CatchesTable, List<Catche>> _catchesRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.catches,
    aliasName: 'sessions__id__catches__session_id',
  );

  $$CatchesTableProcessedTableManager get catchesRefs {
    final manager = $$CatchesTableTableManager(
      $_db,
      $_db.catches,
    ).filter((f) => f.sessionId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_catchesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$WeatherSnapshotsTable, List<WeatherSnapshot>>
  _weatherSnapshotsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.weatherSnapshots,
    aliasName: 'sessions__id__weather_snapshots__session_id',
  );

  $$WeatherSnapshotsTableProcessedTableManager get weatherSnapshotsRefs {
    final manager = $$WeatherSnapshotsTableTableManager(
      $_db,
      $_db.weatherSnapshots,
    ).filter((f) => f.sessionId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _weatherSnapshotsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$SessionsTableFilterComposer
    extends Composer<_$AppDatabase, $SessionsTable> {
  $$SessionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get startedAt => $composableBuilder(
    column: $table.startedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get endedAt => $composableBuilder(
    column: $table.endedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get latitude => $composableBuilder(
    column: $table.latitude,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get longitude => $composableBuilder(
    column: $table.longitude,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get locationName => $composableBuilder(
    column: $table.locationName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get rating => $composableBuilder(
    column: $table.rating,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> catchesRefs(
    Expression<bool> Function($$CatchesTableFilterComposer f) f,
  ) {
    final $$CatchesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.catches,
      getReferencedColumn: (t) => t.sessionId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CatchesTableFilterComposer(
            $db: $db,
            $table: $db.catches,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> weatherSnapshotsRefs(
    Expression<bool> Function($$WeatherSnapshotsTableFilterComposer f) f,
  ) {
    final $$WeatherSnapshotsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.weatherSnapshots,
      getReferencedColumn: (t) => t.sessionId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WeatherSnapshotsTableFilterComposer(
            $db: $db,
            $table: $db.weatherSnapshots,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$SessionsTableOrderingComposer
    extends Composer<_$AppDatabase, $SessionsTable> {
  $$SessionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get startedAt => $composableBuilder(
    column: $table.startedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get endedAt => $composableBuilder(
    column: $table.endedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get latitude => $composableBuilder(
    column: $table.latitude,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get longitude => $composableBuilder(
    column: $table.longitude,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get locationName => $composableBuilder(
    column: $table.locationName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get rating => $composableBuilder(
    column: $table.rating,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SessionsTableAnnotationComposer
    extends Composer<_$AppDatabase, $SessionsTable> {
  $$SessionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get startedAt =>
      $composableBuilder(column: $table.startedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get endedAt =>
      $composableBuilder(column: $table.endedAt, builder: (column) => column);

  GeneratedColumn<double> get latitude =>
      $composableBuilder(column: $table.latitude, builder: (column) => column);

  GeneratedColumn<double> get longitude =>
      $composableBuilder(column: $table.longitude, builder: (column) => column);

  GeneratedColumn<String> get locationName => $composableBuilder(
    column: $table.locationName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<int> get rating =>
      $composableBuilder(column: $table.rating, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  Expression<T> catchesRefs<T extends Object>(
    Expression<T> Function($$CatchesTableAnnotationComposer a) f,
  ) {
    final $$CatchesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.catches,
      getReferencedColumn: (t) => t.sessionId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CatchesTableAnnotationComposer(
            $db: $db,
            $table: $db.catches,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> weatherSnapshotsRefs<T extends Object>(
    Expression<T> Function($$WeatherSnapshotsTableAnnotationComposer a) f,
  ) {
    final $$WeatherSnapshotsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.weatherSnapshots,
      getReferencedColumn: (t) => t.sessionId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WeatherSnapshotsTableAnnotationComposer(
            $db: $db,
            $table: $db.weatherSnapshots,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$SessionsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SessionsTable,
          Session,
          $$SessionsTableFilterComposer,
          $$SessionsTableOrderingComposer,
          $$SessionsTableAnnotationComposer,
          $$SessionsTableCreateCompanionBuilder,
          $$SessionsTableUpdateCompanionBuilder,
          (Session, $$SessionsTableReferences),
          Session,
          PrefetchHooks Function({bool catchesRefs, bool weatherSnapshotsRefs})
        > {
  $$SessionsTableTableManager(_$AppDatabase db, $SessionsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SessionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SessionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SessionsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<DateTime> startedAt = const Value.absent(),
                Value<DateTime?> endedAt = const Value.absent(),
                Value<double> latitude = const Value.absent(),
                Value<double> longitude = const Value.absent(),
                Value<String?> locationName = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<int?> rating = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SessionsCompanion(
                id: id,
                startedAt: startedAt,
                endedAt: endedAt,
                latitude: latitude,
                longitude: longitude,
                locationName: locationName,
                notes: notes,
                rating: rating,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required DateTime startedAt,
                Value<DateTime?> endedAt = const Value.absent(),
                required double latitude,
                required double longitude,
                Value<String?> locationName = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<int?> rating = const Value.absent(),
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => SessionsCompanion.insert(
                id: id,
                startedAt: startedAt,
                endedAt: endedAt,
                latitude: latitude,
                longitude: longitude,
                locationName: locationName,
                notes: notes,
                rating: rating,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$SessionsTable, Session>(table),
                  $$SessionsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({catchesRefs = false, weatherSnapshotsRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (catchesRefs) db.catches,
                    if (weatherSnapshotsRefs) db.weatherSnapshots,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (catchesRefs)
                        await $_getPrefetchedDataByColumns<
                          Session,
                          $SessionsTable,
                          Catche,
                          $CatchesTable
                        >(
                          currentTable: table,
                          referencedTable: $$SessionsTableReferences
                              ._catchesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$SessionsTableReferences(
                                db,
                                table,
                                p0,
                              ).catchesRefs,
                          currentColumn: 'id',
                          referencedColumn: 'session_id',
                          typedResults: items,
                        ),
                      if (weatherSnapshotsRefs)
                        await $_getPrefetchedDataByColumns<
                          Session,
                          $SessionsTable,
                          WeatherSnapshot,
                          $WeatherSnapshotsTable
                        >(
                          currentTable: table,
                          referencedTable: $$SessionsTableReferences
                              ._weatherSnapshotsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$SessionsTableReferences(
                                db,
                                table,
                                p0,
                              ).weatherSnapshotsRefs,
                          currentColumn: 'id',
                          referencedColumn: 'session_id',
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$SessionsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SessionsTable,
      Session,
      $$SessionsTableFilterComposer,
      $$SessionsTableOrderingComposer,
      $$SessionsTableAnnotationComposer,
      $$SessionsTableCreateCompanionBuilder,
      $$SessionsTableUpdateCompanionBuilder,
      (Session, $$SessionsTableReferences),
      Session,
      PrefetchHooks Function({bool catchesRefs, bool weatherSnapshotsRefs})
    >;
typedef $$SpeciesTableCreateCompanionBuilder = SpeciesCompanion Function({
  Value<int> id,
  required String name,
  Value<bool> isCustom,
});
typedef $$SpeciesTableUpdateCompanionBuilder = SpeciesCompanion Function({
  Value<int> id,
  Value<String> name,
  Value<bool> isCustom,
});

final class $$SpeciesTableReferences
    extends BaseReferences<_$AppDatabase, $SpeciesTable, Specy> {
  $$SpeciesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$CatchesTable, List<Catche>> _catchesRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.catches,
    aliasName: 'species__id__catches__species_id',
  );

  $$CatchesTableProcessedTableManager get catchesRefs {
    final manager = $$CatchesTableTableManager(
      $_db,
      $_db.catches,
    ).filter((f) => f.speciesId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_catchesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$SpeciesTableFilterComposer
    extends Composer<_$AppDatabase, $SpeciesTable> {
  $$SpeciesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isCustom => $composableBuilder(
    column: $table.isCustom,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> catchesRefs(
    Expression<bool> Function($$CatchesTableFilterComposer f) f,
  ) {
    final $$CatchesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.catches,
      getReferencedColumn: (t) => t.speciesId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CatchesTableFilterComposer(
            $db: $db,
            $table: $db.catches,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$SpeciesTableOrderingComposer
    extends Composer<_$AppDatabase, $SpeciesTable> {
  $$SpeciesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isCustom => $composableBuilder(
    column: $table.isCustom,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SpeciesTableAnnotationComposer
    extends Composer<_$AppDatabase, $SpeciesTable> {
  $$SpeciesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<bool> get isCustom =>
      $composableBuilder(column: $table.isCustom, builder: (column) => column);

  Expression<T> catchesRefs<T extends Object>(
    Expression<T> Function($$CatchesTableAnnotationComposer a) f,
  ) {
    final $$CatchesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.catches,
      getReferencedColumn: (t) => t.speciesId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CatchesTableAnnotationComposer(
            $db: $db,
            $table: $db.catches,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$SpeciesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SpeciesTable,
          Specy,
          $$SpeciesTableFilterComposer,
          $$SpeciesTableOrderingComposer,
          $$SpeciesTableAnnotationComposer,
          $$SpeciesTableCreateCompanionBuilder,
          $$SpeciesTableUpdateCompanionBuilder,
          (Specy, $$SpeciesTableReferences),
          Specy,
          PrefetchHooks Function({bool catchesRefs})
        > {
  $$SpeciesTableTableManager(_$AppDatabase db, $SpeciesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SpeciesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SpeciesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SpeciesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<bool> isCustom = const Value.absent(),
          }) => SpeciesCompanion(id: id, name: name, isCustom: isCustom),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            Value<bool> isCustom = const Value.absent(),
          }) => SpeciesCompanion.insert(id: id, name: name, isCustom: isCustom),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$SpeciesTable, Specy>(table),
                  $$SpeciesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({catchesRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (catchesRefs) db.catches],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (catchesRefs)
                    await $_getPrefetchedDataByColumns<
                      Specy,
                      $SpeciesTable,
                      Catche,
                      $CatchesTable
                    >(
                      currentTable: table,
                      referencedTable: $$SpeciesTableReferences
                          ._catchesRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$SpeciesTableReferences(db, table, p0).catchesRefs,
                      currentColumn: 'id',
                      referencedColumn: 'species_id',
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$SpeciesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SpeciesTable,
      Specy,
      $$SpeciesTableFilterComposer,
      $$SpeciesTableOrderingComposer,
      $$SpeciesTableAnnotationComposer,
      $$SpeciesTableCreateCompanionBuilder,
      $$SpeciesTableUpdateCompanionBuilder,
      (Specy, $$SpeciesTableReferences),
      Specy,
      PrefetchHooks Function({bool catchesRefs})
    >;
typedef $$BaitsTableCreateCompanionBuilder = BaitsCompanion Function({
  Value<int> id,
  required String name,
  Value<bool> isCustom,
});
typedef $$BaitsTableUpdateCompanionBuilder = BaitsCompanion Function({
  Value<int> id,
  Value<String> name,
  Value<bool> isCustom,
});

final class $$BaitsTableReferences
    extends BaseReferences<_$AppDatabase, $BaitsTable, Bait> {
  $$BaitsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$CatchesTable, List<Catche>> _catchesRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.catches,
    aliasName: 'baits__id__catches__bait_id',
  );

  $$CatchesTableProcessedTableManager get catchesRefs {
    final manager = $$CatchesTableTableManager(
      $_db,
      $_db.catches,
    ).filter((f) => f.baitId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_catchesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$BaitsTableFilterComposer extends Composer<_$AppDatabase, $BaitsTable> {
  $$BaitsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isCustom => $composableBuilder(
    column: $table.isCustom,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> catchesRefs(
    Expression<bool> Function($$CatchesTableFilterComposer f) f,
  ) {
    final $$CatchesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.catches,
      getReferencedColumn: (t) => t.baitId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CatchesTableFilterComposer(
            $db: $db,
            $table: $db.catches,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$BaitsTableOrderingComposer
    extends Composer<_$AppDatabase, $BaitsTable> {
  $$BaitsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isCustom => $composableBuilder(
    column: $table.isCustom,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$BaitsTableAnnotationComposer
    extends Composer<_$AppDatabase, $BaitsTable> {
  $$BaitsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<bool> get isCustom =>
      $composableBuilder(column: $table.isCustom, builder: (column) => column);

  Expression<T> catchesRefs<T extends Object>(
    Expression<T> Function($$CatchesTableAnnotationComposer a) f,
  ) {
    final $$CatchesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.catches,
      getReferencedColumn: (t) => t.baitId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CatchesTableAnnotationComposer(
            $db: $db,
            $table: $db.catches,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$BaitsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $BaitsTable,
          Bait,
          $$BaitsTableFilterComposer,
          $$BaitsTableOrderingComposer,
          $$BaitsTableAnnotationComposer,
          $$BaitsTableCreateCompanionBuilder,
          $$BaitsTableUpdateCompanionBuilder,
          (Bait, $$BaitsTableReferences),
          Bait,
          PrefetchHooks Function({bool catchesRefs})
        > {
  $$BaitsTableTableManager(_$AppDatabase db, $BaitsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$BaitsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$BaitsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$BaitsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<bool> isCustom = const Value.absent(),
          }) => BaitsCompanion(id: id, name: name, isCustom: isCustom),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            Value<bool> isCustom = const Value.absent(),
          }) => BaitsCompanion.insert(id: id, name: name, isCustom: isCustom),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$BaitsTable, Bait>(table),
                  $$BaitsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({catchesRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (catchesRefs) db.catches],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (catchesRefs)
                    await $_getPrefetchedDataByColumns<
                      Bait,
                      $BaitsTable,
                      Catche,
                      $CatchesTable
                    >(
                      currentTable: table,
                      referencedTable: $$BaitsTableReferences._catchesRefsTable(
                        db,
                      ),
                      managerFromTypedResult: (p0) =>
                          $$BaitsTableReferences(db, table, p0).catchesRefs,
                      currentColumn: 'id',
                      referencedColumn: 'bait_id',
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$BaitsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $BaitsTable,
      Bait,
      $$BaitsTableFilterComposer,
      $$BaitsTableOrderingComposer,
      $$BaitsTableAnnotationComposer,
      $$BaitsTableCreateCompanionBuilder,
      $$BaitsTableUpdateCompanionBuilder,
      (Bait, $$BaitsTableReferences),
      Bait,
      PrefetchHooks Function({bool catchesRefs})
    >;
typedef $$RigsTableCreateCompanionBuilder = RigsCompanion Function({
  Value<int> id,
  required String name,
  Value<bool> isCustom,
});
typedef $$RigsTableUpdateCompanionBuilder = RigsCompanion Function({
  Value<int> id,
  Value<String> name,
  Value<bool> isCustom,
});

final class $$RigsTableReferences
    extends BaseReferences<_$AppDatabase, $RigsTable, Rig> {
  $$RigsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$CatchesTable, List<Catche>> _catchesRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.catches,
    aliasName: 'rigs__id__catches__rig_id',
  );

  $$CatchesTableProcessedTableManager get catchesRefs {
    final manager = $$CatchesTableTableManager(
      $_db,
      $_db.catches,
    ).filter((f) => f.rigId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_catchesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$RigsTableFilterComposer extends Composer<_$AppDatabase, $RigsTable> {
  $$RigsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isCustom => $composableBuilder(
    column: $table.isCustom,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> catchesRefs(
    Expression<bool> Function($$CatchesTableFilterComposer f) f,
  ) {
    final $$CatchesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.catches,
      getReferencedColumn: (t) => t.rigId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CatchesTableFilterComposer(
            $db: $db,
            $table: $db.catches,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$RigsTableOrderingComposer extends Composer<_$AppDatabase, $RigsTable> {
  $$RigsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isCustom => $composableBuilder(
    column: $table.isCustom,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$RigsTableAnnotationComposer
    extends Composer<_$AppDatabase, $RigsTable> {
  $$RigsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<bool> get isCustom =>
      $composableBuilder(column: $table.isCustom, builder: (column) => column);

  Expression<T> catchesRefs<T extends Object>(
    Expression<T> Function($$CatchesTableAnnotationComposer a) f,
  ) {
    final $$CatchesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.catches,
      getReferencedColumn: (t) => t.rigId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CatchesTableAnnotationComposer(
            $db: $db,
            $table: $db.catches,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$RigsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $RigsTable,
          Rig,
          $$RigsTableFilterComposer,
          $$RigsTableOrderingComposer,
          $$RigsTableAnnotationComposer,
          $$RigsTableCreateCompanionBuilder,
          $$RigsTableUpdateCompanionBuilder,
          (Rig, $$RigsTableReferences),
          Rig,
          PrefetchHooks Function({bool catchesRefs})
        > {
  $$RigsTableTableManager(_$AppDatabase db, $RigsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RigsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RigsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RigsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<bool> isCustom = const Value.absent(),
          }) => RigsCompanion(id: id, name: name, isCustom: isCustom),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            Value<bool> isCustom = const Value.absent(),
          }) => RigsCompanion.insert(id: id, name: name, isCustom: isCustom),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$RigsTable, Rig>(table),
                  $$RigsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({catchesRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (catchesRefs) db.catches],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (catchesRefs)
                    await $_getPrefetchedDataByColumns<
                      Rig,
                      $RigsTable,
                      Catche,
                      $CatchesTable
                    >(
                      currentTable: table,
                      referencedTable: $$RigsTableReferences._catchesRefsTable(
                        db,
                      ),
                      managerFromTypedResult: (p0) =>
                          $$RigsTableReferences(db, table, p0).catchesRefs,
                      currentColumn: 'id',
                      referencedColumn: 'rig_id',
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$RigsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $RigsTable,
      Rig,
      $$RigsTableFilterComposer,
      $$RigsTableOrderingComposer,
      $$RigsTableAnnotationComposer,
      $$RigsTableCreateCompanionBuilder,
      $$RigsTableUpdateCompanionBuilder,
      (Rig, $$RigsTableReferences),
      Rig,
      PrefetchHooks Function({bool catchesRefs})
    >;
typedef $$CatchesTableCreateCompanionBuilder = CatchesCompanion Function({
  required String id,
  required String sessionId,
  required int speciesId,
  Value<int?> baitId,
  Value<int?> rigId,
  Value<double?> lengthCm,
  Value<double?> weightKg,
  required DateTime caughtAt,
  Value<bool> released,
  Value<String?> notes,
  Value<int> rowid,
});
typedef $$CatchesTableUpdateCompanionBuilder = CatchesCompanion Function({
  Value<String> id,
  Value<String> sessionId,
  Value<int> speciesId,
  Value<int?> baitId,
  Value<int?> rigId,
  Value<double?> lengthCm,
  Value<double?> weightKg,
  Value<DateTime> caughtAt,
  Value<bool> released,
  Value<String?> notes,
  Value<int> rowid,
});

final class $$CatchesTableReferences
    extends BaseReferences<_$AppDatabase, $CatchesTable, Catche> {
  $$CatchesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $SessionsTable _sessionIdTable(_$AppDatabase db) =>
      db.sessions.createAlias('catches__session_id__sessions__id');

  $$SessionsTableProcessedTableManager get sessionId {
    final $_column = $_itemColumn<String>('session_id')!;

    final manager = $$SessionsTableTableManager(
      $_db,
      $_db.sessions,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_sessionIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $SpeciesTable _speciesIdTable(_$AppDatabase db) =>
      db.species.createAlias('catches__species_id__species__id');

  $$SpeciesTableProcessedTableManager get speciesId {
    final $_column = $_itemColumn<int>('species_id')!;

    final manager = $$SpeciesTableTableManager(
      $_db,
      $_db.species,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_speciesIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $BaitsTable _baitIdTable(_$AppDatabase db) =>
      db.baits.createAlias('catches__bait_id__baits__id');

  $$BaitsTableProcessedTableManager? get baitId {
    final $_column = $_itemColumn<int>('bait_id');
    if ($_column == null) return null;
    final manager = $$BaitsTableTableManager(
      $_db,
      $_db.baits,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_baitIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $RigsTable _rigIdTable(_$AppDatabase db) =>
      db.rigs.createAlias('catches__rig_id__rigs__id');

  $$RigsTableProcessedTableManager? get rigId {
    final $_column = $_itemColumn<int>('rig_id');
    if ($_column == null) return null;
    final manager = $$RigsTableTableManager(
      $_db,
      $_db.rigs,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_rigIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$CatchPhotosTable, List<CatchPhoto>>
  _catchPhotosRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.catchPhotos,
    aliasName: 'catches__id__catch_photos__catch_id',
  );

  $$CatchPhotosTableProcessedTableManager get catchPhotosRefs {
    final manager = $$CatchPhotosTableTableManager(
      $_db,
      $_db.catchPhotos,
    ).filter((f) => f.catchId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_catchPhotosRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$CatchesTableFilterComposer
    extends Composer<_$AppDatabase, $CatchesTable> {
  $$CatchesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get lengthCm => $composableBuilder(
    column: $table.lengthCm,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get weightKg => $composableBuilder(
    column: $table.weightKg,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get caughtAt => $composableBuilder(
    column: $table.caughtAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get released => $composableBuilder(
    column: $table.released,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  $$SessionsTableFilterComposer get sessionId {
    final $$SessionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.sessionId,
      referencedTable: $db.sessions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SessionsTableFilterComposer(
            $db: $db,
            $table: $db.sessions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$SpeciesTableFilterComposer get speciesId {
    final $$SpeciesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.speciesId,
      referencedTable: $db.species,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SpeciesTableFilterComposer(
            $db: $db,
            $table: $db.species,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$BaitsTableFilterComposer get baitId {
    final $$BaitsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.baitId,
      referencedTable: $db.baits,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BaitsTableFilterComposer(
            $db: $db,
            $table: $db.baits,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$RigsTableFilterComposer get rigId {
    final $$RigsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.rigId,
      referencedTable: $db.rigs,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RigsTableFilterComposer(
            $db: $db,
            $table: $db.rigs,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> catchPhotosRefs(
    Expression<bool> Function($$CatchPhotosTableFilterComposer f) f,
  ) {
    final $$CatchPhotosTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.catchPhotos,
      getReferencedColumn: (t) => t.catchId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CatchPhotosTableFilterComposer(
            $db: $db,
            $table: $db.catchPhotos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$CatchesTableOrderingComposer
    extends Composer<_$AppDatabase, $CatchesTable> {
  $$CatchesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get lengthCm => $composableBuilder(
    column: $table.lengthCm,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get weightKg => $composableBuilder(
    column: $table.weightKg,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get caughtAt => $composableBuilder(
    column: $table.caughtAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get released => $composableBuilder(
    column: $table.released,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  $$SessionsTableOrderingComposer get sessionId {
    final $$SessionsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.sessionId,
      referencedTable: $db.sessions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SessionsTableOrderingComposer(
            $db: $db,
            $table: $db.sessions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$SpeciesTableOrderingComposer get speciesId {
    final $$SpeciesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.speciesId,
      referencedTable: $db.species,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SpeciesTableOrderingComposer(
            $db: $db,
            $table: $db.species,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$BaitsTableOrderingComposer get baitId {
    final $$BaitsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.baitId,
      referencedTable: $db.baits,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BaitsTableOrderingComposer(
            $db: $db,
            $table: $db.baits,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$RigsTableOrderingComposer get rigId {
    final $$RigsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.rigId,
      referencedTable: $db.rigs,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RigsTableOrderingComposer(
            $db: $db,
            $table: $db.rigs,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CatchesTableAnnotationComposer
    extends Composer<_$AppDatabase, $CatchesTable> {
  $$CatchesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<double> get lengthCm =>
      $composableBuilder(column: $table.lengthCm, builder: (column) => column);

  GeneratedColumn<double> get weightKg =>
      $composableBuilder(column: $table.weightKg, builder: (column) => column);

  GeneratedColumn<DateTime> get caughtAt =>
      $composableBuilder(column: $table.caughtAt, builder: (column) => column);

  GeneratedColumn<bool> get released =>
      $composableBuilder(column: $table.released, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  $$SessionsTableAnnotationComposer get sessionId {
    final $$SessionsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.sessionId,
      referencedTable: $db.sessions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SessionsTableAnnotationComposer(
            $db: $db,
            $table: $db.sessions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$SpeciesTableAnnotationComposer get speciesId {
    final $$SpeciesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.speciesId,
      referencedTable: $db.species,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SpeciesTableAnnotationComposer(
            $db: $db,
            $table: $db.species,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$BaitsTableAnnotationComposer get baitId {
    final $$BaitsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.baitId,
      referencedTable: $db.baits,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BaitsTableAnnotationComposer(
            $db: $db,
            $table: $db.baits,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$RigsTableAnnotationComposer get rigId {
    final $$RigsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.rigId,
      referencedTable: $db.rigs,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RigsTableAnnotationComposer(
            $db: $db,
            $table: $db.rigs,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> catchPhotosRefs<T extends Object>(
    Expression<T> Function($$CatchPhotosTableAnnotationComposer a) f,
  ) {
    final $$CatchPhotosTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.catchPhotos,
      getReferencedColumn: (t) => t.catchId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CatchPhotosTableAnnotationComposer(
            $db: $db,
            $table: $db.catchPhotos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$CatchesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CatchesTable,
          Catche,
          $$CatchesTableFilterComposer,
          $$CatchesTableOrderingComposer,
          $$CatchesTableAnnotationComposer,
          $$CatchesTableCreateCompanionBuilder,
          $$CatchesTableUpdateCompanionBuilder,
          (Catche, $$CatchesTableReferences),
          Catche,
          PrefetchHooks Function({
            bool sessionId,
            bool speciesId,
            bool baitId,
            bool rigId,
            bool catchPhotosRefs,
          })
        > {
  $$CatchesTableTableManager(_$AppDatabase db, $CatchesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CatchesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CatchesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CatchesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> sessionId = const Value.absent(),
                Value<int> speciesId = const Value.absent(),
                Value<int?> baitId = const Value.absent(),
                Value<int?> rigId = const Value.absent(),
                Value<double?> lengthCm = const Value.absent(),
                Value<double?> weightKg = const Value.absent(),
                Value<DateTime> caughtAt = const Value.absent(),
                Value<bool> released = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CatchesCompanion(
                id: id,
                sessionId: sessionId,
                speciesId: speciesId,
                baitId: baitId,
                rigId: rigId,
                lengthCm: lengthCm,
                weightKg: weightKg,
                caughtAt: caughtAt,
                released: released,
                notes: notes,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String sessionId,
                required int speciesId,
                Value<int?> baitId = const Value.absent(),
                Value<int?> rigId = const Value.absent(),
                Value<double?> lengthCm = const Value.absent(),
                Value<double?> weightKg = const Value.absent(),
                required DateTime caughtAt,
                Value<bool> released = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CatchesCompanion.insert(
                id: id,
                sessionId: sessionId,
                speciesId: speciesId,
                baitId: baitId,
                rigId: rigId,
                lengthCm: lengthCm,
                weightKg: weightKg,
                caughtAt: caughtAt,
                released: released,
                notes: notes,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$CatchesTable, Catche>(table),
                  $$CatchesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                sessionId = false,
                speciesId = false,
                baitId = false,
                rigId = false,
                catchPhotosRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (catchPhotosRefs) db.catchPhotos,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (sessionId) {
                          state = state.withJoin(
                            currentTable: table,
                            currentColumn: table.sessionId,
                            referencedTable: $$CatchesTableReferences
                                ._sessionIdTable(db),
                            referencedColumn: $$CatchesTableReferences
                                ._sessionIdTable(db)
                                .id,
                          ) as T;
                        }
                        if (speciesId) {
                          state = state.withJoin(
                            currentTable: table,
                            currentColumn: table.speciesId,
                            referencedTable: $$CatchesTableReferences
                                ._speciesIdTable(db),
                            referencedColumn: $$CatchesTableReferences
                                ._speciesIdTable(db)
                                .id,
                          ) as T;
                        }
                        if (baitId) {
                          state = state.withJoin(
                            currentTable: table,
                            currentColumn: table.baitId,
                            referencedTable: $$CatchesTableReferences
                                ._baitIdTable(db),
                            referencedColumn: $$CatchesTableReferences
                                ._baitIdTable(db)
                                .id,
                          ) as T;
                        }
                        if (rigId) {
                          state = state.withJoin(
                            currentTable: table,
                            currentColumn: table.rigId,
                            referencedTable: $$CatchesTableReferences
                                ._rigIdTable(db),
                            referencedColumn: $$CatchesTableReferences
                                ._rigIdTable(db)
                                .id,
                          ) as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (catchPhotosRefs)
                        await $_getPrefetchedDataByColumns<
                          Catche,
                          $CatchesTable,
                          CatchPhoto,
                          $CatchPhotosTable
                        >(
                          currentTable: table,
                          referencedTable: $$CatchesTableReferences
                              ._catchPhotosRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$CatchesTableReferences(
                                db,
                                table,
                                p0,
                              ).catchPhotosRefs,
                          currentColumn: 'id',
                          referencedColumn: 'catch_id',
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$CatchesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CatchesTable,
      Catche,
      $$CatchesTableFilterComposer,
      $$CatchesTableOrderingComposer,
      $$CatchesTableAnnotationComposer,
      $$CatchesTableCreateCompanionBuilder,
      $$CatchesTableUpdateCompanionBuilder,
      (Catche, $$CatchesTableReferences),
      Catche,
      PrefetchHooks Function({
        bool sessionId,
        bool speciesId,
        bool baitId,
        bool rigId,
        bool catchPhotosRefs,
      })
    >;
typedef $$CatchPhotosTableCreateCompanionBuilder =
    CatchPhotosCompanion Function({
      required String id,
      required String catchId,
      required String filePath,
      required DateTime createdAt,
      Value<int> rowid,
    });
typedef $$CatchPhotosTableUpdateCompanionBuilder =
    CatchPhotosCompanion Function({
      Value<String> id,
      Value<String> catchId,
      Value<String> filePath,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });

final class $$CatchPhotosTableReferences
    extends BaseReferences<_$AppDatabase, $CatchPhotosTable, CatchPhoto> {
  $$CatchPhotosTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $CatchesTable _catchIdTable(_$AppDatabase db) =>
      db.catches.createAlias('catch_photos__catch_id__catches__id');

  $$CatchesTableProcessedTableManager get catchId {
    final $_column = $_itemColumn<String>('catch_id')!;

    final manager = $$CatchesTableTableManager(
      $_db,
      $_db.catches,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_catchIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$CatchPhotosTableFilterComposer
    extends Composer<_$AppDatabase, $CatchPhotosTable> {
  $$CatchPhotosTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get filePath => $composableBuilder(
    column: $table.filePath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  $$CatchesTableFilterComposer get catchId {
    final $$CatchesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.catchId,
      referencedTable: $db.catches,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CatchesTableFilterComposer(
            $db: $db,
            $table: $db.catches,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CatchPhotosTableOrderingComposer
    extends Composer<_$AppDatabase, $CatchPhotosTable> {
  $$CatchPhotosTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get filePath => $composableBuilder(
    column: $table.filePath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$CatchesTableOrderingComposer get catchId {
    final $$CatchesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.catchId,
      referencedTable: $db.catches,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CatchesTableOrderingComposer(
            $db: $db,
            $table: $db.catches,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CatchPhotosTableAnnotationComposer
    extends Composer<_$AppDatabase, $CatchPhotosTable> {
  $$CatchPhotosTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get filePath =>
      $composableBuilder(column: $table.filePath, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  $$CatchesTableAnnotationComposer get catchId {
    final $$CatchesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.catchId,
      referencedTable: $db.catches,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CatchesTableAnnotationComposer(
            $db: $db,
            $table: $db.catches,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CatchPhotosTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CatchPhotosTable,
          CatchPhoto,
          $$CatchPhotosTableFilterComposer,
          $$CatchPhotosTableOrderingComposer,
          $$CatchPhotosTableAnnotationComposer,
          $$CatchPhotosTableCreateCompanionBuilder,
          $$CatchPhotosTableUpdateCompanionBuilder,
          (CatchPhoto, $$CatchPhotosTableReferences),
          CatchPhoto,
          PrefetchHooks Function({bool catchId})
        > {
  $$CatchPhotosTableTableManager(_$AppDatabase db, $CatchPhotosTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CatchPhotosTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CatchPhotosTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CatchPhotosTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> catchId = const Value.absent(),
                Value<String> filePath = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CatchPhotosCompanion(
                id: id,
                catchId: catchId,
                filePath: filePath,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String catchId,
                required String filePath,
                required DateTime createdAt,
                Value<int> rowid = const Value.absent(),
              }) => CatchPhotosCompanion.insert(
                id: id,
                catchId: catchId,
                filePath: filePath,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$CatchPhotosTable, CatchPhoto>(table),
                  $$CatchPhotosTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({catchId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (catchId) {
                      state = state.withJoin(
                        currentTable: table,
                        currentColumn: table.catchId,
                        referencedTable: $$CatchPhotosTableReferences
                            ._catchIdTable(db),
                        referencedColumn: $$CatchPhotosTableReferences
                            ._catchIdTable(db)
                            .id,
                      ) as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$CatchPhotosTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CatchPhotosTable,
      CatchPhoto,
      $$CatchPhotosTableFilterComposer,
      $$CatchPhotosTableOrderingComposer,
      $$CatchPhotosTableAnnotationComposer,
      $$CatchPhotosTableCreateCompanionBuilder,
      $$CatchPhotosTableUpdateCompanionBuilder,
      (CatchPhoto, $$CatchPhotosTableReferences),
      CatchPhoto,
      PrefetchHooks Function({bool catchId})
    >;
typedef $$WeatherSnapshotsTableCreateCompanionBuilder =
    WeatherSnapshotsCompanion Function({
      required String sessionId,
      required DateTime fetchedAt,
      required double temperatureC,
      required double apparentTempC,
      required double humidity,
      required double pressureHpa,
      required double windSpeedKmh,
      required double windDirectionDeg,
      required double cloudCover,
      required double precipitationMm,
      required int weatherCode,
      required String rawJson,
      Value<int> rowid,
    });
typedef $$WeatherSnapshotsTableUpdateCompanionBuilder =
    WeatherSnapshotsCompanion Function({
      Value<String> sessionId,
      Value<DateTime> fetchedAt,
      Value<double> temperatureC,
      Value<double> apparentTempC,
      Value<double> humidity,
      Value<double> pressureHpa,
      Value<double> windSpeedKmh,
      Value<double> windDirectionDeg,
      Value<double> cloudCover,
      Value<double> precipitationMm,
      Value<int> weatherCode,
      Value<String> rawJson,
      Value<int> rowid,
    });

final class $$WeatherSnapshotsTableReferences
    extends
        BaseReferences<_$AppDatabase, $WeatherSnapshotsTable, WeatherSnapshot> {
  $$WeatherSnapshotsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $SessionsTable _sessionIdTable(_$AppDatabase db) =>
      db.sessions.createAlias('weather_snapshots__session_id__sessions__id');

  $$SessionsTableProcessedTableManager get sessionId {
    final $_column = $_itemColumn<String>('session_id')!;

    final manager = $$SessionsTableTableManager(
      $_db,
      $_db.sessions,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_sessionIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$WeatherSnapshotsTableFilterComposer
    extends Composer<_$AppDatabase, $WeatherSnapshotsTable> {
  $$WeatherSnapshotsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<DateTime> get fetchedAt => $composableBuilder(
    column: $table.fetchedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get temperatureC => $composableBuilder(
    column: $table.temperatureC,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get apparentTempC => $composableBuilder(
    column: $table.apparentTempC,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get humidity => $composableBuilder(
    column: $table.humidity,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get pressureHpa => $composableBuilder(
    column: $table.pressureHpa,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get windSpeedKmh => $composableBuilder(
    column: $table.windSpeedKmh,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get windDirectionDeg => $composableBuilder(
    column: $table.windDirectionDeg,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get cloudCover => $composableBuilder(
    column: $table.cloudCover,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get precipitationMm => $composableBuilder(
    column: $table.precipitationMm,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get weatherCode => $composableBuilder(
    column: $table.weatherCode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get rawJson => $composableBuilder(
    column: $table.rawJson,
    builder: (column) => ColumnFilters(column),
  );

  $$SessionsTableFilterComposer get sessionId {
    final $$SessionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.sessionId,
      referencedTable: $db.sessions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SessionsTableFilterComposer(
            $db: $db,
            $table: $db.sessions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$WeatherSnapshotsTableOrderingComposer
    extends Composer<_$AppDatabase, $WeatherSnapshotsTable> {
  $$WeatherSnapshotsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<DateTime> get fetchedAt => $composableBuilder(
    column: $table.fetchedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get temperatureC => $composableBuilder(
    column: $table.temperatureC,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get apparentTempC => $composableBuilder(
    column: $table.apparentTempC,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get humidity => $composableBuilder(
    column: $table.humidity,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get pressureHpa => $composableBuilder(
    column: $table.pressureHpa,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get windSpeedKmh => $composableBuilder(
    column: $table.windSpeedKmh,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get windDirectionDeg => $composableBuilder(
    column: $table.windDirectionDeg,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get cloudCover => $composableBuilder(
    column: $table.cloudCover,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get precipitationMm => $composableBuilder(
    column: $table.precipitationMm,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get weatherCode => $composableBuilder(
    column: $table.weatherCode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get rawJson => $composableBuilder(
    column: $table.rawJson,
    builder: (column) => ColumnOrderings(column),
  );

  $$SessionsTableOrderingComposer get sessionId {
    final $$SessionsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.sessionId,
      referencedTable: $db.sessions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SessionsTableOrderingComposer(
            $db: $db,
            $table: $db.sessions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$WeatherSnapshotsTableAnnotationComposer
    extends Composer<_$AppDatabase, $WeatherSnapshotsTable> {
  $$WeatherSnapshotsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<DateTime> get fetchedAt =>
      $composableBuilder(column: $table.fetchedAt, builder: (column) => column);

  GeneratedColumn<double> get temperatureC => $composableBuilder(
    column: $table.temperatureC,
    builder: (column) => column,
  );

  GeneratedColumn<double> get apparentTempC => $composableBuilder(
    column: $table.apparentTempC,
    builder: (column) => column,
  );

  GeneratedColumn<double> get humidity =>
      $composableBuilder(column: $table.humidity, builder: (column) => column);

  GeneratedColumn<double> get pressureHpa => $composableBuilder(
    column: $table.pressureHpa,
    builder: (column) => column,
  );

  GeneratedColumn<double> get windSpeedKmh => $composableBuilder(
    column: $table.windSpeedKmh,
    builder: (column) => column,
  );

  GeneratedColumn<double> get windDirectionDeg => $composableBuilder(
    column: $table.windDirectionDeg,
    builder: (column) => column,
  );

  GeneratedColumn<double> get cloudCover => $composableBuilder(
    column: $table.cloudCover,
    builder: (column) => column,
  );

  GeneratedColumn<double> get precipitationMm => $composableBuilder(
    column: $table.precipitationMm,
    builder: (column) => column,
  );

  GeneratedColumn<int> get weatherCode => $composableBuilder(
    column: $table.weatherCode,
    builder: (column) => column,
  );

  GeneratedColumn<String> get rawJson =>
      $composableBuilder(column: $table.rawJson, builder: (column) => column);

  $$SessionsTableAnnotationComposer get sessionId {
    final $$SessionsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.sessionId,
      referencedTable: $db.sessions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SessionsTableAnnotationComposer(
            $db: $db,
            $table: $db.sessions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$WeatherSnapshotsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $WeatherSnapshotsTable,
          WeatherSnapshot,
          $$WeatherSnapshotsTableFilterComposer,
          $$WeatherSnapshotsTableOrderingComposer,
          $$WeatherSnapshotsTableAnnotationComposer,
          $$WeatherSnapshotsTableCreateCompanionBuilder,
          $$WeatherSnapshotsTableUpdateCompanionBuilder,
          (WeatherSnapshot, $$WeatherSnapshotsTableReferences),
          WeatherSnapshot,
          PrefetchHooks Function({bool sessionId})
        > {
  $$WeatherSnapshotsTableTableManager(
    _$AppDatabase db,
    $WeatherSnapshotsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$WeatherSnapshotsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$WeatherSnapshotsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$WeatherSnapshotsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> sessionId = const Value.absent(),
                Value<DateTime> fetchedAt = const Value.absent(),
                Value<double> temperatureC = const Value.absent(),
                Value<double> apparentTempC = const Value.absent(),
                Value<double> humidity = const Value.absent(),
                Value<double> pressureHpa = const Value.absent(),
                Value<double> windSpeedKmh = const Value.absent(),
                Value<double> windDirectionDeg = const Value.absent(),
                Value<double> cloudCover = const Value.absent(),
                Value<double> precipitationMm = const Value.absent(),
                Value<int> weatherCode = const Value.absent(),
                Value<String> rawJson = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => WeatherSnapshotsCompanion(
                sessionId: sessionId,
                fetchedAt: fetchedAt,
                temperatureC: temperatureC,
                apparentTempC: apparentTempC,
                humidity: humidity,
                pressureHpa: pressureHpa,
                windSpeedKmh: windSpeedKmh,
                windDirectionDeg: windDirectionDeg,
                cloudCover: cloudCover,
                precipitationMm: precipitationMm,
                weatherCode: weatherCode,
                rawJson: rawJson,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String sessionId,
                required DateTime fetchedAt,
                required double temperatureC,
                required double apparentTempC,
                required double humidity,
                required double pressureHpa,
                required double windSpeedKmh,
                required double windDirectionDeg,
                required double cloudCover,
                required double precipitationMm,
                required int weatherCode,
                required String rawJson,
                Value<int> rowid = const Value.absent(),
              }) => WeatherSnapshotsCompanion.insert(
                sessionId: sessionId,
                fetchedAt: fetchedAt,
                temperatureC: temperatureC,
                apparentTempC: apparentTempC,
                humidity: humidity,
                pressureHpa: pressureHpa,
                windSpeedKmh: windSpeedKmh,
                windDirectionDeg: windDirectionDeg,
                cloudCover: cloudCover,
                precipitationMm: precipitationMm,
                weatherCode: weatherCode,
                rawJson: rawJson,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$WeatherSnapshotsTable, WeatherSnapshot>(table),
                  $$WeatherSnapshotsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({sessionId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (sessionId) {
                      state = state.withJoin(
                        currentTable: table,
                        currentColumn: table.sessionId,
                        referencedTable: $$WeatherSnapshotsTableReferences
                            ._sessionIdTable(db),
                        referencedColumn: $$WeatherSnapshotsTableReferences
                            ._sessionIdTable(db)
                            .id,
                      ) as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$WeatherSnapshotsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $WeatherSnapshotsTable,
      WeatherSnapshot,
      $$WeatherSnapshotsTableFilterComposer,
      $$WeatherSnapshotsTableOrderingComposer,
      $$WeatherSnapshotsTableAnnotationComposer,
      $$WeatherSnapshotsTableCreateCompanionBuilder,
      $$WeatherSnapshotsTableUpdateCompanionBuilder,
      (WeatherSnapshot, $$WeatherSnapshotsTableReferences),
      WeatherSnapshot,
      PrefetchHooks Function({bool sessionId})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$SessionsTableTableManager get sessions =>
      $$SessionsTableTableManager(_db, _db.sessions);
  $$SpeciesTableTableManager get species =>
      $$SpeciesTableTableManager(_db, _db.species);
  $$BaitsTableTableManager get baits =>
      $$BaitsTableTableManager(_db, _db.baits);
  $$RigsTableTableManager get rigs => $$RigsTableTableManager(_db, _db.rigs);
  $$CatchesTableTableManager get catches =>
      $$CatchesTableTableManager(_db, _db.catches);
  $$CatchPhotosTableTableManager get catchPhotos =>
      $$CatchPhotosTableTableManager(_db, _db.catchPhotos);
  $$WeatherSnapshotsTableTableManager get weatherSnapshots =>
      $$WeatherSnapshotsTableTableManager(_db, _db.weatherSnapshots);
}
