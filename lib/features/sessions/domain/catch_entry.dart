import 'package:freezed_annotation/freezed_annotation.dart';

import 'catch_photo.dart';

part 'catch_entry.freezed.dart';

@freezed
abstract class CatchEntry with _$CatchEntry {
  const factory CatchEntry({
    required String id,
    required String sessionId,
    required int speciesId,
    required String speciesName,
    int? baitId,
    String? baitName,
    int? rigId,
    String? rigName,
    double? lengthCm,
    double? weightKg,
    required DateTime caughtAt,
    @Default(false) bool released,
    String? notes,
    @Default(<CatchPhoto>[]) List<CatchPhoto> photos,
  }) = _CatchEntry;
}
