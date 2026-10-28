import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/session_repository.dart';
import '../domain/fishing_session.dart';

final sessionListProvider = StreamProvider<List<FishingSession>>(
  (ref) => ref.watch(sessionRepositoryProvider).watchSessions(),
);

final sessionDetailProvider =
    StreamProvider.family<FishingSession?, String>(
  (ref, id) => ref.watch(sessionRepositoryProvider).watchSession(id),
);

/// Simpan/hapus sesi. GPS dan cuaca menyusul di step 5 dan 8.
class SessionFormController extends AsyncNotifier<void> {
  @override
  FutureOr<void> build() {}

  /// Membuat sesi baru, atau memperbarui [existing] bila ada.
  Future<void> save({
    FishingSession? existing,
    required DateTime startedAt,
    DateTime? endedAt,
    required String locationName,
    int? rating,
  }) async {
    final repo = ref.read(sessionRepositoryProvider);
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      if (existing == null) {
        // Koordinat belum diisi sampai LocationService (step 5).
        await repo.createSession(
          startedAt: startedAt,
          endedAt: endedAt,
          latitude: 0,
          longitude: 0,
          locationName: locationName,
          rating: rating,
        );
      } else {
        await repo.updateSession(existing.copyWith(
          startedAt: startedAt,
          endedAt: endedAt,
          locationName: locationName,
          rating: rating,
        ));
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
