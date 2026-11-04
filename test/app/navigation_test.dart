import 'package:drift/native.dart';
import 'package:fishing_log/app/app.dart';
import 'package:fishing_log/core/db/app_database.dart';
import 'package:fishing_log/core/services/location_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockLocationService extends Mock implements LocationService {}

/// Drift memakai I/O async sungguhan, yang tidak jalan di FakeAsync.
Future<void> settle(WidgetTester tester) async {
  await tester.runAsync(
    () => Future<void>.delayed(const Duration(milliseconds: 100)),
  );
  await tester.pumpAndSettle();
}

void main() {
  testWidgets('empat tab bisa dipilih; form sesi tampil tanpa bottom nav', (
    tester,
  ) async {
    final db = AppDatabase(NativeDatabase.memory());
    addTearDown(db.close);
    final location = MockLocationService();
    when(location.currentPosition)
        .thenAnswer((_) async => const Coordinates(-6.2, 106.8));

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          appDatabaseProvider.overrideWithValue(db),
          locationServiceProvider.overrideWithValue(location),
        ],
        child: const FishingLogApp(),
      ),
    );
    await settle(tester);

    final nav = find.byType(NavigationBar);
    expect(nav, findsOneWidget);
    expect(find.text('Belum ada sesi. Tekan + untuk mulai.'), findsOneWidget);

    for (final (label, body) in [
      ('Peta', 'Peta segera hadir.'),
      ('Spot', 'Daftar spot segera hadir.'),
      ('Statistik', 'Statistik segera hadir.'),
    ]) {
      await tester.tap(find.descendant(of: nav, matching: find.text(label)));
      await settle(tester);
      expect(find.text(body), findsOneWidget, reason: 'tab $label');
    }

    await tester.tap(find.descendant(of: nav, matching: find.text('Riwayat')));
    await settle(tester);
    expect(find.textContaining('Belum ada sesi'), findsOneWidget);

    // Sesi baru dibuka layar penuh, tanpa bottom nav.
    await tester.tap(find.byType(FloatingActionButton));
    await settle(tester);
    expect(find.text('Sesi baru'), findsOneWidget);
    expect(find.byType(NavigationBar), findsNothing);

    // Lepas stream Drift agar timer penutupnya selesai sebelum test berakhir.
    await tester.pumpWidget(const SizedBox());
    await tester.pump(Duration.zero);
  });
}
