// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'weather_snapshot.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$WeatherSnapshot {

 String get sessionId; DateTime get fetchedAt; double get temperatureC; double get apparentTempC; double get humidity; double get pressureHpa; double get windSpeedKmh; double get windDirectionDeg; double get cloudCover; double get precipitationMm; int get weatherCode; String get rawJson;
/// Create a copy of WeatherSnapshot
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WeatherSnapshotCopyWith<WeatherSnapshot> get copyWith => _$WeatherSnapshotCopyWithImpl<WeatherSnapshot>(this as WeatherSnapshot, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as WeatherSnapshot;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WeatherSnapshot&&(identical(other.sessionId, _this.sessionId) || other.sessionId == _this.sessionId)&&(identical(other.fetchedAt, _this.fetchedAt) || other.fetchedAt == _this.fetchedAt)&&(identical(other.temperatureC, _this.temperatureC) || other.temperatureC == _this.temperatureC)&&(identical(other.apparentTempC, _this.apparentTempC) || other.apparentTempC == _this.apparentTempC)&&(identical(other.humidity, _this.humidity) || other.humidity == _this.humidity)&&(identical(other.pressureHpa, _this.pressureHpa) || other.pressureHpa == _this.pressureHpa)&&(identical(other.windSpeedKmh, _this.windSpeedKmh) || other.windSpeedKmh == _this.windSpeedKmh)&&(identical(other.windDirectionDeg, _this.windDirectionDeg) || other.windDirectionDeg == _this.windDirectionDeg)&&(identical(other.cloudCover, _this.cloudCover) || other.cloudCover == _this.cloudCover)&&(identical(other.precipitationMm, _this.precipitationMm) || other.precipitationMm == _this.precipitationMm)&&(identical(other.weatherCode, _this.weatherCode) || other.weatherCode == _this.weatherCode)&&(identical(other.rawJson, _this.rawJson) || other.rawJson == _this.rawJson));
}


@override
int get hashCode {
  final _this = this as WeatherSnapshot;
  return Object.hash(runtimeType,_this.sessionId,_this.fetchedAt,_this.temperatureC,_this.apparentTempC,_this.humidity,_this.pressureHpa,_this.windSpeedKmh,_this.windDirectionDeg,_this.cloudCover,_this.precipitationMm,_this.weatherCode,_this.rawJson);
}

@override
String toString() {
  final _this = this as WeatherSnapshot;
  return 'WeatherSnapshot(sessionId: ${_this.sessionId}, fetchedAt: ${_this.fetchedAt}, temperatureC: ${_this.temperatureC}, apparentTempC: ${_this.apparentTempC}, humidity: ${_this.humidity}, pressureHpa: ${_this.pressureHpa}, windSpeedKmh: ${_this.windSpeedKmh}, windDirectionDeg: ${_this.windDirectionDeg}, cloudCover: ${_this.cloudCover}, precipitationMm: ${_this.precipitationMm}, weatherCode: ${_this.weatherCode}, rawJson: ${_this.rawJson})';
}


}

/// @nodoc
abstract mixin class $WeatherSnapshotCopyWith<$Res>  {
  factory $WeatherSnapshotCopyWith(WeatherSnapshot value, $Res Function(WeatherSnapshot) _then) = _$WeatherSnapshotCopyWithImpl;
@useResult
$Res call({
 String sessionId, DateTime fetchedAt, double temperatureC, double apparentTempC, double humidity, double pressureHpa, double windSpeedKmh, double windDirectionDeg, double cloudCover, double precipitationMm, int weatherCode, String rawJson
});




}
/// @nodoc
class _$WeatherSnapshotCopyWithImpl<$Res>
    implements $WeatherSnapshotCopyWith<$Res> {
  _$WeatherSnapshotCopyWithImpl(this._self, this._then);

  final WeatherSnapshot _self;
  final $Res Function(WeatherSnapshot) _then;

/// Create a copy of WeatherSnapshot
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? sessionId = null,Object? fetchedAt = null,Object? temperatureC = null,Object? apparentTempC = null,Object? humidity = null,Object? pressureHpa = null,Object? windSpeedKmh = null,Object? windDirectionDeg = null,Object? cloudCover = null,Object? precipitationMm = null,Object? weatherCode = null,Object? rawJson = null,}) {
  return _then(WeatherSnapshot(
sessionId: null == sessionId ? _self.sessionId : sessionId // ignore: cast_nullable_to_non_nullable
as String,fetchedAt: null == fetchedAt ? _self.fetchedAt : fetchedAt // ignore: cast_nullable_to_non_nullable
as DateTime,temperatureC: null == temperatureC ? _self.temperatureC : temperatureC // ignore: cast_nullable_to_non_nullable
as double,apparentTempC: null == apparentTempC ? _self.apparentTempC : apparentTempC // ignore: cast_nullable_to_non_nullable
as double,humidity: null == humidity ? _self.humidity : humidity // ignore: cast_nullable_to_non_nullable
as double,pressureHpa: null == pressureHpa ? _self.pressureHpa : pressureHpa // ignore: cast_nullable_to_non_nullable
as double,windSpeedKmh: null == windSpeedKmh ? _self.windSpeedKmh : windSpeedKmh // ignore: cast_nullable_to_non_nullable
as double,windDirectionDeg: null == windDirectionDeg ? _self.windDirectionDeg : windDirectionDeg // ignore: cast_nullable_to_non_nullable
as double,cloudCover: null == cloudCover ? _self.cloudCover : cloudCover // ignore: cast_nullable_to_non_nullable
as double,precipitationMm: null == precipitationMm ? _self.precipitationMm : precipitationMm // ignore: cast_nullable_to_non_nullable
as double,weatherCode: null == weatherCode ? _self.weatherCode : weatherCode // ignore: cast_nullable_to_non_nullable
as int,rawJson: null == rawJson ? _self.rawJson : rawJson // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [WeatherSnapshot].
extension WeatherSnapshotPatterns on WeatherSnapshot {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WeatherSnapshot value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WeatherSnapshot() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WeatherSnapshot value)  $default,){
final _that = this;
switch (_that) {
case _WeatherSnapshot():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WeatherSnapshot value)?  $default,){
final _that = this;
switch (_that) {
case _WeatherSnapshot() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String sessionId,  DateTime fetchedAt,  double temperatureC,  double apparentTempC,  double humidity,  double pressureHpa,  double windSpeedKmh,  double windDirectionDeg,  double cloudCover,  double precipitationMm,  int weatherCode,  String rawJson)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WeatherSnapshot() when $default != null:
return $default(_that.sessionId,_that.fetchedAt,_that.temperatureC,_that.apparentTempC,_that.humidity,_that.pressureHpa,_that.windSpeedKmh,_that.windDirectionDeg,_that.cloudCover,_that.precipitationMm,_that.weatherCode,_that.rawJson);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String sessionId,  DateTime fetchedAt,  double temperatureC,  double apparentTempC,  double humidity,  double pressureHpa,  double windSpeedKmh,  double windDirectionDeg,  double cloudCover,  double precipitationMm,  int weatherCode,  String rawJson)  $default,) {final _that = this;
switch (_that) {
case _WeatherSnapshot():
return $default(_that.sessionId,_that.fetchedAt,_that.temperatureC,_that.apparentTempC,_that.humidity,_that.pressureHpa,_that.windSpeedKmh,_that.windDirectionDeg,_that.cloudCover,_that.precipitationMm,_that.weatherCode,_that.rawJson);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String sessionId,  DateTime fetchedAt,  double temperatureC,  double apparentTempC,  double humidity,  double pressureHpa,  double windSpeedKmh,  double windDirectionDeg,  double cloudCover,  double precipitationMm,  int weatherCode,  String rawJson)?  $default,) {final _that = this;
switch (_that) {
case _WeatherSnapshot() when $default != null:
return $default(_that.sessionId,_that.fetchedAt,_that.temperatureC,_that.apparentTempC,_that.humidity,_that.pressureHpa,_that.windSpeedKmh,_that.windDirectionDeg,_that.cloudCover,_that.precipitationMm,_that.weatherCode,_that.rawJson);case _:
  return null;

}
}

}

/// @nodoc


class _WeatherSnapshot implements WeatherSnapshot {
  const _WeatherSnapshot({required this.sessionId, required this.fetchedAt, required this.temperatureC, required this.apparentTempC, required this.humidity, required this.pressureHpa, required this.windSpeedKmh, required this.windDirectionDeg, required this.cloudCover, required this.precipitationMm, required this.weatherCode, required this.rawJson});
  

@override final  String sessionId;
@override final  DateTime fetchedAt;
@override final  double temperatureC;
@override final  double apparentTempC;
@override final  double humidity;
@override final  double pressureHpa;
@override final  double windSpeedKmh;
@override final  double windDirectionDeg;
@override final  double cloudCover;
@override final  double precipitationMm;
@override final  int weatherCode;
@override final  String rawJson;

/// Create a copy of WeatherSnapshot
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WeatherSnapshotCopyWith<_WeatherSnapshot> get copyWith => __$WeatherSnapshotCopyWithImpl<_WeatherSnapshot>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _WeatherSnapshot&&(identical(other.sessionId, sessionId) || other.sessionId == sessionId)&&(identical(other.fetchedAt, fetchedAt) || other.fetchedAt == fetchedAt)&&(identical(other.temperatureC, temperatureC) || other.temperatureC == temperatureC)&&(identical(other.apparentTempC, apparentTempC) || other.apparentTempC == apparentTempC)&&(identical(other.humidity, humidity) || other.humidity == humidity)&&(identical(other.pressureHpa, pressureHpa) || other.pressureHpa == pressureHpa)&&(identical(other.windSpeedKmh, windSpeedKmh) || other.windSpeedKmh == windSpeedKmh)&&(identical(other.windDirectionDeg, windDirectionDeg) || other.windDirectionDeg == windDirectionDeg)&&(identical(other.cloudCover, cloudCover) || other.cloudCover == cloudCover)&&(identical(other.precipitationMm, precipitationMm) || other.precipitationMm == precipitationMm)&&(identical(other.weatherCode, weatherCode) || other.weatherCode == weatherCode)&&(identical(other.rawJson, rawJson) || other.rawJson == rawJson));
}


@override
int get hashCode {
    return Object.hash(runtimeType,sessionId,fetchedAt,temperatureC,apparentTempC,humidity,pressureHpa,windSpeedKmh,windDirectionDeg,cloudCover,precipitationMm,weatherCode,rawJson);
}

@override
String toString() {
    return 'WeatherSnapshot(sessionId: $sessionId, fetchedAt: $fetchedAt, temperatureC: $temperatureC, apparentTempC: $apparentTempC, humidity: $humidity, pressureHpa: $pressureHpa, windSpeedKmh: $windSpeedKmh, windDirectionDeg: $windDirectionDeg, cloudCover: $cloudCover, precipitationMm: $precipitationMm, weatherCode: $weatherCode, rawJson: $rawJson)';
}


}

/// @nodoc
abstract mixin class _$WeatherSnapshotCopyWith<$Res> implements $WeatherSnapshotCopyWith<$Res> {
  factory _$WeatherSnapshotCopyWith(_WeatherSnapshot value, $Res Function(_WeatherSnapshot) _then) = __$WeatherSnapshotCopyWithImpl;
@override @useResult
$Res call({
 String sessionId, DateTime fetchedAt, double temperatureC, double apparentTempC, double humidity, double pressureHpa, double windSpeedKmh, double windDirectionDeg, double cloudCover, double precipitationMm, int weatherCode, String rawJson
});




}
/// @nodoc
class __$WeatherSnapshotCopyWithImpl<$Res>
    implements _$WeatherSnapshotCopyWith<$Res> {
  __$WeatherSnapshotCopyWithImpl(this._self, this._then);

  final _WeatherSnapshot _self;
  final $Res Function(_WeatherSnapshot) _then;

/// Create a copy of WeatherSnapshot
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? sessionId = null,Object? fetchedAt = null,Object? temperatureC = null,Object? apparentTempC = null,Object? humidity = null,Object? pressureHpa = null,Object? windSpeedKmh = null,Object? windDirectionDeg = null,Object? cloudCover = null,Object? precipitationMm = null,Object? weatherCode = null,Object? rawJson = null,}) {
  return _then(_WeatherSnapshot(
sessionId: null == sessionId ? _self.sessionId : sessionId // ignore: cast_nullable_to_non_nullable
as String,fetchedAt: null == fetchedAt ? _self.fetchedAt : fetchedAt // ignore: cast_nullable_to_non_nullable
as DateTime,temperatureC: null == temperatureC ? _self.temperatureC : temperatureC // ignore: cast_nullable_to_non_nullable
as double,apparentTempC: null == apparentTempC ? _self.apparentTempC : apparentTempC // ignore: cast_nullable_to_non_nullable
as double,humidity: null == humidity ? _self.humidity : humidity // ignore: cast_nullable_to_non_nullable
as double,pressureHpa: null == pressureHpa ? _self.pressureHpa : pressureHpa // ignore: cast_nullable_to_non_nullable
as double,windSpeedKmh: null == windSpeedKmh ? _self.windSpeedKmh : windSpeedKmh // ignore: cast_nullable_to_non_nullable
as double,windDirectionDeg: null == windDirectionDeg ? _self.windDirectionDeg : windDirectionDeg // ignore: cast_nullable_to_non_nullable
as double,cloudCover: null == cloudCover ? _self.cloudCover : cloudCover // ignore: cast_nullable_to_non_nullable
as double,precipitationMm: null == precipitationMm ? _self.precipitationMm : precipitationMm // ignore: cast_nullable_to_non_nullable
as double,weatherCode: null == weatherCode ? _self.weatherCode : weatherCode // ignore: cast_nullable_to_non_nullable
as int,rawJson: null == rawJson ? _self.rawJson : rawJson // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
