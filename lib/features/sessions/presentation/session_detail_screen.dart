import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/utils/formatters.dart';
import '../../weather/presentation/weather_card.dart';
import '../domain/catch_entry.dart';
import '../domain/fishing_session.dart';
import 'catch_form_sheet.dart';
import 'photo_widgets.dart';
import 'providers.dart';

class SessionDetailScreen extends ConsumerWidget {
  const SessionDetailScreen({super.key, required this.sessionId});

  final String sessionId;

  Future<void> _confirmDelete(BuildContext context, WidgetRef ref) async {
    final ok = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Hapus sesi?'),
        content: const Text('Sesi beserta tangkapannya akan dihapus permanen.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Batal'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Hapus'),
          ),
        ],
      ),
    );
    if (ok != true) return;
    await ref.read(sessionFormControllerProvider.notifier).delete(sessionId);
    if (!context.mounted) return;
    if (ref.read(sessionFormControllerProvider).hasError) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Gagal menghapus sesi')));
      return;
    }
    context.go('/');
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final session = ref.watch(sessionDetailProvider(sessionId));
    return session.when(
      loading: () =>
          const Scaffold(body: Center(child: CircularProgressIndicator())),
      error: (e, _) => Scaffold(body: Center(child: Text('Gagal: $e'))),
      data: (s) => s == null
          ? const Scaffold(body: Center(child: Text('Sesi tidak ditemukan')))
          : Scaffold(
              appBar: AppBar(
                title: Text(s.locationName ?? 'Sesi'),
                actions: [
                  IconButton(
                    tooltip: 'Edit',
                    icon: const Icon(Icons.edit),
                    onPressed: () => context.push('/session/${s.id}/edit'),
                  ),
                  IconButton(
                    tooltip: 'Hapus',
                    icon: const Icon(Icons.delete),
                    onPressed: () => _confirmDelete(context, ref),
                  ),
                ],
              ),
              body: _Body(session: s),
            ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({required this.session});

  final FishingSession session;

  @override
  Widget build(BuildContext context) {
    final s = session;
    return ListView(
      children: [
        ListTile(
          title: const Text('Mulai'),
          subtitle: Text(formatDateTime(s.startedAt)),
        ),
        ListTile(
          title: const Text('Selesai'),
          subtitle: Text(s.endedAt == null ? '-' : formatDateTime(s.endedAt!)),
        ),
        ListTile(
          title: const Text('Rating'),
          subtitle: Text(s.rating == null ? '-' : '${s.rating} / 5'),
        ),
        WeatherCard(sessionId: s.id, weather: s.weather),
        const Divider(),
        ListTile(
          title: Text(
            'Tangkapan (${s.catchCount})',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          trailing: FilledButton.icon(
            onPressed: () => showCatchFormSheet(context, sessionId: s.id),
            icon: const Icon(Icons.add),
            label: const Text('Tambah tangkapan'),
          ),
        ),
        if (s.catches.isEmpty)
          const ListTile(
            title: Text('Boncos'),
            subtitle: Text('Belum ada tangkapan.'),
          )
        else
          for (final c in s.catches) ...[
            ListTile(
              title: Text(c.speciesName),
              subtitle: Text(_catchSubtitle(c)),
              onTap: () =>
                  showCatchFormSheet(context, sessionId: s.id, existing: c),
            ),
            if (c.photos.isNotEmpty)
              SizedBox(
                height: 64,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: c.photos.length,
                  separatorBuilder: (_, _) => const SizedBox(width: 8),
                  itemBuilder: (context, i) => PhotoThumb(
                    path: c.photos[i].filePath,
                    onTap: () => openPhotoViewer(context, [
                      for (final p in c.photos) p.filePath,
                    ], i),
                  ),
                ),
              ),
          ],
      ],
    );
  }
}

String _catchSubtitle(CatchEntry c) {
  final parts = [
    formatDateTime(c.caughtAt),
    if (c.lengthCm != null) '${c.lengthCm} cm',
    if (c.weightKg != null) '${c.weightKg} kg',
    if (c.baitName != null) c.baitName!,
    if (c.rigName != null) c.rigName!,
    c.released ? 'Dilepas' : 'Dibawa',
  ];
  return parts.join(' · ');
}
