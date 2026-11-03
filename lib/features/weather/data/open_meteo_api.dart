import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/network/dio_provider.dart';
import '../domain/weather_snapshot.dart';

const _forecastUrl = 'https://api.open-meteo.com/v1/forecast';
const _archiveUrl = 'https://archive-api.open-meteo.com/v1/archive';

/// Sesi lebih tua dari ini memakai endpoint archive (SPEC §5).
const archiveThreshold = Duration(days: 90);

const _hourlyFields = [
  'temperature_2m',
  'relative_humidity_2m',
  'apparent_temperature',
  'precipitation',
  'weather_code',
  'pressure_msl',
  'cloud_cover',
  'wind_speed_10m',
  'wind_direction_10m',
];

class WeatherException implements Exception {
  const WeatherException(this.message);

  final String message;

  @override
  String toString() => 'WeatherException: $message';
}

class OpenMeteoApi {
  OpenMeteoApi(this._dio, {DateTime Function()? clock})
    : _clock = clock ?? DateTime.now;

  final Dio _dio;
  final DateTime Function() _clock;

  /// Mengambil cuaca jam terdekat dengan [startedAt]. Melempar
  /// [DioException] (jaringan) atau [WeatherException] (data tak lengkap).
  Future<WeatherSnapshot> fetch({
    required String sessionId,
    required double latitude,
    required double longitude,
    required DateTime startedAt,
  }) async {
    final now = _clock();
    final url = now.difference(startedAt) > archiveThreshold
        ? _archiveUrl
        : _forecastUrl;
    final date = _isoDate(startedAt);
    final response = await _dio.get<Object?>(
      url,
      queryParameters: {
        'latitude': latitude,
        'longitude': longitude,
        'hourly': _hourlyFields.join(','),
        'timezone': 'auto',
        'start_date': date,
        'end_date': date,
      },
    );
    final data = response.data;
    if (data is! Map<String, dynamic>) {
      throw const WeatherException('Respons cuaca tidak valid');
    }
    return parseHourly(
      data,
      sessionId: sessionId,
      at: startedAt,
      fetchedAt: now,
    );
  }
}

/// Memilih entri `hourly` terdekat dengan [at] lalu memetakannya.
///
/// Waktu Open-Meteo (`timezone=auto`) adalah waktu lokal lokasi tanpa offset;
/// dibandingkan dengan jam dinding [at].
WeatherSnapshot parseHourly(
  Map<String, dynamic> json, {
  required String sessionId,
  required DateTime at,
  required DateTime fetchedAt,
}) {
  final hourly = json['hourly'];
  if (hourly is! Map<String, dynamic>) {
    throw const WeatherException('Data hourly tidak ada');
  }
  final times = hourly['time'];
  if (times is! List || times.isEmpty) {
    throw const WeatherException('Data hourly kosong');
  }

  final target = DateTime.utc(at.year, at.month, at.day, at.hour, at.minute);
  var best = 0;
  Duration? bestGap;
  for (var i = 0; i < times.length; i++) {
    final t = DateTime.tryParse('${times[i]}Z');
    if (t == null) continue;
    final gap = t.difference(target).abs();
    if (bestGap == null || gap < bestGap) {
      best = i;
      bestGap = gap;
    }
  }
  if (bestGap == null) throw const WeatherException('Format waktu tidak valid');

  num value(String field) {
    final list = hourly[field];
    final v = list is List && best < list.length ? list[best] : null;
    if (v is! num) throw WeatherException('Data "$field" tidak tersedia');
    return v;
  }

  final temperature = value('temperature_2m');
  final apparent = value('apparent_temperature');
  final humidity = value('relative_humidity_2m');
  final pressure = value('pressure_msl');
  final windSpeed = value('wind_speed_10m');
  final windDir = value('wind_direction_10m');
  final cloud = value('cloud_cover');
  final precipitation = value('precipitation');
  final code = value('weather_code');

  return WeatherSnapshot(
    sessionId: sessionId,
    fetchedAt: fetchedAt,
    temperatureC: temperature.toDouble(),
    apparentTempC: apparent.toDouble(),
    humidity: humidity.toDouble(),
    pressureHpa: pressure.toDouble(),
    windSpeedKmh: windSpeed.toDouble(),
    windDirectionDeg: windDir.toDouble(),
    cloudCover: cloud.toDouble(),
    precipitationMm: precipitation.toDouble(),
    weatherCode: code.toInt(),
    rawJson: jsonEncode({
      'time': times[best],
      for (final f in _hourlyFields) f: (hourly[f] as List)[best],
    }),
  );
}

String _isoDate(DateTime d) =>
    '${d.year.toString().padLeft(4, '0')}-'
    '${d.month.toString().padLeft(2, '0')}-'
    '${d.day.toString().padLeft(2, '0')}';

final openMeteoApiProvider = Provider<OpenMeteoApi>(
  (ref) => OpenMeteoApi(ref.watch(dioProvider)),
);
