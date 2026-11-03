import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/services/photo_storage_service.dart';

/// Thumbnail dari path relatif di direktori dokumen aplikasi.
class PhotoThumb extends ConsumerWidget {
  const PhotoThumb({super.key, required this.path, this.size = 64, this.onTap});

  final String path;
  final double size;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final service = ref.watch(photoStorageServiceProvider);
    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: SizedBox.square(
          dimension: size,
          child: FutureBuilder<File>(
            future: service.fileFor(path),
            builder: (context, snap) {
              final file = snap.data;
              if (file == null) return const ColoredBox(color: Colors.black12);
              return Image.file(
                file,
                fit: BoxFit.cover,
                cacheWidth: (size * 2).round(),
                errorBuilder: (_, _, _) => const ColoredBox(
                  color: Colors.black12,
                  child: Icon(Icons.broken_image),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

/// Layar penuh dengan geser antar foto dan zoom.
class PhotoViewerScreen extends ConsumerWidget {
  const PhotoViewerScreen({
    super.key,
    required this.paths,
    this.initialIndex = 0,
  });

  final List<String> paths;
  final int initialIndex;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final service = ref.watch(photoStorageServiceProvider);
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: PageView.builder(
        controller: PageController(initialPage: initialIndex),
        itemCount: paths.length,
        itemBuilder: (context, i) => FutureBuilder<File>(
          future: service.fileFor(paths[i]),
          builder: (context, snap) {
            final file = snap.data;
            if (file == null) return const SizedBox.shrink();
            return InteractiveViewer(child: Center(child: Image.file(file)));
          },
        ),
      ),
    );
  }
}

void openPhotoViewer(
  BuildContext context,
  List<String> paths,
  int initialIndex,
) {
  Navigator.of(context).push(
    MaterialPageRoute<void>(
      builder: (_) =>
          PhotoViewerScreen(paths: paths, initialIndex: initialIndex),
    ),
  );
}
