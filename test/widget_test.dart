import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fishing_log/app/app.dart';

void main() {
  testWidgets('app menampilkan placeholder Riwayat', (tester) async {
    await tester.pumpWidget(const ProviderScope(child: FishingLogApp()));
    await tester.pumpAndSettle();

    expect(find.text('Riwayat'), findsOneWidget);
  });
}
