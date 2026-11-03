// ignore_for_file: prefer_initializing_formals
import 'dart:io';

import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';

/// Mengompres [source] ke [dest]; mengembalikan path hasil, atau `null` bila gagal.
typedef ImageCompressor = Future<String?> Function(String source, String dest);

Future<String?> _defaultCompressor(String source, String dest) async {
  final result = await FlutterImageCompress.compressAndGetFile(
    source,
    dest,
    quality: 80,
    minWidth: 1600,
    minHeight: 1600,
    format: CompressFormat.jpeg,
  );
  return result?.path;
}

/// Memilih foto, mengompres, dan menyimpannya di direktori dokumen aplikasi.
/// Yang disimpan ke DB selalu path RELATIF (mis. `photos/<uuid>.jpg`).
class PhotoStorageService {
  PhotoStorageService({
    required Future<Directory> Function() documentsDir,
    ImagePicker? picker,
    ImageCompressor? compressor,
    Uuid? uuid,
  }) : _documentsDir = documentsDir,
       _picker = picker,
       _compressor = compressor ?? _defaultCompressor,
       _uuid = uuid ?? const Uuid();

  static const photosDir = 'photos';

  final Future<Directory> Function() _documentsDir;
  final ImagePicker? _picker;
  final ImageCompressor _compressor;
  final Uuid _uuid;

  /// Memilih dari kamera/galeri lalu menyimpannya. `null` bila dibatalkan.
  Future<String?> pickAndStore(ImageSource source) async {
    final picked = await (_picker ?? ImagePicker()).pickImage(source: source);
    if (picked == null) return null;
    return store(picked.path);
  }

  /// Mengompres [sourcePath] ke dokumen app dan mengembalikan path relatif.
  /// Bila kompresi gagal, file asli disalin apa adanya.
  Future<String> store(String sourcePath) async {
    final root = await _documentsDir();
    final relative = '$photosDir/${_uuid.v4()}.jpg';
    final dest = File(p.join(root.path, relative));
    await dest.parent.create(recursive: true);
    String? out;
    try {
      out = await _compressor(sourcePath, dest.path);
    } catch (_) {
      out = null;
    }
    if (out == null || !await dest.exists()) {
      await File(sourcePath).copy(dest.path);
    }
    return relative;
  }

  Future<File> fileFor(String relativePath) async {
    final root = await _documentsDir();
    return File(p.join(root.path, relativePath));
  }

  /// Menghapus file; diam bila file sudah tidak ada.
  Future<void> delete(String relativePath) async {
    final file = await fileFor(relativePath);
    if (await file.exists()) await file.delete();
  }

  Future<void> deleteAll(Iterable<String> relativePaths) async {
    for (final path in relativePaths) {
      await delete(path);
    }
  }
}

final photoStorageServiceProvider = Provider<PhotoStorageService>(
  (ref) => PhotoStorageService(documentsDir: getApplicationDocumentsDirectory),
);
