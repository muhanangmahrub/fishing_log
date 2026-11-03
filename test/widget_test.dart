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
  testWidgets('tambah sesi lalu muncul di list', (tester) async {
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
    expect(find.textContaining('Belum ada sesi'), findsOneWidget);

    await tester.tap(find.byType(FloatingActionButton));
    await settle(tester);

    expect(find.text('-6.200000'), findsOneWidget);
    expect(find.text('106.800000'), findsOneWidget);

    await tester.enterText(find.byType(TextFormField).first, 'Muara Angke');
    await tester.tap(find.byTooltip('Rating 4'));
    await tester.tap(find.text('Simpan'));
    await settle(tester);

    expect(find.text('Muara Angke'), findsOneWidget);
    expect(find.text('Boncos'), findsOneWidget);

    // Lepas stream Drift agar timer penutupnya selesai sebelum test berakhir.
    await tester.pumpWidget(const SizedBox());
    await tester.pump(Duration.zero);
  });
}
