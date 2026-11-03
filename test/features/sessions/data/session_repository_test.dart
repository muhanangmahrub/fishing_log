import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fishing_log/core/db/app_database.dart';
import 'package:fishing_log/features/sessions/data/session_repository.dart';
import 'package:fishing_log/features/sessions/domain/catch_entry.dart';

void main() {
  late AppDatabase db;
  late SessionRepository repo;
  late DateTime now;
  late int speciesId;

  setUp(() async {
    db = AppDatabase(NativeDatabase.memory());
    now = DateTime(2026, 1, 1, 10);
    repo = SessionRepository(db, clock: () => now);
    speciesId = (await db.select(db.species).get()).first.id;
  });
  tearDown(() => db.close());

  Future<String> newSession([DateTime? start]) => repo.createSession(
    startedAt: start ?? DateTime(2026, 1, 1, 6),
    latitude: -6.2,
    longitude: 106.8,
    locationName: 'Muara',
  );

  CatchEntry draft(String sessionId, {int? baitId}) => CatchEntry(
    id: '',
    sessionId: sessionId,
    speciesId: speciesId,
    speciesName: '',
    baitId: baitId,
    caughtAt: DateTime(2026, 1, 1, 7),
    lengthCm: 30,
  );

  test(
    'create then watchSession maps to domain, blank session has 0 catches',
    () async {
      final id = await newSession();
      final s = (await repo.watchSession(id).first)!;
      expect(s.locationName, 'Muara');
      expect(s.createdAt, now);
      expect(s.catchCount, 0);
      expect(s.isBlank, isTrue);
      expect(s.weather, isNull);
    },
  );

  test('watchSession emits null for unknown id', () async {
    expect(await repo.watchSession('nope').first, isNull);
  });

  test('watchSessions orders newest first', () async {
    final old = await newSession(DateTime(2025, 5, 1));
    final recent = await newSession(DateTime(2026, 3, 1));
    final list = await repo.watchSessions().first;
    expect(list.map((s) => s.id), [recent, old]);
  });

  test('updateSession changes fields and bumps updatedAt', () async {
    final id = await newSession();
    final s = (await repo.watchSession(id).first)!;
    now = DateTime(2026, 2, 2);
    await repo.updateSession(s.copyWith(rating: 4, notes: 'cerah'));
    final u = (await repo.watchSession(id).first)!;
    expect(u.rating, 4);
    expect(u.notes, 'cerah');
    expect(u.updatedAt, now);
    expect(u.createdAt, s.createdAt);
  });

  test('catch add/update/delete with joined names', () async {
    final id = await newSession();
    final baitId = (await db.select(db.baits).get()).first.id;
    final catchId = await repo.addCatch(draft(id, baitId: baitId));

    var s = (await repo.watchSession(id).first)!;
    expect(s.catchCount, 1);
    expect(s.catches.single.id, catchId);
    expect(s.catches.single.speciesName, isNotEmpty);
    expect(s.catches.single.baitName, isNotEmpty);
    expect(s.catches.single.rigName, isNull);

    await repo.updateCatch(
      s.catches.single.copyWith(lengthCm: 45, released: true),
    );
    s = (await repo.watchSession(id).first)!;
    expect(s.catches.single.lengthCm, 45);
    expect(s.catches.single.released, isTrue);

    await repo.deleteCatch(catchId);
    s = (await repo.watchSession(id).first)!;
    expect(s.isBlank, isTrue);
  });

  test('watchSession stream re-emits when a catch is added', () async {
    final id = await newSession();
    final counts = <int>[];
    final sub = repo.watchSession(id).listen((s) => counts.add(s!.catchCount));
    await pumpEventQueue();
    await repo.addCatch(draft(id));
    await pumpEventQueue();
    await sub.cancel();
    expect(counts, [0, 1]);
  });

  test('deleteSession removes catches and weather, maps weather', () async {
    final id = await newSession();
    await repo.addCatch(draft(id));
    await db
        .into(db.weatherSnapshots)
        .insert(
          WeatherSnapshotsCompanion.insert(
            sessionId: id,
            fetchedAt: now,
            temperatureC: 28,
            apparentTempC: 30,
            humidity: 80,
            pressureHpa: 1010,
            windSpeedKmh: 12,
            windDirectionDeg: 90,
            cloudCover: 40,
            precipitationMm: 0,
            weatherCode: 1,
            rawJson: '{}',
          ),
        );
    expect((await repo.watchSession(id).first)!.weather!.temperatureC, 28);

    await repo.deleteSession(id);
    expect(await repo.watchSession(id).first, isNull);
    expect(await db.select(db.catches).get(), isEmpty);
    expect(await db.select(db.weatherSnapshots).get(), isEmpty);
  });
}
