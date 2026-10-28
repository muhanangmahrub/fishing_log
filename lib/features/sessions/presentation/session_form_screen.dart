import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/utils/formatters.dart';
import '../domain/fishing_session.dart';
import 'providers.dart';

/// Form tambah sesi, atau edit bila [sessionId] diberikan.
class SessionFormScreen extends ConsumerWidget {
  const SessionFormScreen({super.key, this.sessionId});

  final String? sessionId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final id = sessionId;
    if (id == null) return const _SessionForm();
    return ref.watch(sessionDetailProvider(id)).when(
          loading: () => const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          ),
          error: (e, _) => Scaffold(body: Center(child: Text('Gagal: $e'))),
          data: (s) => s == null
              ? const Scaffold(body: Center(child: Text('Sesi tidak ditemukan')))
              : _SessionForm(existing: s),
        );
  }
}

class _SessionForm extends ConsumerStatefulWidget {
  const _SessionForm({this.existing});

  final FishingSession? existing;

  @override
  ConsumerState<_SessionForm> createState() => _SessionFormState();
}

class _SessionFormState extends ConsumerState<_SessionForm> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _location;
  late DateTime _startedAt;
  DateTime? _endedAt;
  int? _rating;

  @override
  void initState() {
    super.initState();
    final s = widget.existing;
    _location = TextEditingController(text: s?.locationName);
    _startedAt = s?.startedAt ?? DateTime.now();
    _endedAt = s?.endedAt;
    _rating = s?.rating;
  }

  @override
  void dispose() {
    _location.dispose();
    super.dispose();
  }

  Future<DateTime?> _pickDateTime(DateTime initial) async {
    final date = await showDatePicker(
      context: context,
      initialDate: initial,
      firstDate: DateTime(2000),
      lastDate: DateTime.now().add(const Duration(days: 1)),
    );
    if (date == null || !mounted) return null;
    final time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(initial),
    );
    if (time == null) return null;
    return DateTime(date.year, date.month, date.day, time.hour, time.minute);
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;
    await ref.read(sessionFormControllerProvider.notifier).save(
          existing: widget.existing,
          startedAt: _startedAt,
          endedAt: _endedAt,
          locationName: _location.text.trim(),
          rating: _rating,
        );
    if (!mounted) return;
    if (ref.read(sessionFormControllerProvider).hasError) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Gagal menyimpan sesi')));
      return;
    }
    context.pop();
  }

  @override
  Widget build(BuildContext context) {
    final saving = ref.watch(sessionFormControllerProvider).isLoading;
    final editing = widget.existing != null;
    return Scaffold(
      appBar: AppBar(title: Text(editing ? 'Edit sesi' : 'Sesi baru')),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            TextFormField(
              controller: _location,
              decoration: const InputDecoration(labelText: 'Nama lokasi'),
              validator: (v) => (v == null || v.trim().isEmpty)
                  ? 'Nama lokasi wajib diisi'
                  : null,
            ),
            const SizedBox(height: 8),
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('Waktu mulai'),
              subtitle: Text(formatDateTime(_startedAt)),
              trailing: const Icon(Icons.edit_calendar),
              onTap: () async {
                final picked = await _pickDateTime(_startedAt);
                if (picked != null) setState(() => _startedAt = picked);
              },
            ),
            FormField<DateTime?>(
              initialValue: _endedAt,
              validator: (_) => _endedAt != null &&
                      _endedAt!.isBefore(_startedAt)
                  ? 'Waktu selesai harus setelah waktu mulai'
                  : null,
              builder: (field) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: const Text('Waktu selesai'),
                    subtitle: Text(
                      _endedAt == null
                          ? 'Belum diisi'
                          : formatDateTime(_endedAt!),
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (_endedAt != null)
                          IconButton(
                            tooltip: 'Hapus waktu selesai',
                            icon: const Icon(Icons.clear),
                            onPressed: () => setState(() => _endedAt = null),
                          ),
                        const Icon(Icons.edit_calendar),
                      ],
                    ),
                    onTap: () async {
                      final picked = await _pickDateTime(_endedAt ?? _startedAt);
                      if (picked != null) setState(() => _endedAt = picked);
                    },
                  ),
                  if (field.hasError)
                    Text(
                      field.errorText!,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.error,
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Text('Rating', style: Theme.of(context).textTheme.labelLarge),
            Row(
              children: [
                for (var i = 1; i <= 5; i++)
                  IconButton(
                    tooltip: 'Rating $i',
                    icon: Icon(
                      i <= (_rating ?? 0) ? Icons.star : Icons.star_border,
                    ),
                    // Ketuk bintang yang sama lagi untuk mengosongkan.
                    onPressed: () =>
                        setState(() => _rating = _rating == i ? null : i),
                  ),
              ],
            ),
            const SizedBox(height: 16),
            FilledButton(
              onPressed: saving ? null : _save,
              child: const Text('Simpan'),
            ),
          ],
        ),
      ),
    );
  }
}
