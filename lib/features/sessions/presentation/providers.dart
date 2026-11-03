import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/services/location_service.dart';
import '../data/session_repository.dart';
import '../domain/fishing_session.dart';

final sessionListProvider = StreamProvider<List<FishingSession>>(
  (ref) => ref.watch(sessionRepositoryProvider).watchSessions(),
);

final sessionDetailProvider = StreamProvider.family<FishingSession?, String>(
  (ref, id) => ref.watch(sessionRepositoryProvider).watchSession(id),
);

/// Simpan/hapus sesi dan ambil GPS. Cuaca menyusul di step 8.
class SessionFormController extends AsyncNotifier<void> {
  @override
  FutureOr<void> build() {}

  /// Posisi GPS saat ini; melempar [LocationException] bila gagal.
  /// Tidak mengubah [state] agar tombol Simpan tidak ikut terkunci.
  Future<Coordinates> locate() async =>
      ref.read(locationServiceProvider).currentPosition();

  /// Membuat sesi baru, atau memperbarui [existing] bila ada.
  Future<void> save({
    FishingSession? existing,
    required DateTime startedAt,
    DateTime? endedAt,
    required double latitude,
    required double longitude,
    required String locationName,
    int? rating,
  }) async {
    final repo = ref.read(sessionRepositoryProvider);
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      if (existing == null) {
        await repo.createSession(
          startedAt: startedAt,
          endedAt: endedAt,
          latitude: latitude,
          longitude: longitude,
          locationName: locationName,
          rating: rating,
        );
      } else {
        await repo.updateSession(
          existing.copyWith(
            startedAt: startedAt,
            endedAt: endedAt,
            latitude: latitude,
            longitude: longitude,
            locationName: locationName,
            rating: rating,
          ),
        );
      }
    });
  }

  Future<void> delete(String id) async {
    final repo = ref.read(sessionRepositoryProvider);
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => repo.deleteSession(id));
  }
}

final sessionFormControllerProvider =
    AsyncNotifierProvider<SessionFormController, void>(
      SessionFormController.new,
    );
