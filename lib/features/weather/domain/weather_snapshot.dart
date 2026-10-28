import 'package:freezed_annotation/freezed_annotation.dart';

part 'weather_snapshot.freezed.dart';

@freezed
abstract class WeatherSnapshot with _$WeatherSnapshot {
  const factory WeatherSnapshot({
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
  }) = _WeatherSnapshot;
}
