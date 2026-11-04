import 'package:fishing_log/core/utils/moon_phase.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('purnama 2025-03-14 07:00 UTC', () {
    expect(moonPhaseOf(DateTime.utc(2025, 3, 14, 7)), MoonPhaseGroup.full);
  });

  test('bulan baru 2025-03-29 11:00 UTC', () {
    expect(moonPhaseOf(DateTime.utc(2025, 3, 29, 11)), MoonPhaseGroup.newMoon);
  });

  test('menuju purnama dan menuju bulan baru', () {
    // ~7 hari setelah bulan baru.
    expect(moonPhaseOf(DateTime.utc(2025, 3, 7)), MoonPhaseGroup.waxing);
    // ~7 hari setelah purnama.
    expect(moonPhaseOf(DateTime.utc(2025, 3, 21)), MoonPhaseGroup.waning);
  });

  test('waktu lokal dikonversi ke UTC sebelum dihitung', () {
    final utc = DateTime.utc(2025, 3, 14, 7);
    expect(moonAgeDays(utc.toLocal()), moonAgeDays(utc));
  });

  test('tanggal sebelum tahun 2000 menghasilkan umur non-negatif', () {
    final age = moonAgeDays(DateTime.utc(1990, 1, 1));
    expect(age, inInclusiveRange(0, synodicMonthDays));
  });
}
