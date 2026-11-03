import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../master_data/data/master_data_repository.dart';
import '../domain/session_filter.dart';
import 'providers.dart';

Future<void> showSessionFilterSheet(BuildContext context) =>
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      showDragHandle: true,
      builder: (_) => const SessionFilterSheet(),
    );

class SessionFilterSheet extends ConsumerWidget {
  const SessionFilterSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filter = ref.watch(sessionFilterProvider);
    final notifier = ref.read(sessionFilterProvider.notifier);
    final species = ref.watch(speciesListProvider).value ?? const [];
    final loc = MaterialLocalizations.of(context);
    final range = filter.from == null && filter.to == null
        ? 'Semua tanggal'
        : '${filter.from == null ? '…' : loc.formatShortDate(filter.from!)}'
              ' – ${filter.to == null ? '…' : loc.formatShortDate(filter.to!)}';

    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Spesies', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              children: [
                for (final sp in species)
                  FilterChip(
                    label: Text(sp.name),
                    selected: filter.speciesId == sp.id,
                    onSelected: (on) => notifier.set(
                      SessionFilter(
                        speciesId: on ? sp.id : null,
                        from: filter.from,
                        to: filter.to,
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 16),
            Text('Tanggal', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 8),
            OutlinedButton.icon(
              icon: const Icon(Icons.date_range),
              label: Text(range),
              onPressed: () async {
                final picked = await showDateRangePicker(
                  context: context,
                  firstDate: DateTime(2000),
                  lastDate: DateTime.now().add(const Duration(days: 1)),
                  initialDateRange: filter.from != null && filter.to != null
                      ? DateTimeRange(start: filter.from!, end: filter.to!)
                      : null,
                );
                if (picked == null) return;
                notifier.set(
                  SessionFilter(
                    speciesId: filter.speciesId,
                    from: picked.start,
                    to: picked.end,
                  ),
                );
              },
            ),
            const SizedBox(height: 8),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: filter.isEmpty ? null : notifier.clear,
                child: const Text('Reset'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
