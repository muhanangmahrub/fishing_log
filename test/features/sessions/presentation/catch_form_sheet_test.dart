import 'package:drift/native.dart';
import 'package:fishing_log/core/db/app_database.dart';
import 'package:fishing_log/features/sessions/data/session_repository.dart';
import 'package:fishing_log/features/sessions/presentation/session_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

Future<void> settle(WidgetTester tester) async {
  await tester.runAsync(
    () => Future<void>.delayed(const Duration(milliseconds: 100)),
  );
  await tester.pumpAndSettle();
}

void main() {
  testWidgets('tambah tangkapan dengan rig custom Autopan', (tester) async {
    final db = AppDatabase(NativeDatabase.memory());
    addTearDown(db.close);
    final sessionId = await tester.runAsync(
      () => SessionRepository(db).createSession(
        startedAt: DateTime(2026, 1, 1, 6),
        latitude: -6.2,
        longitude: 106.8,
        locationName: 'Muara',
      ),
    );

    await tester.pumpWidget(
      ProviderScope(
        overrides: [appDatabaseProvider.overrideWithValue(db)],
        child: MaterialApp(home: SessionDetailScreen(sessionId: sessionId!)),
      ),
    );
    await settle(tester);
    expect(find.text('Boncos'), findsOneWidget);

    await tester.tap(find.text('Tambah tangkapan'));
    await settle(tester);

    // Spesies wajib.
    await tester.tap(find.text('Simpan'));
    await tester.pumpAndSettle();
    expect(find.text('Spesies wajib dipilih'), findsOneWidget);

    await tester.tap(find.byType(DropdownButtonFormField<int>).first);
    await tester.pumpAndSettle();
    await tester.tap(find.text('Kerapu').last);
    await tester.pumpAndSettle();

    await tester.tap(find.byTooltip('Tambah rig baru'));
    await tester.pumpAndSettle();
    await tester.enterText(find.byType(TextField).last, 'Autopan');
    await tester.tap(find.text('Tambah'));
    await settle(tester);

    await tester.enterText(
      find.widgetWithText(TextFormField, 'Panjang (cm)'),
      '42',
    );
    await tester.tap(find.byType(Switch));
    await tester.pump();
    await tester.tap(find.text('Simpan'));
    await settle(tester);

    expect(find.text('Boncos'), findsNothing);
    expect(find.text('Kerapu'), findsOneWidget);
    expect(find.textContaining('Autopan'), findsOneWidget);
    expect(find.textContaining('42.0 cm'), findsOneWidget);
    expect(find.textContaining('Dilepas'), findsOneWidget);

    final rigs = await tester.runAsync(() => db.select(db.rigs).get());
    expect(rigs!.singleWhere((r) => r.name == 'Autopan').isCustom, isTrue);

    await tester.pumpWidget(const SizedBox());
    await tester.pump(Duration.zero);
  });
}
