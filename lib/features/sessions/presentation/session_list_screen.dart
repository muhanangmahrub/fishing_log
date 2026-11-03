import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/utils/formatters.dart';
import '../../weather/domain/weather_code.dart';
import 'providers.dart';
import 'session_filter_sheet.dart';

class SessionListScreen extends ConsumerWidget {
  const SessionListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filter = ref.watch(sessionFilterProvider);
    final sessions = ref.watch(sessionListProvider(filter));
    return Scaffold(
      appBar: AppBar(
        title: const Text('Riwayat'),
        actions: [
          IconButton(
            tooltip: 'Filter',
            icon: Badge(
              isLabelVisible: !filter.isEmpty,
              smallSize: 8,
              child: const Icon(Icons.filter_list),
            ),
            onPressed: () => showSessionFilterSheet(context),
          ),
        ],
      ),
      body: sessions.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Gagal memuat: $e')),
        data: (list) => list.isEmpty
            ? Center(
                child: Text(
                  filter.isEmpty
                      ? 'Belum ada sesi. Tekan + untuk mulai.'
                      : 'Tidak ada sesi yang cocok dengan filter.',
                ),
              )
            : ListView.builder(
                itemCount: list.length,
                itemBuilder: (context, i) {
                  final s = list[i];
                  return ListTile(
                    title: Text(s.locationName ?? 'Tanpa nama lokasi'),
                    subtitle: Text(formatDateTime(s.startedAt)),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (s.weather != null)
                          Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: Icon(
                              describeWeatherCode(s.weather!.weatherCode).icon,
                              semanticLabel: describeWeatherCode(
                                s.weather!.weatherCode,
                              ).label,
                            ),
                          ),
                        Text(s.isBlank ? 'Boncos' : '${s.catchCount} ikan'),
                      ],
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
