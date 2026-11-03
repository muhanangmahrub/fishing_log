// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'catch_entry.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CatchEntry {

 String get id; String get sessionId; int get speciesId; String get speciesName; int? get baitId; String? get baitName; int? get rigId; String? get rigName; double? get lengthCm; double? get weightKg; DateTime get caughtAt; bool get released; String? get notes; List<CatchPhoto> get photos;
/// Create a copy of CatchEntry
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CatchEntryCopyWith<CatchEntry> get copyWith => _$CatchEntryCopyWithImpl<CatchEntry>(this as CatchEntry, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as CatchEntry;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CatchEntry&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.sessionId, _this.sessionId) || other.sessionId == _this.sessionId)&&(identical(other.speciesId, _this.speciesId) || other.speciesId == _this.speciesId)&&(identical(other.speciesName, _this.speciesName) || other.speciesName == _this.speciesName)&&(identical(other.baitId, _this.baitId) || other.baitId == _this.baitId)&&(identical(other.baitName, _this.baitName) || other.baitName == _this.baitName)&&(identical(other.rigId, _this.rigId) || other.rigId == _this.rigId)&&(identical(other.rigName, _this.rigName) || other.rigName == _this.rigName)&&(identical(other.lengthCm, _this.lengthCm) || other.lengthCm == _this.lengthCm)&&(identical(other.weightKg, _this.weightKg) || other.weightKg == _this.weightKg)&&(identical(other.caughtAt, _this.caughtAt) || other.caughtAt == _this.caughtAt)&&(identical(other.released, _this.released) || other.released == _this.released)&&(identical(other.notes, _this.notes) || other.notes == _this.notes)&&const DeepCollectionEquality().equals(other.photos, _this.photos));
}


@override
int get hashCode {
  final _this = this as CatchEntry;
  return Object.hash(runtimeType,_this.id,_this.sessionId,_this.speciesId,_this.speciesName,_this.baitId,_this.baitName,_this.rigId,_this.rigName,_this.lengthCm,_this.weightKg,_this.caughtAt,_this.released,_this.notes,const DeepCollectionEquality().hash(_this.photos));
}

@override
String toString() {
  final _this = this as CatchEntry;
  return 'CatchEntry(id: ${_this.id}, sessionId: ${_this.sessionId}, speciesId: ${_this.speciesId}, speciesName: ${_this.speciesName}, baitId: ${_this.baitId}, baitName: ${_this.baitName}, rigId: ${_this.rigId}, rigName: ${_this.rigName}, lengthCm: ${_this.lengthCm}, weightKg: ${_this.weightKg}, caughtAt: ${_this.caughtAt}, released: ${_this.released}, notes: ${_this.notes}, photos: ${_this.photos})';
}


}

/// @nodoc
abstract mixin class $CatchEntryCopyWith<$Res>  {
  factory $CatchEntryCopyWith(CatchEntry value, $Res Function(CatchEntry) _then) = _$CatchEntryCopyWithImpl;
@useResult
$Res call({
 String id, String sessionId, int speciesId, String speciesName, int? baitId, String? baitName, int? rigId, String? rigName, double? lengthCm, double? weightKg, DateTime caughtAt, bool released, String? notes, List<CatchPhoto> photos
});




}
/// @nodoc
class _$CatchEntryCopyWithImpl<$Res>
    implements $CatchEntryCopyWith<$Res> {
  _$CatchEntryCopyWithImpl(this._self, this._then);

  final CatchEntry _self;
  final $Res Function(CatchEntry) _then;

/// Create a copy of CatchEntry
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? sessionId = null,Object? speciesId = null,Object? speciesName = null,Object? baitId = freezed,Object? baitName = freezed,Object? rigId = freezed,Object? rigName = freezed,Object? lengthCm = freezed,Object? weightKg = freezed,Object? caughtAt = null,Object? released = null,Object? notes = freezed,Object? photos = null,}) {
  return _then(CatchEntry(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,sessionId: null == sessionId ? _self.sessionId : sessionId // ignore: cast_nullable_to_non_nullable
as String,speciesId: null == speciesId ? _self.speciesId : speciesId // ignore: cast_nullable_to_non_nullable
as int,speciesName: null == speciesName ? _self.speciesName : speciesName // ignore: cast_nullable_to_non_nullable
as String,baitId: freezed == baitId ? _self.baitId : baitId // ignore: cast_nullable_to_non_nullable
as int?,baitName: freezed == baitName ? _self.baitName : baitName // ignore: cast_nullable_to_non_nullable
as String?,rigId: freezed == rigId ? _self.rigId : rigId // ignore: cast_nullable_to_non_nullable
as int?,rigName: freezed == rigName ? _self.rigName : rigName // ignore: cast_nullable_to_non_nullable
as String?,lengthCm: freezed == lengthCm ? _self.lengthCm : lengthCm // ignore: cast_nullable_to_non_nullable
as double?,weightKg: freezed == weightKg ? _self.weightKg : weightKg // ignore: cast_nullable_to_non_nullable
as double?,caughtAt: null == caughtAt ? _self.caughtAt : caughtAt // ignore: cast_nullable_to_non_nullable
as DateTime,released: null == released ? _self.released : released // ignore: cast_nullable_to_non_nullable
as bool,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,photos: null == photos ? _self.photos : photos // ignore: cast_nullable_to_non_nullable
as List<CatchPhoto>,
  ));
}

}


/// Adds pattern-matching-related methods to [CatchEntry].
extension CatchEntryPatterns on CatchEntry {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CatchEntry value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CatchEntry() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CatchEntry value)  $default,){
final _that = this;
switch (_that) {
case _CatchEntry():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CatchEntry value)?  $default,){
final _that = this;
switch (_that) {
case _CatchEntry() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String sessionId,  int speciesId,  String speciesName,  int? baitId,  String? baitName,  int? rigId,  String? rigName,  double? lengthCm,  double? weightKg,  DateTime caughtAt,  bool released,  String? notes,  List<CatchPhoto> photos)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CatchEntry() when $default != null:
return $default(_that.id,_that.sessionId,_that.speciesId,_that.speciesName,_that.baitId,_that.baitName,_that.rigId,_that.rigName,_that.lengthCm,_that.weightKg,_that.caughtAt,_that.released,_that.notes,_that.photos);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String sessionId,  int speciesId,  String speciesName,  int? baitId,  String? baitName,  int? rigId,  String? rigName,  double? lengthCm,  double? weightKg,  DateTime caughtAt,  bool released,  String? notes,  List<CatchPhoto> photos)  $default,) {final _that = this;
switch (_that) {
case _CatchEntry():
return $default(_that.id,_that.sessionId,_that.speciesId,_that.speciesName,_that.baitId,_that.baitName,_that.rigId,_that.rigName,_that.lengthCm,_that.weightKg,_that.caughtAt,_that.released,_that.notes,_that.photos);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String sessionId,  int speciesId,  String speciesName,  int? baitId,  String? baitName,  int? rigId,  String? rigName,  double? lengthCm,  double? weightKg,  DateTime caughtAt,  bool released,  String? notes,  List<CatchPhoto> photos)?  $default,) {final _that = this;
switch (_that) {
case _CatchEntry() when $default != null:
return $default(_that.id,_that.sessionId,_that.speciesId,_that.speciesName,_that.baitId,_that.baitName,_that.rigId,_that.rigName,_that.lengthCm,_that.weightKg,_that.caughtAt,_that.released,_that.notes,_that.photos);case _:
  return null;

}
}

}

/// @nodoc


class _CatchEntry implements CatchEntry {
  const _CatchEntry({required this.id, required this.sessionId, required this.speciesId, required this.speciesName, this.baitId, this.baitName, this.rigId, this.rigName, this.lengthCm, this.weightKg, required this.caughtAt, this.released = false, this.notes,  List<CatchPhoto> photos = const <CatchPhoto>[]}): _photos = photos;
  

@override final  String id;
@override final  String sessionId;
@override final  int speciesId;
@override final  String speciesName;
@override final  int? baitId;
@override final  String? baitName;
@override final  int? rigId;
@override final  String? rigName;
@override final  double? lengthCm;
@override final  double? weightKg;
@override final  DateTime caughtAt;
@override@JsonKey() final  bool released;
@override final  String? notes;
 final  List<CatchPhoto> _photos;
@override@JsonKey() List<CatchPhoto> get photos {
  if (_photos is EqualUnmodifiableListView) return _photos;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_photos);
}


/// Create a copy of CatchEntry
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CatchEntryCopyWith<_CatchEntry> get copyWith => __$CatchEntryCopyWithImpl<_CatchEntry>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _CatchEntry&&(identical(other.id, id) || other.id == id)&&(identical(other.sessionId, sessionId) || other.sessionId == sessionId)&&(identical(other.speciesId, speciesId) || other.speciesId == speciesId)&&(identical(other.speciesName, speciesName) || other.speciesName == speciesName)&&(identical(other.baitId, baitId) || other.baitId == baitId)&&(identical(other.baitName, baitName) || other.baitName == baitName)&&(identical(other.rigId, rigId) || other.rigId == rigId)&&(identical(other.rigName, rigName) || other.rigName == rigName)&&(identical(other.lengthCm, lengthCm) || other.lengthCm == lengthCm)&&(identical(other.weightKg, weightKg) || other.weightKg == weightKg)&&(identical(other.caughtAt, caughtAt) || other.caughtAt == caughtAt)&&(identical(other.released, released) || other.released == released)&&(identical(other.notes, notes) || other.notes == notes)&&const DeepCollectionEquality().equals(other.photos, _photos));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id,sessionId,speciesId,speciesName,baitId,baitName,rigId,rigName,lengthCm,weightKg,caughtAt,released,notes,const DeepCollectionEquality().hash(_photos));
}

@override
String toString() {
    return 'CatchEntry(id: $id, sessionId: $sessionId, speciesId: $speciesId, speciesName: $speciesName, baitId: $baitId, baitName: $baitName, rigId: $rigId, rigName: $rigName, lengthCm: $lengthCm, weightKg: $weightKg, caughtAt: $caughtAt, released: $released, notes: $notes, photos: $photos)';
}


}

/// @nodoc
abstract mixin class _$CatchEntryCopyWith<$Res> implements $CatchEntryCopyWith<$Res> {
  factory _$CatchEntryCopyWith(_CatchEntry value, $Res Function(_CatchEntry) _then) = __$CatchEntryCopyWithImpl;
@override @useResult
$Res call({
 String id, String sessionId, int speciesId, String speciesName, int? baitId, String? baitName, int? rigId, String? rigName, double? lengthCm, double? weightKg, DateTime caughtAt, bool released, String? notes, List<CatchPhoto> photos
});




}
/// @nodoc
class __$CatchEntryCopyWithImpl<$Res>
    implements _$CatchEntryCopyWith<$Res> {
  __$CatchEntryCopyWithImpl(this._self, this._then);

  final _CatchEntry _self;
  final $Res Function(_CatchEntry) _then;

/// Create a copy of CatchEntry
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? sessionId = null,Object? speciesId = null,Object? speciesName = null,Object? baitId = freezed,Object? baitName = freezed,Object? rigId = freezed,Object? rigName = freezed,Object? lengthCm = freezed,Object? weightKg = freezed,Object? caughtAt = null,Object? released = null,Object? notes = freezed,Object? photos = null,}) {
  return _then(_CatchEntry(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,sessionId: null == sessionId ? _self.sessionId : sessionId // ignore: cast_nullable_to_non_nullable
as String,speciesId: null == speciesId ? _self.speciesId : speciesId // ignore: cast_nullable_to_non_nullable
as int,speciesName: null == speciesName ? _self.speciesName : speciesName // ignore: cast_nullable_to_non_nullable
as String,baitId: freezed == baitId ? _self.baitId : baitId // ignore: cast_nullable_to_non_nullable
as int?,baitName: freezed == baitName ? _self.baitName : baitName // ignore: cast_nullable_to_non_nullable
as String?,rigId: freezed == rigId ? _self.rigId : rigId // ignore: cast_nullable_to_non_nullable
as int?,rigName: freezed == rigName ? _self.rigName : rigName // ignore: cast_nullable_to_non_nullable
as String?,lengthCm: freezed == lengthCm ? _self.lengthCm : lengthCm // ignore: cast_nullable_to_non_nullable
as double?,weightKg: freezed == weightKg ? _self.weightKg : weightKg // ignore: cast_nullable_to_non_nullable
as double?,caughtAt: null == caughtAt ? _self.caughtAt : caughtAt // ignore: cast_nullable_to_non_nullable
as DateTime,released: null == released ? _self.released : released // ignore: cast_nullable_to_non_nullable
as bool,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,photos: null == photos ? _self._photos : photos // ignore: cast_nullable_to_non_nullable
as List<CatchPhoto>,
  ));
}


}

// dart format on
