import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';

enum LocationFailure { serviceDisabled, denied, deniedForever, unavailable }

/// Gagal mengambil lokasi; [message] siap ditampilkan ke pengguna.
class LocationException implements Exception {
  const LocationException(this.failure);

  final LocationFailure failure;

  String get message => switch (failure) {
    LocationFailure.serviceDisabled =>
      'GPS mati. Nyalakan layanan lokasi atau isi koordinat manual.',
    LocationFailure.denied =>
      'Izin lokasi ditolak. Izinkan lokasi atau isi koordinat manual.',
    LocationFailure.deniedForever => 'Izin lokasi ditolak permanen. Aktifkan di pengaturan atau isi koordinat manual.',
    LocationFailure.unavailable =>
      'Lokasi tidak berhasil didapat. Coba lagi atau isi koordinat manual.',
  };

  @override
  String toString() => 'LocationException(${failure.name})';
}

class Coordinates {
  const Coordinates(this.latitude, this.longitude);

  final double latitude;
  final double longitude;
}

class LocationService {
  /// Cek layanan & izin (meminta bila perlu), lalu ambil posisi saat ini.
  /// Melempar [LocationException] bila gagal.
  Future<Coordinates> currentPosition() async {
    if (!await Geolocator.isLocationServiceEnabled()) {
      throw const LocationException(LocationFailure.serviceDisabled);
    }
    var permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    switch (permission) {
      case LocationPermission.denied:
        throw const LocationException(LocationFailure.denied);
      case LocationPermission.deniedForever:
        throw const LocationException(LocationFailure.deniedForever);
      case LocationPermission.whileInUse:
      case LocationPermission.always:
      case LocationPermission.unableToDetermine:
        break;
    }
    try {
      final p = await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.high,
          timeLimit: Duration(seconds: 15),
        ),
      );
      return Coordinates(p.latitude, p.longitude);
    } on Exception {
      throw const LocationException(LocationFailure.unavailable);
    }
  }
}

final locationServiceProvider = Provider<LocationService>(
  (ref) => LocationService(),
);
