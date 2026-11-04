// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'session_stats.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$StatGroup {

 String get label; int get sampleSessions; int get totalCatches;
/// Create a copy of StatGroup
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StatGroupCopyWith<StatGroup> get copyWith => _$StatGroupCopyWithImpl<StatGroup>(this as StatGroup, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as StatGroup;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StatGroup&&(identical(other.label, _this.label) || other.label == _this.label)&&(identical(other.sampleSessions, _this.sampleSessions) || other.sampleSessions == _this.sampleSessions)&&(identical(other.totalCatches, _this.totalCatches) || other.totalCatches == _this.totalCatches));
}


@override
int get hashCode {
  final _this = this as StatGroup;
  return Object.hash(runtimeType,_this.label,_this.sampleSessions,_this.totalCatches);
}

@override
String toString() {
  final _this = this as StatGroup;
  return 'StatGroup(label: ${_this.label}, sampleSessions: ${_this.sampleSessions}, totalCatches: ${_this.totalCatches})';
}


}

/// @nodoc
abstract mixin class $StatGroupCopyWith<$Res>  {
  factory $StatGroupCopyWith(StatGroup value, $Res Function(StatGroup) _then) = _$StatGroupCopyWithImpl;
@useResult
$Res call({
 String label, int sampleSessions, int totalCatches
});




}
/// @nodoc
class _$StatGroupCopyWithImpl<$Res>
    implements $StatGroupCopyWith<$Res> {
  _$StatGroupCopyWithImpl(this._self, this._then);

  final StatGroup _self;
  final $Res Function(StatGroup) _then;

/// Create a copy of StatGroup
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? label = null,Object? sampleSessions = null,Object? totalCatches = null,}) {
  return _then(StatGroup(
label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,sampleSessions: null == sampleSessions ? _self.sampleSessions : sampleSessions // ignore: cast_nullable_to_non_nullable
as int,totalCatches: null == totalCatches ? _self.totalCatches : totalCatches // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [StatGroup].
extension StatGroupPatterns on StatGroup {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StatGroup value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StatGroup() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StatGroup value)  $default,){
final _that = this;
switch (_that) {
case _StatGroup():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StatGroup value)?  $default,){
final _that = this;
switch (_that) {
case _StatGroup() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String label,  int sampleSessions,  int totalCatches)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StatGroup() when $default != null:
return $default(_that.label,_that.sampleSessions,_that.totalCatches);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String label,  int sampleSessions,  int totalCatches)  $default,) {final _that = this;
switch (_that) {
case _StatGroup():
return $default(_that.label,_that.sampleSessions,_that.totalCatches);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String label,  int sampleSessions,  int totalCatches)?  $default,) {final _that = this;
switch (_that) {
case _StatGroup() when $default != null:
return $default(_that.label,_that.sampleSessions,_that.totalCatches);case _:
  return null;

}
}

}

/// @nodoc


class _StatGroup extends StatGroup {
  const _StatGroup({required this.label, required this.sampleSessions, required this.totalCatches}): super._();
  

@override final  String label;
@override final  int sampleSessions;
@override final  int totalCatches;

/// Create a copy of StatGroup
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StatGroupCopyWith<_StatGroup> get copyWith => __$StatGroupCopyWithImpl<_StatGroup>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _StatGroup&&(identical(other.label, label) || other.label == label)&&(identical(other.sampleSessions, sampleSessions) || other.sampleSessions == sampleSessions)&&(identical(other.totalCatches, totalCatches) || other.totalCatches == totalCatches));
}


@override
int get hashCode {
    return Object.hash(runtimeType,label,sampleSessions,totalCatches);
}

@override
String toString() {
    return 'StatGroup(label: $label, sampleSessions: $sampleSessions, totalCatches: $totalCatches)';
}


}

/// @nodoc
abstract mixin class _$StatGroupCopyWith<$Res> implements $StatGroupCopyWith<$Res> {
  factory _$StatGroupCopyWith(_StatGroup value, $Res Function(_StatGroup) _then) = __$StatGroupCopyWithImpl;
@override @useResult
$Res call({
 String label, int sampleSessions, int totalCatches
});




}
/// @nodoc
class __$StatGroupCopyWithImpl<$Res>
    implements _$StatGroupCopyWith<$Res> {
  __$StatGroupCopyWithImpl(this._self, this._then);

  final _StatGroup _self;
  final $Res Function(_StatGroup) _then;

/// Create a copy of StatGroup
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? label = null,Object? sampleSessions = null,Object? totalCatches = null,}) {
  return _then(_StatGroup(
label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,sampleSessions: null == sampleSessions ? _self.sampleSessions : sampleSessions // ignore: cast_nullable_to_non_nullable
as int,totalCatches: null == totalCatches ? _self.totalCatches : totalCatches // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$CountStat {

 String get label; int get count;
/// Create a copy of CountStat
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CountStatCopyWith<CountStat> get copyWith => _$CountStatCopyWithImpl<CountStat>(this as CountStat, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as CountStat;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CountStat&&(identical(other.label, _this.label) || other.label == _this.label)&&(identical(other.count, _this.count) || other.count == _this.count));
}


@override
int get hashCode {
  final _this = this as CountStat;
  return Object.hash(runtimeType,_this.label,_this.count);
}

@override
String toString() {
  final _this = this as CountStat;
  return 'CountStat(label: ${_this.label}, count: ${_this.count})';
}


}

/// @nodoc
abstract mixin class $CountStatCopyWith<$Res>  {
  factory $CountStatCopyWith(CountStat value, $Res Function(CountStat) _then) = _$CountStatCopyWithImpl;
@useResult
$Res call({
 String label, int count
});




}
/// @nodoc
class _$CountStatCopyWithImpl<$Res>
    implements $CountStatCopyWith<$Res> {
  _$CountStatCopyWithImpl(this._self, this._then);

  final CountStat _self;
  final $Res Function(CountStat) _then;

/// Create a copy of CountStat
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? label = null,Object? count = null,}) {
  return _then(CountStat(
label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [CountStat].
extension CountStatPatterns on CountStat {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CountStat value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CountStat() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CountStat value)  $default,){
final _that = this;
switch (_that) {
case _CountStat():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CountStat value)?  $default,){
final _that = this;
switch (_that) {
case _CountStat() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String label,  int count)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CountStat() when $default != null:
return $default(_that.label,_that.count);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String label,  int count)  $default,) {final _that = this;
switch (_that) {
case _CountStat():
return $default(_that.label,_that.count);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String label,  int count)?  $default,) {final _that = this;
switch (_that) {
case _CountStat() when $default != null:
return $default(_that.label,_that.count);case _:
  return null;

}
}

}

/// @nodoc


class _CountStat implements CountStat {
  const _CountStat({required this.label, required this.count});
  

@override final  String label;
@override final  int count;

/// Create a copy of CountStat
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CountStatCopyWith<_CountStat> get copyWith => __$CountStatCopyWithImpl<_CountStat>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _CountStat&&(identical(other.label, label) || other.label == label)&&(identical(other.count, count) || other.count == count));
}


@override
int get hashCode {
    return Object.hash(runtimeType,label,count);
}

@override
String toString() {
    return 'CountStat(label: $label, count: $count)';
}


}

/// @nodoc
abstract mixin class _$CountStatCopyWith<$Res> implements $CountStatCopyWith<$Res> {
  factory _$CountStatCopyWith(_CountStat value, $Res Function(_CountStat) _then) = __$CountStatCopyWithImpl;
@override @useResult
$Res call({
 String label, int count
});




}
/// @nodoc
class __$CountStatCopyWithImpl<$Res>
    implements _$CountStatCopyWith<$Res> {
  __$CountStatCopyWithImpl(this._self, this._then);

  final _CountStat _self;
  final $Res Function(_CountStat) _then;

/// Create a copy of CountStat
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? label = null,Object? count = null,}) {
  return _then(_CountStat(
label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$SizeRecord {

 String get speciesName; double? get maxLengthCm; double? get maxWeightKg;
/// Create a copy of SizeRecord
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SizeRecordCopyWith<SizeRecord> get copyWith => _$SizeRecordCopyWithImpl<SizeRecord>(this as SizeRecord, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as SizeRecord;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SizeRecord&&(identical(other.speciesName, _this.speciesName) || other.speciesName == _this.speciesName)&&(identical(other.maxLengthCm, _this.maxLengthCm) || other.maxLengthCm == _this.maxLengthCm)&&(identical(other.maxWeightKg, _this.maxWeightKg) || other.maxWeightKg == _this.maxWeightKg));
}


@override
int get hashCode {
  final _this = this as SizeRecord;
  return Object.hash(runtimeType,_this.speciesName,_this.maxLengthCm,_this.maxWeightKg);
}

@override
String toString() {
  final _this = this as SizeRecord;
  return 'SizeRecord(speciesName: ${_this.speciesName}, maxLengthCm: ${_this.maxLengthCm}, maxWeightKg: ${_this.maxWeightKg})';
}


}

/// @nodoc
abstract mixin class $SizeRecordCopyWith<$Res>  {
  factory $SizeRecordCopyWith(SizeRecord value, $Res Function(SizeRecord) _then) = _$SizeRecordCopyWithImpl;
@useResult
$Res call({
 String speciesName, double? maxLengthCm, double? maxWeightKg
});




}
/// @nodoc
class _$SizeRecordCopyWithImpl<$Res>
    implements $SizeRecordCopyWith<$Res> {
  _$SizeRecordCopyWithImpl(this._self, this._then);

  final SizeRecord _self;
  final $Res Function(SizeRecord) _then;

/// Create a copy of SizeRecord
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? speciesName = null,Object? maxLengthCm = freezed,Object? maxWeightKg = freezed,}) {
  return _then(SizeRecord(
speciesName: null == speciesName ? _self.speciesName : speciesName // ignore: cast_nullable_to_non_nullable
as String,maxLengthCm: freezed == maxLengthCm ? _self.maxLengthCm : maxLengthCm // ignore: cast_nullable_to_non_nullable
as double?,maxWeightKg: freezed == maxWeightKg ? _self.maxWeightKg : maxWeightKg // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [SizeRecord].
extension SizeRecordPatterns on SizeRecord {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SizeRecord value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SizeRecord() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SizeRecord value)  $default,){
final _that = this;
switch (_that) {
case _SizeRecord():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SizeRecord value)?  $default,){
final _that = this;
switch (_that) {
case _SizeRecord() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String speciesName,  double? maxLengthCm,  double? maxWeightKg)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SizeRecord() when $default != null:
return $default(_that.speciesName,_that.maxLengthCm,_that.maxWeightKg);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String speciesName,  double? maxLengthCm,  double? maxWeightKg)  $default,) {final _that = this;
switch (_that) {
case _SizeRecord():
return $default(_that.speciesName,_that.maxLengthCm,_that.maxWeightKg);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String speciesName,  double? maxLengthCm,  double? maxWeightKg)?  $default,) {final _that = this;
switch (_that) {
case _SizeRecord() when $default != null:
return $default(_that.speciesName,_that.maxLengthCm,_that.maxWeightKg);case _:
  return null;

}
}

}

/// @nodoc


class _SizeRecord implements SizeRecord {
  const _SizeRecord({required this.speciesName, this.maxLengthCm, this.maxWeightKg});
  

@override final  String speciesName;
@override final  double? maxLengthCm;
@override final  double? maxWeightKg;

/// Create a copy of SizeRecord
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SizeRecordCopyWith<_SizeRecord> get copyWith => __$SizeRecordCopyWithImpl<_SizeRecord>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SizeRecord&&(identical(other.speciesName, speciesName) || other.speciesName == speciesName)&&(identical(other.maxLengthCm, maxLengthCm) || other.maxLengthCm == maxLengthCm)&&(identical(other.maxWeightKg, maxWeightKg) || other.maxWeightKg == maxWeightKg));
}


@override
int get hashCode {
    return Object.hash(runtimeType,speciesName,maxLengthCm,maxWeightKg);
}

@override
String toString() {
    return 'SizeRecord(speciesName: $speciesName, maxLengthCm: $maxLengthCm, maxWeightKg: $maxWeightKg)';
}


}

/// @nodoc
abstract mixin class _$SizeRecordCopyWith<$Res> implements $SizeRecordCopyWith<$Res> {
  factory _$SizeRecordCopyWith(_SizeRecord value, $Res Function(_SizeRecord) _then) = __$SizeRecordCopyWithImpl;
@override @useResult
$Res call({
 String speciesName, double? maxLengthCm, double? maxWeightKg
});




}
/// @nodoc
class __$SizeRecordCopyWithImpl<$Res>
    implements _$SizeRecordCopyWith<$Res> {
  __$SizeRecordCopyWithImpl(this._self, this._then);

  final _SizeRecord _self;
  final $Res Function(_SizeRecord) _then;

/// Create a copy of SizeRecord
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? speciesName = null,Object? maxLengthCm = freezed,Object? maxWeightKg = freezed,}) {
  return _then(_SizeRecord(
speciesName: null == speciesName ? _self.speciesName : speciesName // ignore: cast_nullable_to_non_nullable
as String,maxLengthCm: freezed == maxLengthCm ? _self.maxLengthCm : maxLengthCm // ignore: cast_nullable_to_non_nullable
as double?,maxWeightKg: freezed == maxWeightKg ? _self.maxWeightKg : maxWeightKg // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}

/// @nodoc
mixin _$SessionStats {

 int get totalSessions; int get blankSessions; int get totalCatches; List<StatGroup> get byTimeOfDay; List<StatGroup> get byWeather; List<StatGroup> get byPressure; List<StatGroup> get byMoon; List<StatGroup> get byLocation;/// Sesi tanpa cuaca: tidak masuk [byWeather] dan [byPressure].
 int get skippedNoWeather; List<CountStat> get bySpecies; List<CountStat> get byBait; List<CountStat> get byRig; List<SizeRecord> get biggestBySpecies;
/// Create a copy of SessionStats
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SessionStatsCopyWith<SessionStats> get copyWith => _$SessionStatsCopyWithImpl<SessionStats>(this as SessionStats, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as SessionStats;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SessionStats&&(identical(other.totalSessions, _this.totalSessions) || other.totalSessions == _this.totalSessions)&&(identical(other.blankSessions, _this.blankSessions) || other.blankSessions == _this.blankSessions)&&(identical(other.totalCatches, _this.totalCatches) || other.totalCatches == _this.totalCatches)&&const DeepCollectionEquality().equals(other.byTimeOfDay, _this.byTimeOfDay)&&const DeepCollectionEquality().equals(other.byWeather, _this.byWeather)&&const DeepCollectionEquality().equals(other.byPressure, _this.byPressure)&&const DeepCollectionEquality().equals(other.byMoon, _this.byMoon)&&const DeepCollectionEquality().equals(other.byLocation, _this.byLocation)&&(identical(other.skippedNoWeather, _this.skippedNoWeather) || other.skippedNoWeather == _this.skippedNoWeather)&&const DeepCollectionEquality().equals(other.bySpecies, _this.bySpecies)&&const DeepCollectionEquality().equals(other.byBait, _this.byBait)&&const DeepCollectionEquality().equals(other.byRig, _this.byRig)&&const DeepCollectionEquality().equals(other.biggestBySpecies, _this.biggestBySpecies));
}


@override
int get hashCode {
  final _this = this as SessionStats;
  return Object.hash(runtimeType,_this.totalSessions,_this.blankSessions,_this.totalCatches,const DeepCollectionEquality().hash(_this.byTimeOfDay),const DeepCollectionEquality().hash(_this.byWeather),const DeepCollectionEquality().hash(_this.byPressure),const DeepCollectionEquality().hash(_this.byMoon),const DeepCollectionEquality().hash(_this.byLocation),_this.skippedNoWeather,const DeepCollectionEquality().hash(_this.bySpecies),const DeepCollectionEquality().hash(_this.byBait),const DeepCollectionEquality().hash(_this.byRig),const DeepCollectionEquality().hash(_this.biggestBySpecies));
}

@override
String toString() {
  final _this = this as SessionStats;
  return 'SessionStats(totalSessions: ${_this.totalSessions}, blankSessions: ${_this.blankSessions}, totalCatches: ${_this.totalCatches}, byTimeOfDay: ${_this.byTimeOfDay}, byWeather: ${_this.byWeather}, byPressure: ${_this.byPressure}, byMoon: ${_this.byMoon}, byLocation: ${_this.byLocation}, skippedNoWeather: ${_this.skippedNoWeather}, bySpecies: ${_this.bySpecies}, byBait: ${_this.byBait}, byRig: ${_this.byRig}, biggestBySpecies: ${_this.biggestBySpecies})';
}


}

/// @nodoc
abstract mixin class $SessionStatsCopyWith<$Res>  {
  factory $SessionStatsCopyWith(SessionStats value, $Res Function(SessionStats) _then) = _$SessionStatsCopyWithImpl;
@useResult
$Res call({
 int totalSessions, int blankSessions, int totalCatches, List<StatGroup> byTimeOfDay, List<StatGroup> byWeather, List<StatGroup> byPressure, List<StatGroup> byMoon, List<StatGroup> byLocation, int skippedNoWeather, List<CountStat> bySpecies, List<CountStat> byBait, List<CountStat> byRig, List<SizeRecord> biggestBySpecies
});




}
/// @nodoc
class _$SessionStatsCopyWithImpl<$Res>
    implements $SessionStatsCopyWith<$Res> {
  _$SessionStatsCopyWithImpl(this._self, this._then);

  final SessionStats _self;
  final $Res Function(SessionStats) _then;

/// Create a copy of SessionStats
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? totalSessions = null,Object? blankSessions = null,Object? totalCatches = null,Object? byTimeOfDay = null,Object? byWeather = null,Object? byPressure = null,Object? byMoon = null,Object? byLocation = null,Object? skippedNoWeather = null,Object? bySpecies = null,Object? byBait = null,Object? byRig = null,Object? biggestBySpecies = null,}) {
  return _then(SessionStats(
totalSessions: null == totalSessions ? _self.totalSessions : totalSessions // ignore: cast_nullable_to_non_nullable
as int,blankSessions: null == blankSessions ? _self.blankSessions : blankSessions // ignore: cast_nullable_to_non_nullable
as int,totalCatches: null == totalCatches ? _self.totalCatches : totalCatches // ignore: cast_nullable_to_non_nullable
as int,byTimeOfDay: null == byTimeOfDay ? _self.byTimeOfDay : byTimeOfDay // ignore: cast_nullable_to_non_nullable
as List<StatGroup>,byWeather: null == byWeather ? _self.byWeather : byWeather // ignore: cast_nullable_to_non_nullable
as List<StatGroup>,byPressure: null == byPressure ? _self.byPressure : byPressure // ignore: cast_nullable_to_non_nullable
as List<StatGroup>,byMoon: null == byMoon ? _self.byMoon : byMoon // ignore: cast_nullable_to_non_nullable
as List<StatGroup>,byLocation: null == byLocation ? _self.byLocation : byLocation // ignore: cast_nullable_to_non_nullable
as List<StatGroup>,skippedNoWeather: null == skippedNoWeather ? _self.skippedNoWeather : skippedNoWeather // ignore: cast_nullable_to_non_nullable
as int,bySpecies: null == bySpecies ? _self.bySpecies : bySpecies // ignore: cast_nullable_to_non_nullable
as List<CountStat>,byBait: null == byBait ? _self.byBait : byBait // ignore: cast_nullable_to_non_nullable
as List<CountStat>,byRig: null == byRig ? _self.byRig : byRig // ignore: cast_nullable_to_non_nullable
as List<CountStat>,biggestBySpecies: null == biggestBySpecies ? _self.biggestBySpecies : biggestBySpecies // ignore: cast_nullable_to_non_nullable
as List<SizeRecord>,
  ));
}

}


/// Adds pattern-matching-related methods to [SessionStats].
extension SessionStatsPatterns on SessionStats {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SessionStats value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SessionStats() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SessionStats value)  $default,){
final _that = this;
switch (_that) {
case _SessionStats():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SessionStats value)?  $default,){
final _that = this;
switch (_that) {
case _SessionStats() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int totalSessions,  int blankSessions,  int totalCatches,  List<StatGroup> byTimeOfDay,  List<StatGroup> byWeather,  List<StatGroup> byPressure,  List<StatGroup> byMoon,  List<StatGroup> byLocation,  int skippedNoWeather,  List<CountStat> bySpecies,  List<CountStat> byBait,  List<CountStat> byRig,  List<SizeRecord> biggestBySpecies)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SessionStats() when $default != null:
return $default(_that.totalSessions,_that.blankSessions,_that.totalCatches,_that.byTimeOfDay,_that.byWeather,_that.byPressure,_that.byMoon,_that.byLocation,_that.skippedNoWeather,_that.bySpecies,_that.byBait,_that.byRig,_that.biggestBySpecies);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int totalSessions,  int blankSessions,  int totalCatches,  List<StatGroup> byTimeOfDay,  List<StatGroup> byWeather,  List<StatGroup> byPressure,  List<StatGroup> byMoon,  List<StatGroup> byLocation,  int skippedNoWeather,  List<CountStat> bySpecies,  List<CountStat> byBait,  List<CountStat> byRig,  List<SizeRecord> biggestBySpecies)  $default,) {final _that = this;
switch (_that) {
case _SessionStats():
return $default(_that.totalSessions,_that.blankSessions,_that.totalCatches,_that.byTimeOfDay,_that.byWeather,_that.byPressure,_that.byMoon,_that.byLocation,_that.skippedNoWeather,_that.bySpecies,_that.byBait,_that.byRig,_that.biggestBySpecies);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int totalSessions,  int blankSessions,  int totalCatches,  List<StatGroup> byTimeOfDay,  List<StatGroup> byWeather,  List<StatGroup> byPressure,  List<StatGroup> byMoon,  List<StatGroup> byLocation,  int skippedNoWeather,  List<CountStat> bySpecies,  List<CountStat> byBait,  List<CountStat> byRig,  List<SizeRecord> biggestBySpecies)?  $default,) {final _that = this;
switch (_that) {
case _SessionStats() when $default != null:
return $default(_that.totalSessions,_that.blankSessions,_that.totalCatches,_that.byTimeOfDay,_that.byWeather,_that.byPressure,_that.byMoon,_that.byLocation,_that.skippedNoWeather,_that.bySpecies,_that.byBait,_that.byRig,_that.biggestBySpecies);case _:
  return null;

}
}

}

/// @nodoc


class _SessionStats implements SessionStats {
  const _SessionStats({required this.totalSessions, required this.blankSessions, required this.totalCatches, required  List<StatGroup> byTimeOfDay, required  List<StatGroup> byWeather, required  List<StatGroup> byPressure, required  List<StatGroup> byMoon, required  List<StatGroup> byLocation, required this.skippedNoWeather, required  List<CountStat> bySpecies, required  List<CountStat> byBait, required  List<CountStat> byRig, required  List<SizeRecord> biggestBySpecies}): _byTimeOfDay = byTimeOfDay,_byWeather = byWeather,_byPressure = byPressure,_byMoon = byMoon,_byLocation = byLocation,_bySpecies = bySpecies,_byBait = byBait,_byRig = byRig,_biggestBySpecies = biggestBySpecies;
  

@override final  int totalSessions;
@override final  int blankSessions;
@override final  int totalCatches;
 final  List<StatGroup> _byTimeOfDay;
@override List<StatGroup> get byTimeOfDay {
  if (_byTimeOfDay is EqualUnmodifiableListView) return _byTimeOfDay;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_byTimeOfDay);
}

 final  List<StatGroup> _byWeather;
@override List<StatGroup> get byWeather {
  if (_byWeather is EqualUnmodifiableListView) return _byWeather;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_byWeather);
}

 final  List<StatGroup> _byPressure;
@override List<StatGroup> get byPressure {
  if (_byPressure is EqualUnmodifiableListView) return _byPressure;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_byPressure);
}

 final  List<StatGroup> _byMoon;
@override List<StatGroup> get byMoon {
  if (_byMoon is EqualUnmodifiableListView) return _byMoon;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_byMoon);
}

 final  List<StatGroup> _byLocation;
@override List<StatGroup> get byLocation {
  if (_byLocation is EqualUnmodifiableListView) return _byLocation;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_byLocation);
}

/// Sesi tanpa cuaca: tidak masuk [byWeather] dan [byPressure].
@override final  int skippedNoWeather;
 final  List<CountStat> _bySpecies;
@override List<CountStat> get bySpecies {
  if (_bySpecies is EqualUnmodifiableListView) return _bySpecies;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_bySpecies);
}

 final  List<CountStat> _byBait;
@override List<CountStat> get byBait {
  if (_byBait is EqualUnmodifiableListView) return _byBait;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_byBait);
}

 final  List<CountStat> _byRig;
@override List<CountStat> get byRig {
  if (_byRig is EqualUnmodifiableListView) return _byRig;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_byRig);
}

 final  List<SizeRecord> _biggestBySpecies;
@override List<SizeRecord> get biggestBySpecies {
  if (_biggestBySpecies is EqualUnmodifiableListView) return _biggestBySpecies;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_biggestBySpecies);
}


/// Create a copy of SessionStats
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SessionStatsCopyWith<_SessionStats> get copyWith => __$SessionStatsCopyWithImpl<_SessionStats>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SessionStats&&(identical(other.totalSessions, totalSessions) || other.totalSessions == totalSessions)&&(identical(other.blankSessions, blankSessions) || other.blankSessions == blankSessions)&&(identical(other.totalCatches, totalCatches) || other.totalCatches == totalCatches)&&const DeepCollectionEquality().equals(other.byTimeOfDay, _byTimeOfDay)&&const DeepCollectionEquality().equals(other.byWeather, _byWeather)&&const DeepCollectionEquality().equals(other.byPressure, _byPressure)&&const DeepCollectionEquality().equals(other.byMoon, _byMoon)&&const DeepCollectionEquality().equals(other.byLocation, _byLocation)&&(identical(other.skippedNoWeather, skippedNoWeather) || other.skippedNoWeather == skippedNoWeather)&&const DeepCollectionEquality().equals(other.bySpecies, _bySpecies)&&const DeepCollectionEquality().equals(other.byBait, _byBait)&&const DeepCollectionEquality().equals(other.byRig, _byRig)&&const DeepCollectionEquality().equals(other.biggestBySpecies, _biggestBySpecies));
}


@override
int get hashCode {
    return Object.hash(runtimeType,totalSessions,blankSessions,totalCatches,const DeepCollectionEquality().hash(_byTimeOfDay),const DeepCollectionEquality().hash(_byWeather),const DeepCollectionEquality().hash(_byPressure),const DeepCollectionEquality().hash(_byMoon),const DeepCollectionEquality().hash(_byLocation),skippedNoWeather,const DeepCollectionEquality().hash(_bySpecies),const DeepCollectionEquality().hash(_byBait),const DeepCollectionEquality().hash(_byRig),const DeepCollectionEquality().hash(_biggestBySpecies));
}

@override
String toString() {
    return 'SessionStats(totalSessions: $totalSessions, blankSessions: $blankSessions, totalCatches: $totalCatches, byTimeOfDay: $byTimeOfDay, byWeather: $byWeather, byPressure: $byPressure, byMoon: $byMoon, byLocation: $byLocation, skippedNoWeather: $skippedNoWeather, bySpecies: $bySpecies, byBait: $byBait, byRig: $byRig, biggestBySpecies: $biggestBySpecies)';
}


}

/// @nodoc
abstract mixin class _$SessionStatsCopyWith<$Res> implements $SessionStatsCopyWith<$Res> {
  factory _$SessionStatsCopyWith(_SessionStats value, $Res Function(_SessionStats) _then) = __$SessionStatsCopyWithImpl;
@override @useResult
$Res call({
 int totalSessions, int blankSessions, int totalCatches, List<StatGroup> byTimeOfDay, List<StatGroup> byWeather, List<StatGroup> byPressure, List<StatGroup> byMoon, List<StatGroup> byLocation, int skippedNoWeather, List<CountStat> bySpecies, List<CountStat> byBait, List<CountStat> byRig, List<SizeRecord> biggestBySpecies
});




}
/// @nodoc
class __$SessionStatsCopyWithImpl<$Res>
    implements _$SessionStatsCopyWith<$Res> {
  __$SessionStatsCopyWithImpl(this._self, this._then);

  final _SessionStats _self;
  final $Res Function(_SessionStats) _then;

/// Create a copy of SessionStats
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? totalSessions = null,Object? blankSessions = null,Object? totalCatches = null,Object? byTimeOfDay = null,Object? byWeather = null,Object? byPressure = null,Object? byMoon = null,Object? byLocation = null,Object? skippedNoWeather = null,Object? bySpecies = null,Object? byBait = null,Object? byRig = null,Object? biggestBySpecies = null,}) {
  return _then(_SessionStats(
totalSessions: null == totalSessions ? _self.totalSessions : totalSessions // ignore: cast_nullable_to_non_nullable
as int,blankSessions: null == blankSessions ? _self.blankSessions : blankSessions // ignore: cast_nullable_to_non_nullable
as int,totalCatches: null == totalCatches ? _self.totalCatches : totalCatches // ignore: cast_nullable_to_non_nullable
as int,byTimeOfDay: null == byTimeOfDay ? _self._byTimeOfDay : byTimeOfDay // ignore: cast_nullable_to_non_nullable
as List<StatGroup>,byWeather: null == byWeather ? _self._byWeather : byWeather // ignore: cast_nullable_to_non_nullable
as List<StatGroup>,byPressure: null == byPressure ? _self._byPressure : byPressure // ignore: cast_nullable_to_non_nullable
as List<StatGroup>,byMoon: null == byMoon ? _self._byMoon : byMoon // ignore: cast_nullable_to_non_nullable
as List<StatGroup>,byLocation: null == byLocation ? _self._byLocation : byLocation // ignore: cast_nullable_to_non_nullable
as List<StatGroup>,skippedNoWeather: null == skippedNoWeather ? _self.skippedNoWeather : skippedNoWeather // ignore: cast_nullable_to_non_nullable
as int,bySpecies: null == bySpecies ? _self._bySpecies : bySpecies // ignore: cast_nullable_to_non_nullable
as List<CountStat>,byBait: null == byBait ? _self._byBait : byBait // ignore: cast_nullable_to_non_nullable
as List<CountStat>,byRig: null == byRig ? _self._byRig : byRig // ignore: cast_nullable_to_non_nullable
as List<CountStat>,biggestBySpecies: null == biggestBySpecies ? _self._biggestBySpecies : biggestBySpecies // ignore: cast_nullable_to_non_nullable
as List<SizeRecord>,
  ));
}


}

// dart format on
