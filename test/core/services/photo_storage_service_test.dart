import 'dart:io';

import 'package:drift/native.dart';
import 'package:fishing_log/core/db/app_database.dart';
import 'package:fishing_log/core/services/photo_storage_service.dart';
import 'package:fishing_log/features/sessions/data/session_repository.dart';
import 'package:fishing_log/features/sessions/domain/catch_entry.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:path/path.dart' as p;

void main() {
  late Directory root;
  late File source;

  setUp(() async {
    root = await Directory.systemTemp.createTemp('photo_test_');
    source = File(p.join(root.path, 'source.jpg'))
      ..writeAsBytesSync([1, 2, 3, 4, 5, 6]);
  });
  tearDown(() => root.delete(recursive: true));

  PhotoStorageService service({ImageCompressor? compressor}) =>
      PhotoStorageService(
        documentsDir: () async => Directory(p.join(root.path, 'docs')),
        compressor: compressor,
      );

  // Kompresor palsa: menulis 2 byte saja ke tujuan.
  Future<String?> fakeCompressor(String src, String dest) async {
    await File(dest).writeAsBytes([9, 9]);
    return dest;
  }

  test(
    'store menyimpan hasil kompresi dan mengembalikan path relatif',
    () async {
      final s = service(compressor: fakeCompressor);
      final rel = await s.store(source.path);

      expect(p.isRelative(rel), isTrue);
      expect(rel, startsWith('photos/'));
      expect(rel, endsWith('.jpg'));
      final file = await s.fileFor(rel);
      expect(file.path, startsWith(p.join(root.path, 'docs')));
      expect(await file.readAsBytes(), [9, 9]);
      expect(source.existsSync(), isTrue, reason: 'file asli tidak disentuh');
    },
  );

  test('kompresi gagal (null atau error) -> file asli disalin', () async {
    for (final compressor in <ImageCompressor>[
      (_, _) async => null,
      (_, _) async => throw Exception('boom'),
    ]) {
      final s = service(compressor: compressor);
      final rel = await s.store(source.path);
      expect(await (await s.fileFor(rel)).readAsBytes(), [1, 2, 3, 4, 5, 6]);
    }
  });

  test('delete menghapus file dan aman dipanggil ulang', () async {
    final s = service(compressor: fakeCompressor);
    final rel = await s.store(source.path);
    final file = await s.fileFor(rel);
    expect(file.existsSync(), isTrue);

    await s.delete(rel);
    expect(file.existsSync(), isFalse);
    await s.delete(rel); // tidak melempar
  });

  group('repository menghapus file foto', () {
    late AppDatabase db;
    late PhotoStorageService s;
    late SessionRepository repo;
    late String sessionId;
    late String catchId;

    setUp(() async {
      db = AppDatabase(NativeDatabase.memory());
      s = service(compressor: fakeCompressor);
      repo = SessionRepository(db, photoStorage: s);
      sessionId = await repo.createSession(
        startedAt: DateTime(2026, 1, 1),
        latitude: 0,
        longitude: 0,
      );
      catchId = await repo.addCatch(
        CatchEntry(
          id: '',
          sessionId: sessionId,
          speciesId: (await db.select(db.species).get()).first.id,
          speciesName: '',
          caughtAt: DateTime(2026, 1, 1, 7),
        ),
      );
    });
    tearDown(() => db.close());

    Future<(String, File)> addPhoto() async {
      final rel = await s.store(source.path);
      final id = await repo.addPhoto(catchId, rel);
      return (id, await s.fileFor(rel));
    }

    test('deletePhoto', () async {
      final (id, file) = await addPhoto();
      await repo.deletePhoto(id);
      expect(file.existsSync(), isFalse);
      expect(await db.select(db.catchPhotos).get(), isEmpty);
    });

    test('deleteCatch', () async {
      final (_, a) = await addPhoto();
      final (_, b) = await addPhoto();
      await repo.deleteCatch(catchId);
      expect(a.existsSync(), isFalse);
      expect(b.existsSync(), isFalse);
    });

    test('deleteSession', () async {
      final (_, file) = await addPhoto();
      await repo.deleteSession(sessionId);
      expect(file.existsSync(), isFalse);
    });

    test('foto muncul di CatchEntry.photos', () async {
      final (_, file) = await addPhoto();
      final session = await repo.watchSession(sessionId).first;
      final photos = session!.catches.single.photos;
      expect(photos, hasLength(1));
      expect((await s.fileFor(photos.single.filePath)).path, file.path);
    });
  });
}
