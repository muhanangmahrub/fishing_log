import 'package:fishing_log/features/sessions/domain/catch_entry.dart';
import 'package:fishing_log/features/sessions/domain/fishing_session.dart';
import 'package:fishing_log/features/stats/domain/session_stats.dart';
import 'package:fishing_log/features/weather/domain/weather_snapshot.dart';
import 'package:flutter_test/flutter_test.dart';

final _t0 = DateTime(2026, 1, 1);

CatchEntry _catch(
  String sessionId,
  String species, {
  String? bait,
  String? rig,
  double? length,
  double? weight,
}) => CatchEntry(
  id: '$sessionId-$species-${bait ?? ''}-${rig ?? ''}-$length-$weight',
  sessionId: sessionId,
  speciesId: species.hashCode,
  speciesName: species,
  baitName: bait,
  rigName: rig,
  lengthCm: length,
  weightKg: weight,
  caughtAt: _t0,
);

WeatherSnapshot _weather(String id, {int code = 0, double pressure = 1010}) =>
    WeatherSnapshot(
      sessionId: id,
      fetchedAt: _t0,
      temperatureC: 30,
      apparentTempC: 33,
      humidity: 70,
      pressureHpa: pressure,
      windSpeedKmh: 8,
      windDirectionDeg: 90,
      cloudCover: 40,
      precipitationMm: 0,
      weatherCode: code,
      rawJson: '{}',
    );

FishingSession _session(
  String id, {
  DateTime? at,
  String? location,
  List<CatchEntry> catches = const [],
  WeatherSnapshot? weather,
}) => FishingSession(
  id: id,
  startedAt: at ?? DateTime(2026, 1, 1, 8),
  latitude: -6.2,
  longitude: 106.8,
  locationName: location,
  createdAt: _t0,
  updatedAt: _t0,
  catches: catches,
  weather: weather,
);

StatGroup _group(List<StatGroup> groups, String label) =>
    groups.singleWhere((g) => g.label == label);

void main() {
  test('input kosong menghasilkan statistik kosong', () {
    final s = computeStats(const []);
    expect(s.totalSessions, 0);
    expect(s.blankSessions, 0);
    expect(s.totalCatches, 0);
    expect(s.byTimeOfDay, isEmpty);
    expect(s.byWeather, isEmpty);
    expect(s.byLocation, isEmpty);
    expect(s.bySpecies, isEmpty);
    expect(s.biggestBySpecies, isEmpty);
    expect(s.skippedNoWeather, 0);
  });

  test('ringkasan menghitung sesi, boncos, dan total ikan', () {
    final s = computeStats([
      _session('a', catches: [_catch('a', 'Nila'), _catch('a', 'Lele')]),
      _session('b'),
      _session('c', catches: [_catch('c', 'Nila')]),
    ]);
    expect(s.totalSessions, 3);
    expect(s.blankSessions, 1);
    expect(s.totalCatches, 3);
  });

  test('sesi boncos ikut menurunkan rata-rata', () {
    final s = computeStats([
      _session(
        'a',
        at: DateTime(2026, 1, 1, 8),
        catches: [_catch('a', 'Nila'), _catch('a', 'Nila'), _catch('a', 'X')],
      ),
      _session('b', at: DateTime(2026, 1, 2, 9)),
    ]);
    final pagi = _group(s.byTimeOfDay, 'Pagi');
    expect(pagi.sampleSessions, 2);
    expect(pagi.totalCatches, 3);
    expect(pagi.averageCatches, 1.5);
  });

  test('batas jam: 07:00 masuk Pagi, 06:59 masuk Subuh', () {
    String groupOf(int h, int m) {
      final s = computeStats([_session('a', at: DateTime(2026, 1, 1, h, m))]);
      return s.byTimeOfDay.single.label;
    }

    expect(groupOf(7, 0), 'Pagi');
    expect(groupOf(6, 59), 'Subuh');
    expect(groupOf(0, 0), 'Dini hari');
    expect(groupOf(4, 0), 'Subuh');
    expect(groupOf(11, 0), 'Siang');
    expect(groupOf(15, 0), 'Sore');
    expect(groupOf(18, 0), 'Malam');
    expect(groupOf(23, 59), 'Malam');
  });

  test('sesi tanpa cuaca dilewati dari cuaca dan tekanan, dan dilaporkan', () {
    final s = computeStats([
      _session('a', weather: _weather('a', code: 61, pressure: 1005)),
      _session('b'),
      _session('c'),
    ]);
    expect(s.skippedNoWeather, 2);
    expect(s.byWeather.single.label, 'Hujan ringan');
    expect(s.byWeather.single.sampleSessions, 1);
    expect(s.byPressure.single.sampleSessions, 1);
    // Kelompok lain tetap menghitung semua sesi.
    expect(s.byTimeOfDay.single.sampleSessions, 3);
  });

  test('batas tekanan: 1008 dan 1012 masuk Sedang', () {
    String groupOf(double hpa) =>
        computeStats([_session('a', weather: _weather('a', pressure: hpa))])
            .byPressure
            .single
            .label;

    expect(groupOf(1007.9), startsWith('Rendah'));
    expect(groupOf(1008), startsWith('Sedang'));
    expect(groupOf(1012), startsWith('Sedang'));
    expect(groupOf(1012.1), startsWith('Tinggi'));
  });

  test('kode cuaca dengan label sama digabung', () {
    final s = computeStats([
      _session('a', weather: _weather('a', code: 51)),
      _session('b', weather: _weather('b', code: 53)),
    ]);
    expect(s.byWeather.single.label, 'Gerimis');
    expect(s.byWeather.single.sampleSessions, 2);
  });

  test(
    'nama lokasi beda huruf digabung, tampil dengan tulisan asli pertama',
    () {
      final s = computeStats([
        _session('a', location: ' Muara Angke ', catches: [_catch('a', 'X')]),
        _session('b', location: 'muara angke'),
        _session('c', location: '   '),
        _session('d'),
      ]);
      expect(s.byLocation, hasLength(1));
      expect(s.byLocation.single.label, 'Muara Angke');
      expect(s.byLocation.single.sampleSessions, 2);
      expect(s.byLocation.single.totalCatches, 1);
    },
  );

  test('umpan dan rig null diabaikan; jumlah per tangkapan', () {
    final s = computeStats([
      _session(
        'a',
        catches: [
          _catch('a', 'Nila', bait: 'Pelet', rig: 'Dasaran'),
          _catch('a', 'Nila', bait: 'Pelet'),
          _catch('a', 'Lele'),
        ],
      ),
    ]);
    expect(s.byBait.map((e) => (e.label, e.count)), [('Pelet', 2)]);
    expect(s.byRig.map((e) => (e.label, e.count)), [('Dasaran', 1)]);
    expect(s.bySpecies.map((e) => (e.label, e.count)), [
      ('Nila', 2),
      ('Lele', 1),
    ]);
  });

  test('ukuran terbesar per spesies; spesies tanpa ukuran dilewati', () {
    final s = computeStats([
      _session(
        'a',
        catches: [
          _catch('a', 'Nila', length: 20, weight: 0.5),
          _catch('a', 'Nila', length: 25),
          _catch('a', 'Nila', weight: 0.9),
          _catch('a', 'Lele'),
        ],
      ),
    ]);
    expect(s.biggestBySpecies, hasLength(1));
    final nila = s.biggestBySpecies.single;
    expect(nila.speciesName, 'Nila');
    expect(nila.maxLengthCm, 25);
    expect(nila.maxWeightKg, 0.9);
  });

  test('urutan: rata-rata menurun, lalu jumlah sesi', () {
    final s = computeStats([
      // Pagi: 2 sesi, rata-rata 1.
      _session('a', at: DateTime(2026, 1, 1, 8), catches: [_catch('a', 'X')]),
      _session('b', at: DateTime(2026, 1, 2, 8), catches: [_catch('b', 'X')]),
      // Sore: 1 sesi, rata-rata 1 → kalah dari Pagi karena sampel lebih sedikit.
      _session('c', at: DateTime(2026, 1, 3, 16), catches: [_catch('c', 'X')]),
      // Malam: 1 sesi, rata-rata 3 → paling atas.
      _session(
        'd',
        at: DateTime(2026, 1, 4, 20),
        catches: [_catch('d', 'X'), _catch('d', 'X'), _catch('d', 'X')],
      ),
    ]);
    expect(s.byTimeOfDay.map((g) => g.label), ['Malam', 'Pagi', 'Sore']);
  });

  test('isLowSample bila sampel kurang dari 3 sesi', () {
    final s = computeStats([
      for (var i = 0; i < 3; i++) _session('p$i', at: DateTime(2026, 1, 1, 8)),
      _session('s', at: DateTime(2026, 1, 1, 16)),
    ]);
    expect(_group(s.byTimeOfDay, 'Pagi').isLowSample, isFalse);
    expect(_group(s.byTimeOfDay, 'Sore').isLowSample, isTrue);
  });
}
