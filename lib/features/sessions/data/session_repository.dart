import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

import '../../../core/db/app_database.dart' hide WeatherSnapshot;
import '../../../core/db/app_database.dart' as db show WeatherSnapshot;
import '../../weather/domain/weather_snapshot.dart';
import '../domain/catch_entry.dart';
import '../domain/fishing_session.dart';

/// Satu-satunya pintu UI ke data sesi; mengembalikan model domain, bukan Drift.
class SessionRepository {
  SessionRepository(this._db, {DateTime Function()? clock, Uuid? uuid})
      : _clock = clock ?? DateTime.now,
        _uuid = uuid ?? const Uuid();

  final AppDatabase _db;
  final DateTime Function() _clock;
  final Uuid _uuid;

  /// Sesi terbaru dulu, lengkap dengan tangkapan dan cuaca.
  Stream<List<FishingSession>> watchSessions() {
    final query = _db.select(_db.sessions)
      ..orderBy([(s) => OrderingTerm.desc(s.startedAt)]);
    return _watchAll(query);
  }

  /// Emit `null` bila sesi tidak ada (atau sudah dihapus).
  Stream<FishingSession?> watchSession(String id) {
    final query = _db.select(_db.sessions)..where((s) => s.id.equals(id));
    return _watchAll(query).map((l) => l.isEmpty ? null : l.single);
  }

  Stream<List<FishingSession>> _watchAll(
    SimpleSelectStatement<$SessionsTable, Session> sessionQuery,
  ) {
    // Drift menandai stream stale bila tabel manapun di bawah berubah.
    final sessions = sessionQuery.watch();
    return sessions.asyncMap((rows) async {
      final ids = rows.map((r) => r.id).toList();
      final catches = await _catchesFor(ids);
      final weather = await (_db.select(_db.weatherSnapshots)
            ..where((w) => w.sessionId.isIn(ids)))
          .get();
      final weatherById = {for (final w in weather) w.sessionId: w};
      return [
        for (final r in rows)
          _toSession(r, catches[r.id] ?? const [], weatherById[r.id]),
      ];
    }).distinct();
  }

  Future<Map<String, List<CatchEntry>>> _catchesFor(List<String> ids) async {
    final q = _db.select(_db.catches).join([
      innerJoin(_db.species, _db.species.id.equalsExp(_db.catches.speciesId)),
      leftOuterJoin(_db.baits, _db.baits.id.equalsExp(_db.catches.baitId)),
      leftOuterJoin(_db.rigs, _db.rigs.id.equalsExp(_db.catches.rigId)),
    ])
      ..where(_db.catches.sessionId.isIn(ids))
      ..orderBy([OrderingTerm.asc(_db.catches.caughtAt)]);
    final result = <String, List<CatchEntry>>{};
    for (final row in await q.get()) {
      final entry = _toCatch(
        row.readTable(_db.catches),
        row.readTable(_db.species),
        row.readTableOrNull(_db.baits),
        row.readTableOrNull(_db.rigs),
      );
      (result[entry.sessionId] ??= []).add(entry);
    }
    return result;
  }

  /// Membuat sesi baru; `id`, `createdAt`, `updatedAt` dibuat di sini.
  Future<String> createSession({
    required DateTime startedAt,
    DateTime? endedAt,
    required double latitude,
    required double longitude,
    String? locationName,
    String? notes,
    int? rating,
  }) async {
    final id = _uuid.v4();
    final now = _clock();
    await _db.into(_db.sessions).insert(SessionsCompanion.insert(
          id: id,
          startedAt: startedAt,
          endedAt: Value(endedAt),
          latitude: latitude,
          longitude: longitude,
          locationName: Value(locationName),
          notes: Value(notes),
          rating: Value(rating),
          createdAt: now,
          updatedAt: now,
        ));
    return id;
  }

  /// Memperbarui field sesi; tangkapan dan cuaca tidak ikut diubah.
  Future<void> updateSession(FishingSession session) async {
    await (_db.update(_db.sessions)..where((s) => s.id.equals(session.id)))
        .write(SessionsCompanion(
      startedAt: Value(session.startedAt),
      endedAt: Value(session.endedAt),
      latitude: Value(session.latitude),
      longitude: Value(session.longitude),
      locationName: Value(session.locationName),
      notes: Value(session.notes),
      rating: Value(session.rating),
      updatedAt: Value(_clock()),
    ));
  }

  /// Tangkapan, foto, dan cuaca ikut terhapus (cascade).
  Future<void> deleteSession(String id) async {
    await (_db.delete(_db.sessions)..where((s) => s.id.equals(id))).go();
  }

  Future<String> addCatch(CatchEntry entry) async {
    final id = _uuid.v4();
    await _db.into(_db.catches).insert(_toCompanion(entry, id));
    await _touch(entry.sessionId);
    return id;
  }

  Future<void> updateCatch(CatchEntry entry) async {
    await (_db.update(_db.catches)..where((c) => c.id.equals(entry.id)))
        .write(_toCompanion(entry, entry.id));
    await _touch(entry.sessionId);
  }

  Future<void> deleteCatch(String id) async {
    final row = await (_db.select(_db.catches)..where((c) => c.id.equals(id)))
        .getSingleOrNull();
    if (row == null) return;
    await (_db.delete(_db.catches)..where((c) => c.id.equals(id))).go();
    await _touch(row.sessionId);
  }

  Future<void> _touch(String sessionId) async {
    await (_db.update(_db.sessions)..where((s) => s.id.equals(sessionId)))
        .write(SessionsCompanion(updatedAt: Value(_clock())));
  }

  CatchesCompanion _toCompanion(CatchEntry e, String id) => CatchesCompanion(
        id: Value(id),
        sessionId: Value(e.sessionId),
        speciesId: Value(e.speciesId),
        baitId: Value(e.baitId),
        rigId: Value(e.rigId),
        lengthCm: Value(e.lengthCm),
        weightKg: Value(e.weightKg),
        caughtAt: Value(e.caughtAt),
        released: Value(e.released),
        notes: Value(e.notes),
      );

  FishingSession _toSession(
    Session s,
    List<CatchEntry> catches,
    db.WeatherSnapshot? w,
  ) =>
      FishingSession(
        id: s.id,
        startedAt: s.startedAt,
        endedAt: s.endedAt,
        latitude: s.latitude,
        longitude: s.longitude,
        locationName: s.locationName,
        notes: s.notes,
        rating: s.rating,
        createdAt: s.createdAt,
        updatedAt: s.updatedAt,
        catches: catches,
        weather: w == null ? null : _toWeather(w),
      );

  CatchEntry _toCatch(Catche c, Specy species, Bait? bait, Rig? rig) =>
      CatchEntry(
        id: c.id,
        sessionId: c.sessionId,
        speciesId: c.speciesId,
        speciesName: species.name,
        baitId: c.baitId,
        baitName: bait?.name,
        rigId: c.rigId,
        rigName: rig?.name,
        lengthCm: c.lengthCm,
        weightKg: c.weightKg,
        caughtAt: c.caughtAt,
        released: c.released,
        notes: c.notes,
      );

  WeatherSnapshot _toWeather(db.WeatherSnapshot w) => WeatherSnapshot(
        sessionId: w.sessionId,
        fetchedAt: w.fetchedAt,
        temperatureC: w.temperatureC,
        apparentTempC: w.apparentTempC,
        humidity: w.humidity,
        pressureHpa: w.pressureHpa,
        windSpeedKmh: w.windSpeedKmh,
        windDirectionDeg: w.windDirectionDeg,
        cloudCover: w.cloudCover,
        precipitationMm: w.precipitationMm,
        weatherCode: w.weatherCode,
        rawJson: w.rawJson,
      );
}

final sessionRepositoryProvider = Provider<SessionRepository>(
  (ref) => SessionRepository(ref.watch(appDatabaseProvider)),
);
