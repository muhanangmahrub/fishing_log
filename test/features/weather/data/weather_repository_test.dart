import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:drift/native.dart';
import 'package:fishing_log/core/db/app_database.dart';
import 'package:fishing_log/features/weather/data/open_meteo_api.dart';
import 'package:fishing_log/features/weather/data/weather_repository.dart';
import 'package:flutter_test/flutter_test.dart';

import 'open_meteo_api_test.dart' show FakeAdapter;

void main() {
  late AppDatabase db;
  setUp(() async {
    db = AppDatabase(NativeDatabase.memory());
    await db
        .into(db.sessions)
        .insert(
          SessionsCompanion.insert(
            id: 's1',
            startedAt: DateTime(2026, 11, 3, 6),
            latitude: -6.25,
            longitude: 106.75,
            createdAt: DateTime(2026, 11, 3),
            updatedAt: DateTime(2026, 11, 3),
          ),
        );
  });
  tearDown(() => db.close());

  WeatherRepository repo(FakeAdapter adapter) => WeatherRepository(
    db,
    OpenMeteoApi(
      Dio()..httpClientAdapter = adapter,
      clock: () => DateTime(2026, 11, 3, 8),
    ),
  );

  final body = jsonDecode(
    File('test/fixtures/open_meteo_forecast.json').readAsStringSync(),
  ) as Map<String, dynamic>;

  test('refresh menyimpan snapshot dan meng-upsert (satu baris)', () async {
    final r = repo(FakeAdapter(body));
    expect(await r.refresh('s1'), isTrue);
    expect(await r.refresh('s1'), isTrue);

    final rows = await db.select(db.weatherSnapshots).get();
    expect(rows, hasLength(1));
    expect(rows.single.weatherCode, 61);
  });

  test('error jaringan → false tanpa melempar, tanpa snapshot', () async {
    final adapter = FakeAdapter(
      {},
      error: DioException(
        requestOptions: RequestOptions(),
        type: DioExceptionType.connectionTimeout,
      ),
    );
    expect(await repo(adapter).refresh('s1'), isFalse);
    expect(await db.select(db.weatherSnapshots).get(), isEmpty);
  });

  test('sesi tidak ada → false', () async {
    expect(await repo(FakeAdapter(body)).refresh('nope'), isFalse);
  });
}
