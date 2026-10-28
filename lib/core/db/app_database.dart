import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'tables.dart';

part 'app_database.g.dart';

const _seedSpecies = [
  'Kakap Putih',
  'Kakap Merah',
  'Kerapu',
  'Baronang',
  'Tenggiri',
  'Tongkol',
  'GT (Giant Trevally)',
  'Barakuda',
  'Bawal',
  'Gabus',
  'Nila',
  'Mas',
  'Patin',
  'Lele',
  'Toman',
  'Belida',
];

const _seedBaits = [
  'Udang hidup',
  'Cumi',
  'Ikan teri',
  'Cacing tanah',
  'Pelet',
  'Jangkrik',
  'Umpan tiruan (soft lure)',
  'Minnow',
  'Jig',
  'Kodok tiruan (frog)',
];

const _seedRigs = [
  'Dasaran',
  'Carolina rig',
  'Texas rig',
  'Dropshot',
  'Popping',
  'Jigging',
  'Float rig',
  'Handline',
];

@DriftDatabase(
  tables: [Sessions, Catches, CatchPhotos, WeatherSnapshots, Species, Baits, Rigs],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase([QueryExecutor? executor])
      : super(executor ?? driftDatabase(name: 'fishing_log'));

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (m) async {
          await m.createAll();
          await batch((b) {
            b.insertAll(species, [
              for (final n in _seedSpecies) SpeciesCompanion.insert(name: n),
            ]);
            b.insertAll(baits, [
              for (final n in _seedBaits) BaitsCompanion.insert(name: n),
            ]);
            b.insertAll(rigs, [
              for (final n in _seedRigs) RigsCompanion.insert(name: n),
            ]);
          });
        },
        beforeOpen: (details) async {
          await customStatement('PRAGMA foreign_keys = ON');
        },
      );
}

final appDatabaseProvider = Provider<AppDatabase>((ref) {
  final db = AppDatabase();
  ref.onDispose(db.close);
  return db;
});
