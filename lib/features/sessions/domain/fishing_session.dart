import 'package:freezed_annotation/freezed_annotation.dart';

import '../../weather/domain/weather_snapshot.dart';
import 'catch_entry.dart';

part 'fishing_session.freezed.dart';

@freezed
abstract class FishingSession with _$FishingSession {
  const FishingSession._();

  const factory FishingSession({
    required String id,
    required DateTime startedAt,
    DateTime? endedAt,
    required double latitude,
    required double longitude,
    String? locationName,
    String? notes,
    int? rating,
    required DateTime createdAt,
    required DateTime updatedAt,
    @Default([]) List<CatchEntry> catches,
    WeatherSnapshot? weather,
  }) = _FishingSession;

  int get catchCount => catches.length;

  /// Sesi tanpa tangkapan ("boncos") tetap tercatat.
  bool get isBlank => catches.isEmpty;
}
