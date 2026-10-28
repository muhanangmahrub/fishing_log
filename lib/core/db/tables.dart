import 'package:drift/drift.dart';

class Species extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().unique()();
  BoolColumn get isCustom => boolean().withDefault(const Constant(false))();
}

class Baits extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().unique()();
  BoolColumn get isCustom => boolean().withDefault(const Constant(false))();
}

class Rigs extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().unique()();
  BoolColumn get isCustom => boolean().withDefault(const Constant(false))();
}

class Sessions extends Table {
  TextColumn get id => text()();
  DateTimeColumn get startedAt => dateTime()();
  DateTimeColumn get endedAt => dateTime().nullable()();
  RealColumn get latitude => real()();
  RealColumn get longitude => real()();
  TextColumn get locationName => text().nullable()();
  TextColumn get notes => text().nullable()();
  IntColumn get rating => integer().nullable()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

class Catches extends Table {
  TextColumn get id => text()();
  TextColumn get sessionId =>
      text().references(Sessions, #id, onDelete: KeyAction.cascade)();
  IntColumn get speciesId => integer().references(Species, #id)();
  IntColumn get baitId => integer().nullable().references(Baits, #id)();
  IntColumn get rigId => integer().nullable().references(Rigs, #id)();
  RealColumn get lengthCm => real().nullable()();
  RealColumn get weightKg => real().nullable()();
  DateTimeColumn get caughtAt => dateTime()();
  BoolColumn get released => boolean().withDefault(const Constant(false))();
  TextColumn get notes => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

class CatchPhotos extends Table {
  TextColumn get id => text()();
  TextColumn get catchId =>
      text().references(Catches, #id, onDelete: KeyAction.cascade)();

  /// Relatif ke direktori dokumen aplikasi.
  TextColumn get filePath => text()();
  DateTimeColumn get createdAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

class WeatherSnapshots extends Table {
  TextColumn get sessionId =>
      text().references(Sessions, #id, onDelete: KeyAction.cascade)();
  DateTimeColumn get fetchedAt => dateTime()();
  RealColumn get temperatureC => real()();
  RealColumn get apparentTempC => real()();
  RealColumn get humidity => real()();
  RealColumn get pressureHpa => real()();
  RealColumn get windSpeedKmh => real()();
  RealColumn get windDirectionDeg => real()();
  RealColumn get cloudCover => real()();
  RealColumn get precipitationMm => real()();
  IntColumn get weatherCode => integer()();
  TextColumn get rawJson => text()();

  @override
  Set<Column> get primaryKey => {sessionId};
}
