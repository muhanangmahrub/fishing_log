import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:fishing_log/features/weather/data/open_meteo_api.dart';
import 'package:fishing_log/features/weather/domain/weather_code.dart';
import 'package:flutter_test/flutter_test.dart';

Map<String, dynamic> fixture(String name) =>
    jsonDecode(File('test/fixtures/$name').readAsStringSync())
        as Map<String, dynamic>;

/// Adapter palsu: tanpa jaringan nyata; merekam URL yang diminta.
class FakeAdapter implements HttpClientAdapter {
  FakeAdapter(this.body, {this.error});

  final Map<String, dynamic> body;
  final DioException? error;
  Uri? requested;

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<List<int>>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    requested = options.uri;
    if (error != null) throw error!;
    return ResponseBody.fromString(
      jsonEncode(body),
      200,
      headers: {
        Headers.contentTypeHeader: [Headers.jsonContentType],
      },
    );
  }

  @override
  void close({bool force = false}) {}
}

void main() {
  final fetchedAt = DateTime(2026, 11, 3, 8);

  group('parseHourly', () {
    test('memilih jam terdekat dan memetakan semua field', () {
      final w = parseHourly(
        fixture('open_meteo_forecast.json'),
        sessionId: 's1',
        at: DateTime(2026, 11, 3, 6, 20),
        fetchedAt: fetchedAt,
      );
      expect(w.sessionId, 's1');
      expect(w.temperatureC, 27.4);
      expect(w.apparentTempC, 31.2);
      expect(w.humidity, 84);
      expect(w.pressureHpa, 1010.2);
      expect(w.windSpeedKmh, 8.1);
      expect(w.windDirectionDeg, 135);
      expect(w.cloudCover, 75);
      expect(w.precipitationMm, 0.2);
      expect(w.weatherCode, 61);
      expect(jsonDecode(w.rawJson)['time'], '2026-11-03T06:00');
    });

    test('06:40 membulat ke jam 07', () {
      final w = parseHourly(
        fixture('open_meteo_forecast.json'),
        sessionId: 's1',
        at: DateTime(2026, 11, 3, 6, 40),
        fetchedAt: fetchedAt,
      );
      expect(w.weatherCode, 80);
    });

    test('nilai null → WeatherException', () {
      expect(
        () => parseHourly(
          fixture('open_meteo_null_hour.json'),
          sessionId: 's1',
          at: DateTime(2026, 11, 3, 6),
          fetchedAt: fetchedAt,
        ),
        throwsA(isA<WeatherException>()),
      );
    });

    test('tanpa hourly → WeatherException', () {
      expect(
        () => parseHourly(
          {},
          sessionId: 's1',
          at: DateTime(2026, 11, 3, 6),
          fetchedAt: fetchedAt,
        ),
        throwsA(isA<WeatherException>()),
      );
    });
  });

  group('OpenMeteoApi.fetch', () {
    Future<Uri?> urlFor(DateTime startedAt) async {
      final adapter = FakeAdapter(fixture('open_meteo_forecast.json'));
      final api = OpenMeteoApi(
        Dio()..httpClientAdapter = adapter,
        clock: () => DateTime(2026, 11, 3, 8),
      );
      await api.fetch(
        sessionId: 's1',
        latitude: -6.25,
        longitude: 106.75,
        startedAt: startedAt,
      );
      return adapter.requested;
    }

    test('sesi baru → forecast', () async {
      final uri = await urlFor(DateTime(2026, 11, 3, 6));
      expect(uri!.host, 'api.open-meteo.com');
      expect(uri.queryParameters['start_date'], '2026-11-03');
      expect(uri.queryParameters['timezone'], 'auto');
    });

    test('sesi >90 hari → archive', () async {
      final uri = await urlFor(DateTime(2026, 6, 1, 6));
      expect(uri!.host, 'archive-api.open-meteo.com');
      expect(uri.queryParameters['start_date'], '2026-06-01');
    });
  });

  group('describeWeatherCode', () {
    test('label Indonesia', () {
      expect(describeWeatherCode(0).label, 'Cerah');
      expect(describeWeatherCode(63).label, 'Hujan sedang');
      expect(describeWeatherCode(95).label, 'Badai petir');
      expect(describeWeatherCode(12345).label, 'Tidak diketahui');
    });
  });
}
