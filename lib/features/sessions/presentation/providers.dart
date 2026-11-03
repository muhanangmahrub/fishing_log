import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/services/location_service.dart';
import '../../weather/data/weather_repository.dart';
import '../data/session_repository.dart';
import '../domain/fishing_session.dart';

final sessionListProvider = StreamProvider<List<FishingSession>>(
  (ref) => ref.watch(sessionRepositoryProvider).watchSessions(),
);

final sessionDetailProvider = StreamProvider.family<FishingSession?, String>(
  (ref, id) => ref.watch(sessionRepositoryProvider).watchSession(id),
);

/// Simpan/hapus sesi dan ambil GPS. Setelah tersimpan, cuaca diambil di latar belakang.
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
        final id = await repo.createSession(
          startedAt: startedAt,
          endedAt: endedAt,
          latitude: latitude,
          longitude: longitude,
          locationName: locationName,
          rating: rating,
        );
        _fetchWeather(id);
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
        // Waktu/lokasi berubah atau cuaca belum ada → ambil ulang.
        final changed =
            existing.weather == null ||
            existing.startedAt != startedAt ||
            existing.latitude != latitude ||
            existing.longitude != longitude;
        if (changed) _fetchWeather(existing.id);
      }
    });
  }

  /// Non-blocking; `refresh` tidak pernah melempar.
  void _fetchWeather(String sessionId) =>
      unawaited(ref.read(weatherRepositoryProvider).refresh(sessionId));

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
