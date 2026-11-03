import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/db/app_database.dart';

enum MasterKind { species, bait, rig }

class MasterItem {
  const MasterItem({
    required this.id,
    required this.name,
    required this.isCustom,
  });

  final int id;
  final String name;
  final bool isCustom;
}

/// Daftar pilihan spesies/umpan/rig dan penambahan nilai custom.
class MasterDataRepository {
  MasterDataRepository(this._db);

  final AppDatabase _db;

  Stream<List<MasterItem>> watch(MasterKind kind) {
    switch (kind) {
      case MasterKind.species:
        return (_db.select(_db.species)
              ..orderBy([(t) => OrderingTerm.asc(t.name)]))
            .watch()
            .map((r) => [for (final e in r) _item(e.id, e.name, e.isCustom)]);
      case MasterKind.bait:
        return (_db.select(_db.baits)
              ..orderBy([(t) => OrderingTerm.asc(t.name)]))
            .watch()
            .map((r) => [for (final e in r) _item(e.id, e.name, e.isCustom)]);
      case MasterKind.rig:
        return (_db.select(_db.rigs)
              ..orderBy([(t) => OrderingTerm.asc(t.name)]))
            .watch()
            .map((r) => [for (final e in r) _item(e.id, e.name, e.isCustom)]);
    }
  }

  MasterItem _item(int id, String name, bool isCustom) =>
      MasterItem(id: id, name: name, isCustom: isCustom);

  /// Menambah item custom dan mengembalikan id-nya. Bila nama sudah ada
  /// (tanpa membedakan huruf besar/kecil), id yang ada dipakai ulang.
  Future<int> addCustom(MasterKind kind, String rawName) async {
    final name = rawName.trim();
    if (name.isEmpty) throw ArgumentError('Nama tidak boleh kosong');
    switch (kind) {
      case MasterKind.species:
        final existing = await (_db.select(_db.species)
              ..where((t) => t.name.lower().equals(name.toLowerCase())))
            .getSingleOrNull();
        if (existing != null) return existing.id;
        return _db.into(_db.species).insert(
          SpeciesCompanion.insert(name: name, isCustom: const Value(true)),
        );
      case MasterKind.bait:
        final existing = await (_db.select(_db.baits)
              ..where((t) => t.name.lower().equals(name.toLowerCase())))
            .getSingleOrNull();
        if (existing != null) return existing.id;
        return _db.into(_db.baits).insert(
          BaitsCompanion.insert(name: name, isCustom: const Value(true)),
        );
      case MasterKind.rig:
        final existing = await (_db.select(_db.rigs)
              ..where((t) => t.name.lower().equals(name.toLowerCase())))
            .getSingleOrNull();
        if (existing != null) return existing.id;
        return _db.into(_db.rigs).insert(
          RigsCompanion.insert(name: name, isCustom: const Value(true)),
        );
    }
  }
}

final masterDataRepositoryProvider = Provider<MasterDataRepository>(
  (ref) => MasterDataRepository(ref.watch(appDatabaseProvider)),
);

final speciesListProvider = StreamProvider<List<MasterItem>>(
  (ref) => ref.watch(masterDataRepositoryProvider).watch(MasterKind.species),
);

final baitListProvider = StreamProvider<List<MasterItem>>(
  (ref) => ref.watch(masterDataRepositoryProvider).watch(MasterKind.bait),
);

final rigListProvider = StreamProvider<List<MasterItem>>(
  (ref) => ref.watch(masterDataRepositoryProvider).watch(MasterKind.rig),
);
