// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recommend_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$RecommendState {

 bool get isLoading; List<String>? get responseText;
/// Create a copy of RecommendState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RecommendStateCopyWith<RecommendState> get copyWith => _$RecommendStateCopyWithImpl<RecommendState>(this as RecommendState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RecommendState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&const DeepCollectionEquality().equals(other.responseText, responseText));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,const DeepCollectionEquality().hash(responseText));

@override
String toString() {
  return 'RecommendState(isLoading: $isLoading, responseText: $responseText)';
}


}

/// @nodoc
abstract mixin class $RecommendStateCopyWith<$Res>  {
  factory $RecommendStateCopyWith(RecommendState value, $Res Function(RecommendState) _then) = _$RecommendStateCopyWithImpl;
@useResult
$Res call({
 bool isLoading, List<String>? responseText
});




}
/// @nodoc
class _$RecommendStateCopyWithImpl<$Res>
    implements $RecommendStateCopyWith<$Res> {
  _$RecommendStateCopyWithImpl(this._self, this._then);

  final RecommendState _self;
  final $Res Function(RecommendState) _then;

/// Create a copy of RecommendState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLoading = null,Object? responseText = freezed,}) {
  return _then(_self.copyWith(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,responseText: freezed == responseText ? _self.responseText : responseText // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}

}


/// Adds pattern-matching-related methods to [RecommendState].
extension RecommendStatePatterns on RecommendState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RecommendState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RecommendState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RecommendState value)  $default,){
final _that = this;
switch (_that) {
case _RecommendState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RecommendState value)?  $default,){
final _that = this;
switch (_that) {
case _RecommendState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isLoading,  List<String>? responseText)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RecommendState() when $default != null:
return $default(_that.isLoading,_that.responseText);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isLoading,  List<String>? responseText)  $default,) {final _that = this;
switch (_that) {
case _RecommendState():
return $default(_that.isLoading,_that.responseText);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isLoading,  List<String>? responseText)?  $default,) {final _that = this;
switch (_that) {
case _RecommendState() when $default != null:
return $default(_that.isLoading,_that.responseText);case _:
  return null;

}
}

}

/// @nodoc


class _RecommendState implements RecommendState {
  const _RecommendState({this.isLoading = false, final  List<String>? responseText}): _responseText = responseText;
  

@override@JsonKey() final  bool isLoading;
 final  List<String>? _responseText;
@override List<String>? get responseText {
  final value = _responseText;
  if (value == null) return null;
  if (_responseText is EqualUnmodifiableListView) return _responseText;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of RecommendState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RecommendStateCopyWith<_RecommendState> get copyWith => __$RecommendStateCopyWithImpl<_RecommendState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RecommendState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&const DeepCollectionEquality().equals(other._responseText, _responseText));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,const DeepCollectionEquality().hash(_responseText));

@override
String toString() {
  return 'RecommendState(isLoading: $isLoading, responseText: $responseText)';
}


}

/// @nodoc
abstract mixin class _$RecommendStateCopyWith<$Res> implements $RecommendStateCopyWith<$Res> {
  factory _$RecommendStateCopyWith(_RecommendState value, $Res Function(_RecommendState) _then) = __$RecommendStateCopyWithImpl;
@override @useResult
$Res call({
 bool isLoading, List<String>? responseText
});




}
/// @nodoc
class __$RecommendStateCopyWithImpl<$Res>
    implements _$RecommendStateCopyWith<$Res> {
  __$RecommendStateCopyWithImpl(this._self, this._then);

  final _RecommendState _self;
  final $Res Function(_RecommendState) _then;

/// Create a copy of RecommendState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLoading = null,Object? responseText = freezed,}) {
  return _then(_RecommendState(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,responseText: freezed == responseText ? _self._responseText : responseText // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}


}

// dart format on
