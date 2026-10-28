import 'package:drift/native.dart';
import 'package:fishing_log/app/app.dart';
import 'package:fishing_log/core/db/app_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

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

    await tester.pumpWidget(ProviderScope(
      overrides: [appDatabaseProvider.overrideWithValue(db)],
      child: const FishingLogApp(),
    ));
    await settle(tester);
    expect(find.textContaining('Belum ada sesi'), findsOneWidget);

    await tester.tap(find.byType(FloatingActionButton));
    await settle(tester);

    await tester.enterText(find.byType(TextFormField), 'Muara Angke');
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
