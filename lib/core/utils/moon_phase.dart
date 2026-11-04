/// Kelompok fase bulan kasar (4 kelompok), dihitung lokal tanpa paket.
enum MoonPhaseGroup {
  newMoon('Bulan baru'),
  waxing('Menuju purnama'),
  full('Purnama'),
  waning('Menuju bulan baru');

  const MoonPhaseGroup(this.label);

  final String label;
}

/// Panjang rata-rata satu siklus sinodik (hari).
const synodicMonthDays = 29.530588853;

/// Bulan baru acuan: 2000-01-06 18:14 UTC.
final _referenceNewMoon = DateTime.utc(2000, 1, 6, 18, 14);

/// Setengah siklus (hari): umur bulan saat purnama.
const _halfCycleDays = 14.77;

/// Jendela (hari) di sekitar bulan baru / purnama.
const _windowDays = 1.85;

/// Umur bulan (hari sejak bulan baru terakhir), rentang [0, 29.53).
double moonAgeDays(DateTime at) {
  final days =
      at.toUtc().difference(_referenceNewMoon).inMicroseconds /
      Duration.microsecondsPerDay;
  final age = days % synodicMonthDays;
  return age < 0 ? age + synodicMonthDays : age;
}

/// Kelompok fase bulan untuk [at]. Pendekatan rata-rata: selisih terhadap
/// fase sebenarnya bisa sekitar setengah hari.
MoonPhaseGroup moonPhaseOf(DateTime at) {
  final age = moonAgeDays(at);
  if (age < _windowDays || age > synodicMonthDays - _windowDays) {
    return MoonPhaseGroup.newMoon;
  }
  if ((age - _halfCycleDays).abs() <= _windowDays) return MoonPhaseGroup.full;
  return age < _halfCycleDays ? MoonPhaseGroup.waxing : MoonPhaseGroup.waning;
}
