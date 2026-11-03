import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/db/app_database.dart';
import 'open_meteo_api.dart';

class WeatherRepository {
  WeatherRepository(this._db, this._api);

  final AppDatabase _db;
  final OpenMeteoApi _api;

  /// Ambil cuaca untuk sesi lalu simpan (upsert). Tidak pernah melempar:
  /// mengembalikan `false` bila sesi tak ada, jaringan gagal, atau data cacat.
  Future<bool> refresh(String sessionId) async {
    try {
      final session = await (_db.select(
        _db.sessions,
      )..where((s) => s.id.equals(sessionId))).getSingleOrNull();
      if (session == null) return false;

      final w = await _api.fetch(
        sessionId: sessionId,
        latitude: session.latitude,
        longitude: session.longitude,
        startedAt: session.startedAt,
      );

      // Sesi bisa terhapus selama request berjalan; jangan menulis yatim.
      final stillThere = await (_db.select(
        _db.sessions,
      )..where((s) => s.id.equals(sessionId))).getSingleOrNull();
      if (stillThere == null) return false;

      await _db
          .into(_db.weatherSnapshots)
          .insertOnConflictUpdate(
            WeatherSnapshotsCompanion.insert(
              sessionId: sessionId,
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
            ),
          );
      // Stream sesi hanya memantau tabel sessions; sentuh agar UI ter-update.
      await (_db.update(_db.sessions)..where((s) => s.id.equals(sessionId)))
          .write(SessionsCompanion(updatedAt: Value(w.fetchedAt)));
      return true;
    } catch (_) {
      return false;
    }
  }
}

final weatherRepositoryProvider = Provider<WeatherRepository>(
  (ref) => WeatherRepository(
    ref.watch(appDatabaseProvider),
    ref.watch(openMeteoApiProvider),
  ),
);
