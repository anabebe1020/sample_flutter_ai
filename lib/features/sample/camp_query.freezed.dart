// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'camp_query.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CampQuery {

 String get season;// '春', '夏', '秋', '冬'
 String get region;// '関東', '関西' など
 int get nights; int get people; String get transport; double get maxDriveHours;// 自宅からの運転許容時間
 List<String> get mustHave;// 直火/電源/温泉/川遊び など
 List<String> get niceToHave; String get budgetNote;
/// Create a copy of CampQuery
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CampQueryCopyWith<CampQuery> get copyWith => _$CampQueryCopyWithImpl<CampQuery>(this as CampQuery, _$identity);

  /// Serializes this CampQuery to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CampQuery&&(identical(other.season, season) || other.season == season)&&(identical(other.region, region) || other.region == region)&&(identical(other.nights, nights) || other.nights == nights)&&(identical(other.people, people) || other.people == people)&&(identical(other.transport, transport) || other.transport == transport)&&(identical(other.maxDriveHours, maxDriveHours) || other.maxDriveHours == maxDriveHours)&&const DeepCollectionEquality().equals(other.mustHave, mustHave)&&const DeepCollectionEquality().equals(other.niceToHave, niceToHave)&&(identical(other.budgetNote, budgetNote) || other.budgetNote == budgetNote));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,season,region,nights,people,transport,maxDriveHours,const DeepCollectionEquality().hash(mustHave),const DeepCollectionEquality().hash(niceToHave),budgetNote);

@override
String toString() {
  return 'CampQuery(season: $season, region: $region, nights: $nights, people: $people, transport: $transport, maxDriveHours: $maxDriveHours, mustHave: $mustHave, niceToHave: $niceToHave, budgetNote: $budgetNote)';
}


}

/// @nodoc
abstract mixin class $CampQueryCopyWith<$Res>  {
  factory $CampQueryCopyWith(CampQuery value, $Res Function(CampQuery) _then) = _$CampQueryCopyWithImpl;
@useResult
$Res call({
 String season, String region, int nights, int people, String transport, double maxDriveHours, List<String> mustHave, List<String> niceToHave, String budgetNote
});




}
/// @nodoc
class _$CampQueryCopyWithImpl<$Res>
    implements $CampQueryCopyWith<$Res> {
  _$CampQueryCopyWithImpl(this._self, this._then);

  final CampQuery _self;
  final $Res Function(CampQuery) _then;

/// Create a copy of CampQuery
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? season = null,Object? region = null,Object? nights = null,Object? people = null,Object? transport = null,Object? maxDriveHours = null,Object? mustHave = null,Object? niceToHave = null,Object? budgetNote = null,}) {
  return _then(_self.copyWith(
season: null == season ? _self.season : season // ignore: cast_nullable_to_non_nullable
as String,region: null == region ? _self.region : region // ignore: cast_nullable_to_non_nullable
as String,nights: null == nights ? _self.nights : nights // ignore: cast_nullable_to_non_nullable
as int,people: null == people ? _self.people : people // ignore: cast_nullable_to_non_nullable
as int,transport: null == transport ? _self.transport : transport // ignore: cast_nullable_to_non_nullable
as String,maxDriveHours: null == maxDriveHours ? _self.maxDriveHours : maxDriveHours // ignore: cast_nullable_to_non_nullable
as double,mustHave: null == mustHave ? _self.mustHave : mustHave // ignore: cast_nullable_to_non_nullable
as List<String>,niceToHave: null == niceToHave ? _self.niceToHave : niceToHave // ignore: cast_nullable_to_non_nullable
as List<String>,budgetNote: null == budgetNote ? _self.budgetNote : budgetNote // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [CampQuery].
extension CampQueryPatterns on CampQuery {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CampQuery value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CampQuery() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CampQuery value)  $default,){
final _that = this;
switch (_that) {
case _CampQuery():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CampQuery value)?  $default,){
final _that = this;
switch (_that) {
case _CampQuery() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String season,  String region,  int nights,  int people,  String transport,  double maxDriveHours,  List<String> mustHave,  List<String> niceToHave,  String budgetNote)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CampQuery() when $default != null:
return $default(_that.season,_that.region,_that.nights,_that.people,_that.transport,_that.maxDriveHours,_that.mustHave,_that.niceToHave,_that.budgetNote);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String season,  String region,  int nights,  int people,  String transport,  double maxDriveHours,  List<String> mustHave,  List<String> niceToHave,  String budgetNote)  $default,) {final _that = this;
switch (_that) {
case _CampQuery():
return $default(_that.season,_that.region,_that.nights,_that.people,_that.transport,_that.maxDriveHours,_that.mustHave,_that.niceToHave,_that.budgetNote);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String season,  String region,  int nights,  int people,  String transport,  double maxDriveHours,  List<String> mustHave,  List<String> niceToHave,  String budgetNote)?  $default,) {final _that = this;
switch (_that) {
case _CampQuery() when $default != null:
return $default(_that.season,_that.region,_that.nights,_that.people,_that.transport,_that.maxDriveHours,_that.mustHave,_that.niceToHave,_that.budgetNote);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CampQuery implements CampQuery {
  const _CampQuery({required this.season, required this.region, this.nights = 2, this.people = 2, this.transport = '車', this.maxDriveHours = 2.0, final  List<String> mustHave = const <String>[], final  List<String> niceToHave = const <String>[], this.budgetNote = ''}): _mustHave = mustHave,_niceToHave = niceToHave;
  factory _CampQuery.fromJson(Map<String, dynamic> json) => _$CampQueryFromJson(json);

@override final  String season;
// '春', '夏', '秋', '冬'
@override final  String region;
// '関東', '関西' など
@override@JsonKey() final  int nights;
@override@JsonKey() final  int people;
@override@JsonKey() final  String transport;
@override@JsonKey() final  double maxDriveHours;
// 自宅からの運転許容時間
 final  List<String> _mustHave;
// 自宅からの運転許容時間
@override@JsonKey() List<String> get mustHave {
  if (_mustHave is EqualUnmodifiableListView) return _mustHave;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_mustHave);
}

// 直火/電源/温泉/川遊び など
 final  List<String> _niceToHave;
// 直火/電源/温泉/川遊び など
@override@JsonKey() List<String> get niceToHave {
  if (_niceToHave is EqualUnmodifiableListView) return _niceToHave;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_niceToHave);
}

@override@JsonKey() final  String budgetNote;

/// Create a copy of CampQuery
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CampQueryCopyWith<_CampQuery> get copyWith => __$CampQueryCopyWithImpl<_CampQuery>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CampQueryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CampQuery&&(identical(other.season, season) || other.season == season)&&(identical(other.region, region) || other.region == region)&&(identical(other.nights, nights) || other.nights == nights)&&(identical(other.people, people) || other.people == people)&&(identical(other.transport, transport) || other.transport == transport)&&(identical(other.maxDriveHours, maxDriveHours) || other.maxDriveHours == maxDriveHours)&&const DeepCollectionEquality().equals(other._mustHave, _mustHave)&&const DeepCollectionEquality().equals(other._niceToHave, _niceToHave)&&(identical(other.budgetNote, budgetNote) || other.budgetNote == budgetNote));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,season,region,nights,people,transport,maxDriveHours,const DeepCollectionEquality().hash(_mustHave),const DeepCollectionEquality().hash(_niceToHave),budgetNote);

@override
String toString() {
  return 'CampQuery(season: $season, region: $region, nights: $nights, people: $people, transport: $transport, maxDriveHours: $maxDriveHours, mustHave: $mustHave, niceToHave: $niceToHave, budgetNote: $budgetNote)';
}


}

/// @nodoc
abstract mixin class _$CampQueryCopyWith<$Res> implements $CampQueryCopyWith<$Res> {
  factory _$CampQueryCopyWith(_CampQuery value, $Res Function(_CampQuery) _then) = __$CampQueryCopyWithImpl;
@override @useResult
$Res call({
 String season, String region, int nights, int people, String transport, double maxDriveHours, List<String> mustHave, List<String> niceToHave, String budgetNote
});




}
/// @nodoc
class __$CampQueryCopyWithImpl<$Res>
    implements _$CampQueryCopyWith<$Res> {
  __$CampQueryCopyWithImpl(this._self, this._then);

  final _CampQuery _self;
  final $Res Function(_CampQuery) _then;

/// Create a copy of CampQuery
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? season = null,Object? region = null,Object? nights = null,Object? people = null,Object? transport = null,Object? maxDriveHours = null,Object? mustHave = null,Object? niceToHave = null,Object? budgetNote = null,}) {
  return _then(_CampQuery(
season: null == season ? _self.season : season // ignore: cast_nullable_to_non_nullable
as String,region: null == region ? _self.region : region // ignore: cast_nullable_to_non_nullable
as String,nights: null == nights ? _self.nights : nights // ignore: cast_nullable_to_non_nullable
as int,people: null == people ? _self.people : people // ignore: cast_nullable_to_non_nullable
as int,transport: null == transport ? _self.transport : transport // ignore: cast_nullable_to_non_nullable
as String,maxDriveHours: null == maxDriveHours ? _self.maxDriveHours : maxDriveHours // ignore: cast_nullable_to_non_nullable
as double,mustHave: null == mustHave ? _self._mustHave : mustHave // ignore: cast_nullable_to_non_nullable
as List<String>,niceToHave: null == niceToHave ? _self._niceToHave : niceToHave // ignore: cast_nullable_to_non_nullable
as List<String>,budgetNote: null == budgetNote ? _self.budgetNote : budgetNote // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
