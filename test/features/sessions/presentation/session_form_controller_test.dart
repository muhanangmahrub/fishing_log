import 'package:drift/native.dart';
import 'package:fishing_log/core/db/app_database.dart';
import 'package:fishing_log/core/services/location_service.dart';
import 'package:fishing_log/features/sessions/presentation/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockLocationService extends Mock implements LocationService {}

void main() {
  late AppDatabase db;
  late MockLocationService location;
  late ProviderContainer container;

  setUp(() {
    db = AppDatabase(NativeDatabase.memory());
    location = MockLocationService();
    container = ProviderContainer(
      overrides: [
        appDatabaseProvider.overrideWithValue(db),
        locationServiceProvider.overrideWithValue(location),
      ],
    );
  });
  tearDown(() async {
    container.dispose();
    await db.close();
  });

  SessionFormController controller() =>
      container.read(sessionFormControllerProvider.notifier);

  test('locate mengembalikan koordinat dari LocationService', () async {
    when(location.currentPosition)
        .thenAnswer((_) async => const Coordinates(-6.2, 106.8));

    final c = await controller().locate();

    expect(c.latitude, -6.2);
    expect(c.longitude, 106.8);
  });

  test('locate meneruskan LocationException tanpa mengubah state', () async {
    when(location.currentPosition)
        .thenThrow(const LocationException(LocationFailure.denied));

    await expectLater(
      controller().locate(),
      throwsA(
        isA<LocationException>().having(
          (e) => e.failure,
          'failure',
          LocationFailure.denied,
        ),
      ),
    );
    expect(container.read(sessionFormControllerProvider).hasError, isFalse);
  });

  test('save menyimpan koordinat yang diberikan', () async {
    await controller().save(
      startedAt: DateTime(2026, 1, 1, 6),
      latitude: -6.2,
      longitude: 106.8,
      locationName: 'Muara',
    );

    expect(container.read(sessionFormControllerProvider).hasError, isFalse);
    final rows = await db.select(db.sessions).get();
    expect(rows.single.latitude, -6.2);
    expect(rows.single.longitude, 106.8);
  });
}
