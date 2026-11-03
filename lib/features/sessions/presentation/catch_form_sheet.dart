import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:image_picker/image_picker.dart';

import '../../../core/services/photo_storage_service.dart';
import '../../../core/utils/formatters.dart';
import '../../master_data/data/master_data_repository.dart';
import '../data/session_repository.dart';
import '../domain/catch_entry.dart';
import '../domain/catch_photo.dart';
import 'photo_widgets.dart';

/// Bottom sheet tambah/edit tangkapan. [existing] != null berarti edit.
Future<void> showCatchFormSheet(
  BuildContext context, {
  required String sessionId,
  CatchEntry? existing,
}) {
  return showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    useSafeArea: true,
    builder: (_) => CatchFormSheet(sessionId: sessionId, existing: existing),
  );
}

class CatchFormSheet extends ConsumerStatefulWidget {
  const CatchFormSheet({super.key, required this.sessionId, this.existing});

  final String sessionId;
  final CatchEntry? existing;

  @override
  ConsumerState<CatchFormSheet> createState() => _CatchFormSheetState();
}

class _CatchFormSheetState extends ConsumerState<CatchFormSheet> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _length;
  late final TextEditingController _weight;
  late final TextEditingController _notes;
  int? _speciesId;
  int? _baitId;
  int? _rigId;
  late DateTime _caughtAt;
  late bool _released;
  bool _saving = false;
  bool _saved = false;
  late final PhotoStorageService _photoStorage;
  late final List<CatchPhoto> _photos; // foto yang sudah tersimpan
  final _removedPhotoIds = <String>{};
  final _addedPaths = <String>[]; // file baru, belum masuk DB

  @override
  void initState() {
    super.initState();
    _photoStorage = ref.read(photoStorageServiceProvider);
    final e = widget.existing;
    _photos = [...?e?.photos];
    _speciesId = e?.speciesId;
    _baitId = e?.baitId;
    _rigId = e?.rigId;
    _caughtAt = e?.caughtAt ?? DateTime.now();
    _released = e?.released ?? false;
    _length = TextEditingController(text: e?.lengthCm?.toString() ?? '');
    _weight = TextEditingController(text: e?.weightKg?.toString() ?? '');
    _notes = TextEditingController(text: e?.notes ?? '');
  }

  @override
  void dispose() {
    _length.dispose();
    _weight.dispose();
    _notes.dispose();
    // Dibatalkan: buang file yang sudah disalin tapi tidak pernah disimpan.
    if (!_saved) _photoStorage.deleteAll(_addedPaths);
    super.dispose();
  }

  Future<void> _addCustom(MasterKind kind, String label) async {
    final name = await showDialog<String>(
      context: context,
      builder: (_) => _AddCustomDialog(label: label),
    );
    if (name == null || name.trim().isEmpty) return;
    final id = await ref
        .read(masterDataRepositoryProvider)
        .addCustom(kind, name);
    if (!mounted) return;
    setState(() {
      switch (kind) {
        case MasterKind.species:
          _speciesId = id;
        case MasterKind.bait:
          _baitId = id;
        case MasterKind.rig:
          _rigId = id;
      }
    });
  }

  Future<void> _pickTime() async {
    final date = await showDatePicker(
      context: context,
      initialDate: _caughtAt,
      firstDate: DateTime(2000),
      lastDate: DateTime.now().add(const Duration(days: 1)),
    );
    if (date == null || !mounted) return;
    final time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(_caughtAt),
    );
    if (time == null) return;
    setState(() {
      _caughtAt = DateTime(
        date.year,
        date.month,
        date.day,
        time.hour,
        time.minute,
      );
    });
  }

  String? _validateNumber(String? v) {
    if (v == null || v.trim().isEmpty) return null;
    final n = double.tryParse(v.trim().replaceAll(',', '.'));
    return n == null || n <= 0 ? 'Angka tidak valid' : null;
  }

  double? _parse(TextEditingController c) {
    final t = c.text.trim().replaceAll(',', '.');
    return t.isEmpty ? null : double.parse(t);
  }

  Future<void> _addPhoto(ImageSource source) async {
    try {
      final path = await _photoStorage.pickAndStore(source);
      if (path != null && mounted) setState(() => _addedPaths.add(path));
    } catch (_) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Foto gagal diambil. Periksa izin kamera/galeri.'),
        ),
      );
    }
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _saving = true);
    final repo = ref.read(sessionRepositoryProvider);
    final notes = _notes.text.trim();
    final entry = CatchEntry(
      id: widget.existing?.id ?? '',
      sessionId: widget.sessionId,
      speciesId: _speciesId!,
      speciesName: '',
      baitId: _baitId,
      rigId: _rigId,
      lengthCm: _parse(_length),
      weightKg: _parse(_weight),
      caughtAt: _caughtAt,
      released: _released,
      notes: notes.isEmpty ? null : notes,
    );
    final String catchId;
    if (widget.existing == null) {
      catchId = await repo.addCatch(entry);
    } else {
      catchId = widget.existing!.id;
      await repo.updateCatch(entry);
    }
    for (final id in _removedPhotoIds) {
      await repo.deletePhoto(id);
    }
    for (final path in _addedPaths) {
      await repo.addPhoto(catchId, path);
    }
    _saved = true;
    if (mounted) Navigator.pop(context);
  }

  Future<void> _delete() async {
    await ref.read(sessionRepositoryProvider).deleteCatch(widget.existing!.id);
    if (mounted) Navigator.pop(context);
  }

  Widget _picker({
    required String label,
    required AsyncValue<List<MasterItem>> items,
    required int? value,
    required ValueChanged<int?> onChanged,
    required MasterKind kind,
    bool required = false,
  }) {
    final list = items.asData?.value ?? const <MasterItem>[];
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: DropdownButtonFormField<int>(
            key: ValueKey('$label-$value-${list.length}'),
            initialValue: list.any((i) => i.id == value) ? value : null,
            isExpanded: true,
            decoration: InputDecoration(labelText: label),
            items: [
              for (final i in list)
                DropdownMenuItem(value: i.id, child: Text(i.name)),
            ],
            onChanged: onChanged,
            validator: required
                ? (v) => v == null ? '$label wajib dipilih' : null
                : null,
          ),
        ),
        IconButton(
          tooltip: 'Tambah ${label.toLowerCase()} baru',
          icon: const Icon(Icons.add),
          onPressed: () => _addCustom(kind, label.toLowerCase()),
        ),
      ],
    );
  }

  Widget _photoSection() {
    final shown = [
      for (final p in _photos)
        if (!_removedPhotoIds.contains(p.id))
          (path: p.filePath, onRemove: () => _removedPhotoIds.add(p.id)),
      for (final path in _addedPaths)
        (
          path: path,
          onRemove: () {
            _addedPaths.remove(path);
            _photoStorage.delete(path);
          },
        ),
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text('Foto', style: Theme.of(context).textTheme.titleSmall),
            const Spacer(),
            TextButton.icon(
              onPressed: () => _addPhoto(ImageSource.camera),
              icon: const Icon(Icons.photo_camera),
              label: const Text('Kamera'),
            ),
            TextButton.icon(
              onPressed: () => _addPhoto(ImageSource.gallery),
              icon: const Icon(Icons.photo_library),
              label: const Text('Galeri'),
            ),
          ],
        ),
        if (shown.isNotEmpty)
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              for (final item in shown)
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    PhotoThumb(path: item.path),
                    Positioned(
                      top: -8,
                      right: -8,
                      child: IconButton.filled(
                        tooltip: 'Hapus foto',
                        iconSize: 14,
                        visualDensity: VisualDensity.compact,
                        constraints: const BoxConstraints.tightFor(
                          width: 24,
                          height: 24,
                        ),
                        padding: EdgeInsets.zero,
                        icon: const Icon(Icons.close),
                        onPressed: () => setState(item.onRemove),
                      ),
                    ),
                  ],
                ),
            ],
          ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final editing = widget.existing != null;
    return Padding(
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        top: 16,
        bottom: MediaQuery.of(context).viewInsets.bottom + 16,
      ),
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                editing ? 'Edit tangkapan' : 'Tambah tangkapan',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              _picker(
                label: 'Spesies',
                items: ref.watch(speciesListProvider),
                value: _speciesId,
                onChanged: (v) => setState(() => _speciesId = v),
                kind: MasterKind.species,
                required: true,
              ),
              _picker(
                label: 'Umpan',
                items: ref.watch(baitListProvider),
                value: _baitId,
                onChanged: (v) => setState(() => _baitId = v),
                kind: MasterKind.bait,
              ),
              _picker(
                label: 'Rig',
                items: ref.watch(rigListProvider),
                value: _rigId,
                onChanged: (v) => setState(() => _rigId = v),
                kind: MasterKind.rig,
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _length,
                      decoration: const InputDecoration(
                        labelText: 'Panjang (cm)',
                      ),
                      keyboardType: const TextInputType.numberWithOptions(
                        decimal: true,
                      ),
                      validator: _validateNumber,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: TextFormField(
                      controller: _weight,
                      decoration: const InputDecoration(
                        labelText: 'Berat (kg)',
                      ),
                      keyboardType: const TextInputType.numberWithOptions(
                        decimal: true,
                      ),
                      validator: _validateNumber,
                    ),
                  ),
                ],
              ),
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: const Text('Waktu'),
                subtitle: Text(formatDateTime(_caughtAt)),
                trailing: const Icon(Icons.schedule),
                onTap: _pickTime,
              ),
              SwitchListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(_released ? 'Dilepas' : 'Dibawa pulang'),
                value: _released,
                onChanged: (v) => setState(() => _released = v),
              ),
              TextFormField(
                controller: _notes,
                decoration: const InputDecoration(labelText: 'Catatan'),
                maxLines: 2,
              ),
              const SizedBox(height: 8),
              _photoSection(),
              const SizedBox(height: 16),
              Row(
                children: [
                  if (editing)
                    TextButton(onPressed: _delete, child: const Text('Hapus')),
                  const Spacer(),
                  FilledButton(
                    onPressed: _saving ? null : _save,
                    child: const Text('Simpan'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _AddCustomDialog extends StatefulWidget {
  const _AddCustomDialog({required this.label});

  final String label;

  @override
  State<_AddCustomDialog> createState() => _AddCustomDialogState();
}

class _AddCustomDialogState extends State<_AddCustomDialog> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Tambah ${widget.label} baru'),
      content: TextField(
        controller: _controller,
        autofocus: true,
        decoration: InputDecoration(labelText: 'Nama ${widget.label}'),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Batal'),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context, _controller.text),
          child: const Text('Tambah'),
        ),
      ],
    );
  }
}
