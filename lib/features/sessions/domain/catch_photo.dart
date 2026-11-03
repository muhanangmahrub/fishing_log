import 'package:freezed_annotation/freezed_annotation.dart';

part 'catch_photo.freezed.dart';

@freezed
abstract class CatchPhoto with _$CatchPhoto {
  const factory CatchPhoto({
    required String id,
    required String catchId,

    /// Relatif ke direktori dokumen aplikasi.
    required String filePath,
    required DateTime createdAt,
  }) = _CatchPhoto;
}
