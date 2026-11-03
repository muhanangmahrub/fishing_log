// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'catch_photo.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CatchPhoto {

 String get id; String get catchId;/// Relatif ke direktori dokumen aplikasi.
 String get filePath; DateTime get createdAt;
/// Create a copy of CatchPhoto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CatchPhotoCopyWith<CatchPhoto> get copyWith => _$CatchPhotoCopyWithImpl<CatchPhoto>(this as CatchPhoto, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as CatchPhoto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CatchPhoto&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.catchId, _this.catchId) || other.catchId == _this.catchId)&&(identical(other.filePath, _this.filePath) || other.filePath == _this.filePath)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt));
}


@override
int get hashCode {
  final _this = this as CatchPhoto;
  return Object.hash(runtimeType,_this.id,_this.catchId,_this.filePath,_this.createdAt);
}

@override
String toString() {
  final _this = this as CatchPhoto;
  return 'CatchPhoto(id: ${_this.id}, catchId: ${_this.catchId}, filePath: ${_this.filePath}, createdAt: ${_this.createdAt})';
}


}

/// @nodoc
abstract mixin class $CatchPhotoCopyWith<$Res>  {
  factory $CatchPhotoCopyWith(CatchPhoto value, $Res Function(CatchPhoto) _then) = _$CatchPhotoCopyWithImpl;
@useResult
$Res call({
 String id, String catchId, String filePath, DateTime createdAt
});




}
/// @nodoc
class _$CatchPhotoCopyWithImpl<$Res>
    implements $CatchPhotoCopyWith<$Res> {
  _$CatchPhotoCopyWithImpl(this._self, this._then);

  final CatchPhoto _self;
  final $Res Function(CatchPhoto) _then;

/// Create a copy of CatchPhoto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? catchId = null,Object? filePath = null,Object? createdAt = null,}) {
  return _then(CatchPhoto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,catchId: null == catchId ? _self.catchId : catchId // ignore: cast_nullable_to_non_nullable
as String,filePath: null == filePath ? _self.filePath : filePath // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [CatchPhoto].
extension CatchPhotoPatterns on CatchPhoto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CatchPhoto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CatchPhoto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CatchPhoto value)  $default,){
final _that = this;
switch (_that) {
case _CatchPhoto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CatchPhoto value)?  $default,){
final _that = this;
switch (_that) {
case _CatchPhoto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String catchId,  String filePath,  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CatchPhoto() when $default != null:
return $default(_that.id,_that.catchId,_that.filePath,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String catchId,  String filePath,  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _CatchPhoto():
return $default(_that.id,_that.catchId,_that.filePath,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String catchId,  String filePath,  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _CatchPhoto() when $default != null:
return $default(_that.id,_that.catchId,_that.filePath,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc


class _CatchPhoto implements CatchPhoto {
  const _CatchPhoto({required this.id, required this.catchId, required this.filePath, required this.createdAt});
  

@override final  String id;
@override final  String catchId;
/// Relatif ke direktori dokumen aplikasi.
@override final  String filePath;
@override final  DateTime createdAt;

/// Create a copy of CatchPhoto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CatchPhotoCopyWith<_CatchPhoto> get copyWith => __$CatchPhotoCopyWithImpl<_CatchPhoto>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _CatchPhoto&&(identical(other.id, id) || other.id == id)&&(identical(other.catchId, catchId) || other.catchId == catchId)&&(identical(other.filePath, filePath) || other.filePath == filePath)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id,catchId,filePath,createdAt);
}

@override
String toString() {
    return 'CatchPhoto(id: $id, catchId: $catchId, filePath: $filePath, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$CatchPhotoCopyWith<$Res> implements $CatchPhotoCopyWith<$Res> {
  factory _$CatchPhotoCopyWith(_CatchPhoto value, $Res Function(_CatchPhoto) _then) = __$CatchPhotoCopyWithImpl;
@override @useResult
$Res call({
 String id, String catchId, String filePath, DateTime createdAt
});




}
/// @nodoc
class __$CatchPhotoCopyWithImpl<$Res>
    implements _$CatchPhotoCopyWith<$Res> {
  __$CatchPhotoCopyWithImpl(this._self, this._then);

  final _CatchPhoto _self;
  final $Res Function(_CatchPhoto) _then;

/// Create a copy of CatchPhoto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? catchId = null,Object? filePath = null,Object? createdAt = null,}) {
  return _then(_CatchPhoto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,catchId: null == catchId ? _self.catchId : catchId // ignore: cast_nullable_to_non_nullable
as String,filePath: null == filePath ? _self.filePath : filePath // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
