import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fishing_log/core/db/app_database.dart';

void main() {
  late AppDatabase db;

  setUp(() => db = AppDatabase(NativeDatabase.memory()));
  tearDown(() => db.close());

  test('seeds species, baits and rigs on create', () async {
    expect((await db.select(db.species).get()), isNotEmpty);
    expect((await db.select(db.baits).get()), isNotEmpty);
    expect((await db.select(db.rigs).get()), isNotEmpty);
  });

  test('deleting a session cascades to catches, photos and weather', () async {
    final now = DateTime(2026, 1, 1);
    final speciesId = (await db.select(db.species).get()).first.id;

    await db
        .into(db.sessions)
        .insert(
          SessionsCompanion.insert(
            id: 's1',
            startedAt: now,
            latitude: -6.2,
            longitude: 106.8,
            createdAt: now,
            updatedAt: now,
          ),
        );
    await db
        .into(db.catches)
        .insert(
          CatchesCompanion.insert(
            id: 'c1',
            sessionId: 's1',
            speciesId: speciesId,
            caughtAt: now,
          ),
        );
    await db
        .into(db.catchPhotos)
        .insert(
          CatchPhotosCompanion.insert(
            id: 'p1',
            catchId: 'c1',
            filePath: 'photos/p1.jpg',
            createdAt: now,
          ),
        );
    await db
        .into(db.weatherSnapshots)
        .insert(
          WeatherSnapshotsCompanion.insert(
            sessionId: 's1',
            fetchedAt: now,
            temperatureC: 30,
            apparentTempC: 33,
            humidity: 70,
            pressureHpa: 1010,
            windSpeedKmh: 8,
            windDirectionDeg: 90,
            cloudCover: 40,
            precipitationMm: 0,
            weatherCode: 1,
            rawJson: '{}',
          ),
        );

    expect(await db.select(db.catches).get(), hasLength(1));

    await (db.delete(db.sessions)..where((s) => s.id.equals('s1'))).go();

    expect(await db.select(db.sessions).get(), isEmpty);
    expect(await db.select(db.catches).get(), isEmpty);
    expect(await db.select(db.catchPhotos).get(), isEmpty);
    expect(await db.select(db.weatherSnapshots).get(), isEmpty);
  });
}
