# Fishing Log — Spesifikasi MVP

## 1. Ruang lingkup MVP
- Buat/edit/hapus sesi mancing: waktu mulai–selesai, lokasi GPS (auto + nama spot manual), catatan.
- Per sesi, banyak tangkapan: jenis ikan, panjang/berat (opsional), umpan, rangkaian (rig), foto, waktu, dilepas/dibawa.
- Hasil sesi: jumlah tangkapan (turunan), rating 1–5, status "boncos" (0 ikan) tetap tercatat.
- Cuaca otomatis dari Open-Meteo saat sesi dibuat (berdasarkan lat/lon + waktu); disimpan sebagai snapshot, bisa di-refresh manual.
- Riwayat: daftar sesi terbaru, detail sesi, filter sederhana (jenis ikan, rentang tanggal).
- Offline-first; cuaca gagal → sesi tetap tersimpan, cuaca bisa diambil ulang.
- Di luar MVP: akun/sync cloud, peta, statistik lanjutan, pasang-surut, sharing.

## 2. Stack & paket
| Kebutuhan | Paket |
|---|---|
| State management | `flutter_riverpod` + `riverpod_annotation` (codegen) |
| Database lokal | `drift` + `drift_flutter` (SQLite, relasional, reactive stream, migrasi) |
| Model immutable | `freezed` + `json_serializable` |
| HTTP | `dio` |
| GPS | `geolocator` (+ `geocoding` opsional untuk nama tempat) |
| Foto | `image_picker`, `path_provider` (salin ke dir dokumen app), `flutter_image_compress` |
| Navigasi | `go_router` |
| Util | `intl`, `uuid` |
| Dev | `build_runner`, `riverpod_generator`, `drift_dev`, `freezed`, `mocktail` |

Alasan: Riverpod mudah dites & cocok dengan stream Drift; Drift dipilih vs Hive/Isar karena data relasional (sesi→tangkapan) dan query filter riwayat.

## 3. Struktur folder (feature-first)
```
lib/
  main.dart
  app/            app.dart, router.dart, theme.dart
  core/
    db/           app_database.dart, tables.dart, converters.dart
    network/      dio_provider.dart
    services/     location_service.dart, photo_storage_service.dart
    utils/        result.dart, formatters.dart
  features/
    sessions/
      data/       session_repository.dart (+ DAO)
      domain/     fishing_session.dart, catch_entry.dart
      presentation/ session_list_screen.dart, session_detail_screen.dart,
                    session_form_screen.dart, catch_form_sheet.dart, providers.dart
    weather/
      data/       open_meteo_api.dart, weather_repository.dart
      domain/     weather_snapshot.dart, weather_code.dart (WMO → label/ikon)
    master_data/  (spesies, umpan, rig: daftar pilihan + autocomplete)
test/  mirror lib/ (unit repo, API parsing dengan JSON fixture, widget form)
docs/SPEC.md
```

## 4. Model data (tabel Drift)
- **sessions**: id (uuid), started_at, ended_at?, latitude, longitude, location_name?, notes?, rating?, created_at, updated_at.
- **catches**: id, session_id (FK, cascade), species_id, bait_id?, rig_id?, length_cm?, weight_kg?, caught_at, released (bool), notes?.
- **catch_photos**: id, catch_id (FK), file_path (relatif ke dir dokumen), created_at. (Foto sesi tanpa ikan: `session_photos` serupa, atau catch_id nullable + session_id.)
- **weather_snapshots**: session_id (PK/FK), fetched_at, temperature_c, apparent_temp_c, humidity, pressure_hpa, wind_speed_kmh, wind_direction_deg, cloud_cover, precipitation_mm, weather_code, raw_json.
- **species / baits / rigs**: id, name (unique), is_custom — lookup agar autocomplete & filter konsisten; seed beberapa nilai default.
- Domain: `FishingSession { ..., List<CatchEntry> catches, WeatherSnapshot? weather }`, `catchCount` dihitung.

## 5. Integrasi Open-Meteo
- Endpoint: `https://api.open-meteo.com/v1/forecast?latitude=..&longitude=..&hourly=temperature_2m,relative_humidity_2m,apparent_temperature,precipitation,weather_code,pressure_msl,cloud_cover,wind_speed_10m,wind_direction_10m&timezone=auto&start_date=D&end_date=D` lalu ambil jam terdekat `started_at`.
- Sesi > ~3 bulan lalu: pakai `https://archive-api.open-meteo.com/v1/archive` (parameter sama). Tanpa API key.
- Timeout 10 dtk; error → snapshot null + tombol "Ambil cuaca".
- `weather_code` dipetakan ke label Indonesia (Cerah, Berawan, Hujan, …).

## 6. State management (Riverpod)
- `appDatabaseProvider`, `sessionRepositoryProvider`, `weatherRepositoryProvider`, `locationServiceProvider`.
- `sessionListProvider(filter)` → `StreamProvider` dari `watchSessions()` Drift.
- `sessionDetailProvider(id)` → stream sesi + tangkapan + cuaca.
- `SessionFormController` (AsyncNotifier): ambil GPS → simpan sesi → trigger fetch cuaca (non-blocking).
- Repository mengembalikan domain model; UI tidak menyentuh Drift langsung.

## 7. Izin & platform
- Android: `ACCESS_FINE_LOCATION`, `CAMERA`, `INTERNET`. iOS: `NSLocationWhenInUseUsageDescription`, `NSCameraUsageDescription`, `NSPhotoLibraryUsageDescription`.
- Target utama Android + iOS; desktop/web tidak didukung di MVP.

## 8. Urutan pengerjaan
1. Setup: dependensi, lints, `go_router`, tema, struktur folder, `ProviderScope`.
2. Database Drift: tabel, seed spesies/umpan/rig, test DAO in-memory.
3. Repository + domain model sesi/tangkapan (+ unit test).
4. UI riwayat (list kosong) + form sesi tanpa GPS/foto → CRUD jalan end-to-end.
5. GPS: `LocationService` + izin, auto-isi koordinat, fallback input manual.
6. Tangkapan: form bottom sheet dengan autocomplete spesies/umpan/rig.
7. Foto: pick/kamera, kompres, simpan ke dir app, tampilkan thumbnail, hapus file saat entri dihapus.
8. Cuaca: client Open-Meteo + parsing (test dgn fixture), snapshot otomatis, tombol refresh, kartu cuaca di detail.
9. Riwayat lanjutan: filter spesies & tanggal, ringkasan per sesi.
10. Polish: empty/error states, konfirmasi hapus, ikon app, uji di perangkat nyata.

## 9. Definisi selesai MVP
- Sesi bisa dibuat offline dengan GPS + foto, cuaca terisi otomatis saat online.
- Data bertahan setelah app ditutup; riwayat terurut & bisa difilter.
- `flutter analyze` bersih, `flutter test` hijau.

