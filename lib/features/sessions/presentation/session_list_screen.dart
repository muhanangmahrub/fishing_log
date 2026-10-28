import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/utils/formatters.dart';
import 'providers.dart';

class SessionListScreen extends ConsumerWidget {
  const SessionListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sessions = ref.watch(sessionListProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Riwayat')),
      body: sessions.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Gagal memuat: $e')),
        data: (list) => list.isEmpty
            ? const Center(child: Text('Belum ada sesi. Tekan + untuk mulai.'))
            : ListView.builder(
                itemCount: list.length,
                itemBuilder: (context, i) {
                  final s = list[i];
                  return ListTile(
                    title: Text(s.locationName ?? 'Tanpa nama lokasi'),
                    subtitle: Text(formatDateTime(s.startedAt)),
                    trailing: Text(
                      s.isBlank ? 'Boncos' : '${s.catchCount} ikan',
                    ),
                    onTap: () => context.push('/session/${s.id}'),
                  );
                },
              ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Tambah sesi',
        onPressed: () => context.push('/session/new'),
        child: const Icon(Icons.add),
      ),
    );
  }
}
