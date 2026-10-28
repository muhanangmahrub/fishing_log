// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fishing_session.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FishingSession {

 String get id; DateTime get startedAt; DateTime? get endedAt; double get latitude; double get longitude; String? get locationName; String? get notes; int? get rating; DateTime get createdAt; DateTime get updatedAt; List<CatchEntry> get catches; WeatherSnapshot? get weather;
/// Create a copy of FishingSession
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FishingSessionCopyWith<FishingSession> get copyWith => _$FishingSessionCopyWithImpl<FishingSession>(this as FishingSession, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as FishingSession;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FishingSession&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.startedAt, _this.startedAt) || other.startedAt == _this.startedAt)&&(identical(other.endedAt, _this.endedAt) || other.endedAt == _this.endedAt)&&(identical(other.latitude, _this.latitude) || other.latitude == _this.latitude)&&(identical(other.longitude, _this.longitude) || other.longitude == _this.longitude)&&(identical(other.locationName, _this.locationName) || other.locationName == _this.locationName)&&(identical(other.notes, _this.notes) || other.notes == _this.notes)&&(identical(other.rating, _this.rating) || other.rating == _this.rating)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt)&&(identical(other.updatedAt, _this.updatedAt) || other.updatedAt == _this.updatedAt)&&const DeepCollectionEquality().equals(other.catches, _this.catches)&&(identical(other.weather, _this.weather) || other.weather == _this.weather));
}


@override
int get hashCode {
  final _this = this as FishingSession;
  return Object.hash(runtimeType,_this.id,_this.startedAt,_this.endedAt,_this.latitude,_this.longitude,_this.locationName,_this.notes,_this.rating,_this.createdAt,_this.updatedAt,const DeepCollectionEquality().hash(_this.catches),_this.weather);
}

@override
String toString() {
  final _this = this as FishingSession;
  return 'FishingSession(id: ${_this.id}, startedAt: ${_this.startedAt}, endedAt: ${_this.endedAt}, latitude: ${_this.latitude}, longitude: ${_this.longitude}, locationName: ${_this.locationName}, notes: ${_this.notes}, rating: ${_this.rating}, createdAt: ${_this.createdAt}, updatedAt: ${_this.updatedAt}, catches: ${_this.catches}, weather: ${_this.weather})';
}


}

/// @nodoc
abstract mixin class $FishingSessionCopyWith<$Res>  {
  factory $FishingSessionCopyWith(FishingSession value, $Res Function(FishingSession) _then) = _$FishingSessionCopyWithImpl;
@useResult
$Res call({
 String id, DateTime startedAt, DateTime? endedAt, double latitude, double longitude, String? locationName, String? notes, int? rating, DateTime createdAt, DateTime updatedAt, List<CatchEntry> catches, WeatherSnapshot? weather
});


$WeatherSnapshotCopyWith<$Res>? get weather;

}
/// @nodoc
class _$FishingSessionCopyWithImpl<$Res>
    implements $FishingSessionCopyWith<$Res> {
  _$FishingSessionCopyWithImpl(this._self, this._then);

  final FishingSession _self;
  final $Res Function(FishingSession) _then;

/// Create a copy of FishingSession
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? startedAt = null,Object? endedAt = freezed,Object? latitude = null,Object? longitude = null,Object? locationName = freezed,Object? notes = freezed,Object? rating = freezed,Object? createdAt = null,Object? updatedAt = null,Object? catches = null,Object? weather = freezed,}) {
  return _then(FishingSession(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,startedAt: null == startedAt ? _self.startedAt : startedAt // ignore: cast_nullable_to_non_nullable
as DateTime,endedAt: freezed == endedAt ? _self.endedAt : endedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,locationName: freezed == locationName ? _self.locationName : locationName // ignore: cast_nullable_to_non_nullable
as String?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,rating: freezed == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as int?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,catches: null == catches ? _self.catches : catches // ignore: cast_nullable_to_non_nullable
as List<CatchEntry>,weather: freezed == weather ? _self.weather : weather // ignore: cast_nullable_to_non_nullable
as WeatherSnapshot?,
  ));
}
/// Create a copy of FishingSession
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WeatherSnapshotCopyWith<$Res>? get weather {
    if (_self.weather == null) {
    return null;
  }

  return $WeatherSnapshotCopyWith<$Res>(_self.weather!, (value) {
    return _then(_self.copyWith(weather: value));
  });
}
}


/// Adds pattern-matching-related methods to [FishingSession].
extension FishingSessionPatterns on FishingSession {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FishingSession value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FishingSession() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FishingSession value)  $default,){
final _that = this;
switch (_that) {
case _FishingSession():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FishingSession value)?  $default,){
final _that = this;
switch (_that) {
case _FishingSession() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  DateTime startedAt,  DateTime? endedAt,  double latitude,  double longitude,  String? locationName,  String? notes,  int? rating,  DateTime createdAt,  DateTime updatedAt,  List<CatchEntry> catches,  WeatherSnapshot? weather)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FishingSession() when $default != null:
return $default(_that.id,_that.startedAt,_that.endedAt,_that.latitude,_that.longitude,_that.locationName,_that.notes,_that.rating,_that.createdAt,_that.updatedAt,_that.catches,_that.weather);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  DateTime startedAt,  DateTime? endedAt,  double latitude,  double longitude,  String? locationName,  String? notes,  int? rating,  DateTime createdAt,  DateTime updatedAt,  List<CatchEntry> catches,  WeatherSnapshot? weather)  $default,) {final _that = this;
switch (_that) {
case _FishingSession():
return $default(_that.id,_that.startedAt,_that.endedAt,_that.latitude,_that.longitude,_that.locationName,_that.notes,_that.rating,_that.createdAt,_that.updatedAt,_that.catches,_that.weather);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  DateTime startedAt,  DateTime? endedAt,  double latitude,  double longitude,  String? locationName,  String? notes,  int? rating,  DateTime createdAt,  DateTime updatedAt,  List<CatchEntry> catches,  WeatherSnapshot? weather)?  $default,) {final _that = this;
switch (_that) {
case _FishingSession() when $default != null:
return $default(_that.id,_that.startedAt,_that.endedAt,_that.latitude,_that.longitude,_that.locationName,_that.notes,_that.rating,_that.createdAt,_that.updatedAt,_that.catches,_that.weather);case _:
  return null;

}
}

}

/// @nodoc


class _FishingSession extends FishingSession {
  const _FishingSession({required this.id, required this.startedAt, this.endedAt, required this.latitude, required this.longitude, this.locationName, this.notes, this.rating, required this.createdAt, required this.updatedAt,  List<CatchEntry> catches = const [], this.weather}): _catches = catches,super._();
  

@override final  String id;
@override final  DateTime startedAt;
@override final  DateTime? endedAt;
@override final  double latitude;
@override final  double longitude;
@override final  String? locationName;
@override final  String? notes;
@override final  int? rating;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;
 final  List<CatchEntry> _catches;
@override@JsonKey() List<CatchEntry> get catches {
  if (_catches is EqualUnmodifiableListView) return _catches;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_catches);
}

@override final  WeatherSnapshot? weather;

/// Create a copy of FishingSession
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FishingSessionCopyWith<_FishingSession> get copyWith => __$FishingSessionCopyWithImpl<_FishingSession>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _FishingSession&&(identical(other.id, id) || other.id == id)&&(identical(other.startedAt, startedAt) || other.startedAt == startedAt)&&(identical(other.endedAt, endedAt) || other.endedAt == endedAt)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.locationName, locationName) || other.locationName == locationName)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&const DeepCollectionEquality().equals(other.catches, _catches)&&(identical(other.weather, weather) || other.weather == weather));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id,startedAt,endedAt,latitude,longitude,locationName,notes,rating,createdAt,updatedAt,const DeepCollectionEquality().hash(_catches),weather);
}

@override
String toString() {
    return 'FishingSession(id: $id, startedAt: $startedAt, endedAt: $endedAt, latitude: $latitude, longitude: $longitude, locationName: $locationName, notes: $notes, rating: $rating, createdAt: $createdAt, updatedAt: $updatedAt, catches: $catches, weather: $weather)';
}


}

/// @nodoc
abstract mixin class _$FishingSessionCopyWith<$Res> implements $FishingSessionCopyWith<$Res> {
  factory _$FishingSessionCopyWith(_FishingSession value, $Res Function(_FishingSession) _then) = __$FishingSessionCopyWithImpl;
@override @useResult
$Res call({
 String id, DateTime startedAt, DateTime? endedAt, double latitude, double longitude, String? locationName, String? notes, int? rating, DateTime createdAt, DateTime updatedAt, List<CatchEntry> catches, WeatherSnapshot? weather
});


@override $WeatherSnapshotCopyWith<$Res>? get weather;

}
/// @nodoc
class __$FishingSessionCopyWithImpl<$Res>
    implements _$FishingSessionCopyWith<$Res> {
  __$FishingSessionCopyWithImpl(this._self, this._then);

  final _FishingSession _self;
  final $Res Function(_FishingSession) _then;

/// Create a copy of FishingSession
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? startedAt = null,Object? endedAt = freezed,Object? latitude = null,Object? longitude = null,Object? locationName = freezed,Object? notes = freezed,Object? rating = freezed,Object? createdAt = null,Object? updatedAt = null,Object? catches = null,Object? weather = freezed,}) {
  return _then(_FishingSession(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,startedAt: null == startedAt ? _self.startedAt : startedAt // ignore: cast_nullable_to_non_nullable
as DateTime,endedAt: freezed == endedAt ? _self.endedAt : endedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,locationName: freezed == locationName ? _self.locationName : locationName // ignore: cast_nullable_to_non_nullable
as String?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,rating: freezed == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as int?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,catches: null == catches ? _self._catches : catches // ignore: cast_nullable_to_non_nullable
as List<CatchEntry>,weather: freezed == weather ? _self.weather : weather // ignore: cast_nullable_to_non_nullable
as WeatherSnapshot?,
  ));
}

/// Create a copy of FishingSession
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WeatherSnapshotCopyWith<$Res>? get weather {
    if (_self.weather == null) {
    return null;
  }

  return $WeatherSnapshotCopyWith<$Res>(_self.weather!, (value) {
    return _then(_self.copyWith(weather: value));
  });
}
}

// dart format on
