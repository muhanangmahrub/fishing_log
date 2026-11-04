import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/utils/moon_phase.dart';
import '../../sessions/domain/fishing_session.dart';
import '../../weather/domain/weather_code.dart';

part 'session_stats.freezed.dart';

/// Kelompok dengan sampel kurang dari ini ditandai "data sedikit".
const lowSampleThreshold = 3;

/// Statistik per sesi untuk satu kelompok (mis. "Pagi"). Sesi boncos ikut
/// dihitung, jadi [averageCatches] tidak bias ke sesi yang berhasil.
@freezed
abstract class StatGroup with _$StatGroup {
  const StatGroup._();

  const factory StatGroup({
    required String label,
    required int sampleSessions,
    required int totalCatches,
  }) = _StatGroup;

  double get averageCatches =>
      sampleSessions == 0 ? 0 : totalCatches / sampleSessions;

  bool get isLowSample => sampleSessions < lowSampleThreshold;
}

/// Jumlah tangkapan per label (spesies, umpan, rig).
@freezed
abstract class CountStat with _$CountStat {
  const factory CountStat({required String label, required int count}) =
      _CountStat;
}

/// Ukuran terbesar yang tercatat untuk satu spesies.
@freezed
abstract class SizeRecord with _$SizeRecord {
  const factory SizeRecord({
    required String speciesName,
    double? maxLengthCm,
    double? maxWeightKg,
  }) = _SizeRecord;
}

@freezed
abstract class SessionStats with _$SessionStats {
  const factory SessionStats({
    required int totalSessions,
    required int blankSessions,
    required int totalCatches,

    // Per sesi: rata-rata menurun, lalu jumlah sesi.
    required List<StatGroup> byTimeOfDay,
    required List<StatGroup> byWeather,
    required List<StatGroup> byPressure,
    required List<StatGroup> byMoon,
    required List<StatGroup> byLocation,

    /// Sesi tanpa cuaca: tidak masuk [byWeather] dan [byPressure].
    required int skippedNoWeather,

    // Per tangkapan: jumlah menurun.
    required List<CountStat> bySpecies,
    required List<CountStat> byBait,
    required List<CountStat> byRig,
    required List<SizeRecord> biggestBySpecies,
  }) = _SessionStats;
}

SessionStats computeStats(List<FishingSession> sessions) {
  final timeOfDay = _GroupBuilder();
  final weather = _GroupBuilder();
  final pressure = _GroupBuilder();
  final moon = _GroupBuilder();
  final location = _GroupBuilder();
  final species = <String, int>{};
  final baits = <String, int>{};
  final rigs = <String, int>{};
  final sizes = <String, ({double? length, double? weight})>{};

  var blank = 0;
  var total = 0;
  var skippedNoWeather = 0;

  for (final s in sessions) {
    final n = s.catchCount;
    total += n;
    if (s.isBlank) blank++;

    timeOfDay.add(_timeOfDayLabel(s.startedAt), n);
    moon.add(moonPhaseOf(s.startedAt).label, n);

    final name = s.locationName?.trim();
    if (name != null && name.isNotEmpty) {
      location.add(name.toLowerCase(), n, display: name);
    }

    final w = s.weather;
    if (w == null) {
      skippedNoWeather++;
    } else {
      weather.add(describeWeatherCode(w.weatherCode).label, n);
      pressure.add(_pressureLabel(w.pressureHpa), n);
    }

    for (final c in s.catches) {
      species[c.speciesName] = (species[c.speciesName] ?? 0) + 1;
      final bait = c.baitName;
      if (bait != null) baits[bait] = (baits[bait] ?? 0) + 1;
      final rig = c.rigName;
      if (rig != null) rigs[rig] = (rigs[rig] ?? 0) + 1;

      final prev = sizes[c.speciesName];
      sizes[c.speciesName] = (
        length: _maxOf(prev?.length, c.lengthCm),
        weight: _maxOf(prev?.weight, c.weightKg),
      );
    }
  }

  return SessionStats(
    totalSessions: sessions.length,
    blankSessions: blank,
    totalCatches: total,
    byTimeOfDay: timeOfDay.build(),
    byWeather: weather.build(),
    byPressure: pressure.build(),
    byMoon: moon.build(),
    byLocation: location.build(),
    skippedNoWeather: skippedNoWeather,
    bySpecies: _counts(species),
    byBait: _counts(baits),
    byRig: _counts(rigs),
    biggestBySpecies: [
      for (final e in sizes.entries)
        if (e.value.length != null || e.value.weight != null)
          SizeRecord(
            speciesName: e.key,
            maxLengthCm: e.value.length,
            maxWeightKg: e.value.weight,
          ),
    ]..sort((a, b) => a.speciesName.compareTo(b.speciesName)),
  );
}

double? _maxOf(double? a, double? b) {
  if (a == null) return b;
  if (b == null) return a;
  return a > b ? a : b;
}

List<CountStat> _counts(Map<String, int> m) =>
    [for (final e in m.entries) CountStat(label: e.key, count: e.value)]
      ..sort((a, b) {
        final byCount = b.count.compareTo(a.count);
        return byCount != 0 ? byCount : a.label.compareTo(b.label);
      });

/// Dini hari 00–04, Subuh 04–07, Pagi 07–11, Siang 11–15, Sore 15–18,
/// Malam 18–24 (jam dinding lokal sesi).
String _timeOfDayLabel(DateTime t) {
  final h = t.hour;
  if (h < 4) return 'Dini hari';
  if (h < 7) return 'Subuh';
  if (h < 11) return 'Pagi';
  if (h < 15) return 'Siang';
  if (h < 18) return 'Sore';
  return 'Malam';
}

/// < 1008, 1008–1012 (inklusif), > 1012 hPa.
String _pressureLabel(double hpa) {
  if (hpa < 1008) return 'Rendah (< 1008 hPa)';
  if (hpa <= 1012) return 'Sedang (1008–1012 hPa)';
  return 'Tinggi (> 1012 hPa)';
}

class _GroupBuilder {
  final _sessions = <String, int>{};
  final _catches = <String, int>{};
  final _display = <String, String>{};

  /// [key] dipakai untuk menggabungkan; [display] (bila ada) adalah tulisan
  /// asli pertama yang ditampilkan.
  void add(String key, int catches, {String? display}) {
    _sessions[key] = (_sessions[key] ?? 0) + 1;
    _catches[key] = (_catches[key] ?? 0) + catches;
    _display.putIfAbsent(key, () => display ?? key);
  }

  List<StatGroup> build() {
    final groups = [
      for (final key in _sessions.keys)
        StatGroup(
          label: _display[key]!,
          sampleSessions: _sessions[key]!,
          totalCatches: _catches[key]!,
        ),
    ];
    groups.sort((a, b) {
      final byAvg = b.averageCatches.compareTo(a.averageCatches);
      if (byAvg != 0) return byAvg;
      final bySamples = b.sampleSessions.compareTo(a.sampleSessions);
      return bySamples != 0 ? bySamples : a.label.compareTo(b.label);
    });
    return groups;
  }
}
