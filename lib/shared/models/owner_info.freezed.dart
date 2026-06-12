// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'owner_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OwnerInfo {

 int get mid; String get name; int get fans; int get videos; String get face;
/// Create a copy of OwnerInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OwnerInfoCopyWith<OwnerInfo> get copyWith => _$OwnerInfoCopyWithImpl<OwnerInfo>(this as OwnerInfo, _$identity);

  /// Serializes this OwnerInfo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OwnerInfo&&(identical(other.mid, mid) || other.mid == mid)&&(identical(other.name, name) || other.name == name)&&(identical(other.fans, fans) || other.fans == fans)&&(identical(other.videos, videos) || other.videos == videos)&&(identical(other.face, face) || other.face == face));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,mid,name,fans,videos,face);

@override
String toString() {
  return 'OwnerInfo(mid: $mid, name: $name, fans: $fans, videos: $videos, face: $face)';
}


}

/// @nodoc
abstract mixin class $OwnerInfoCopyWith<$Res>  {
  factory $OwnerInfoCopyWith(OwnerInfo value, $Res Function(OwnerInfo) _then) = _$OwnerInfoCopyWithImpl;
@useResult
$Res call({
 int mid, String name, int fans, int videos, String face
});




}
/// @nodoc
class _$OwnerInfoCopyWithImpl<$Res>
    implements $OwnerInfoCopyWith<$Res> {
  _$OwnerInfoCopyWithImpl(this._self, this._then);

  final OwnerInfo _self;
  final $Res Function(OwnerInfo) _then;

/// Create a copy of OwnerInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? mid = null,Object? name = null,Object? fans = null,Object? videos = null,Object? face = null,}) {
  return _then(_self.copyWith(
mid: null == mid ? _self.mid : mid // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,fans: null == fans ? _self.fans : fans // ignore: cast_nullable_to_non_nullable
as int,videos: null == videos ? _self.videos : videos // ignore: cast_nullable_to_non_nullable
as int,face: null == face ? _self.face : face // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [OwnerInfo].
extension OwnerInfoPatterns on OwnerInfo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OwnerInfo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OwnerInfo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OwnerInfo value)  $default,){
final _that = this;
switch (_that) {
case _OwnerInfo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OwnerInfo value)?  $default,){
final _that = this;
switch (_that) {
case _OwnerInfo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int mid,  String name,  int fans,  int videos,  String face)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OwnerInfo() when $default != null:
return $default(_that.mid,_that.name,_that.fans,_that.videos,_that.face);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int mid,  String name,  int fans,  int videos,  String face)  $default,) {final _that = this;
switch (_that) {
case _OwnerInfo():
return $default(_that.mid,_that.name,_that.fans,_that.videos,_that.face);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int mid,  String name,  int fans,  int videos,  String face)?  $default,) {final _that = this;
switch (_that) {
case _OwnerInfo() when $default != null:
return $default(_that.mid,_that.name,_that.fans,_that.videos,_that.face);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OwnerInfo implements OwnerInfo {
  const _OwnerInfo({required this.mid, required this.name, required this.fans, required this.videos, required this.face});
  factory _OwnerInfo.fromJson(Map<String, dynamic> json) => _$OwnerInfoFromJson(json);

@override final  int mid;
@override final  String name;
@override final  int fans;
@override final  int videos;
@override final  String face;

/// Create a copy of OwnerInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OwnerInfoCopyWith<_OwnerInfo> get copyWith => __$OwnerInfoCopyWithImpl<_OwnerInfo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OwnerInfoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OwnerInfo&&(identical(other.mid, mid) || other.mid == mid)&&(identical(other.name, name) || other.name == name)&&(identical(other.fans, fans) || other.fans == fans)&&(identical(other.videos, videos) || other.videos == videos)&&(identical(other.face, face) || other.face == face));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,mid,name,fans,videos,face);

@override
String toString() {
  return 'OwnerInfo(mid: $mid, name: $name, fans: $fans, videos: $videos, face: $face)';
}


}

/// @nodoc
abstract mixin class _$OwnerInfoCopyWith<$Res> implements $OwnerInfoCopyWith<$Res> {
  factory _$OwnerInfoCopyWith(_OwnerInfo value, $Res Function(_OwnerInfo) _then) = __$OwnerInfoCopyWithImpl;
@override @useResult
$Res call({
 int mid, String name, int fans, int videos, String face
});




}
/// @nodoc
class __$OwnerInfoCopyWithImpl<$Res>
    implements _$OwnerInfoCopyWith<$Res> {
  __$OwnerInfoCopyWithImpl(this._self, this._then);

  final _OwnerInfo _self;
  final $Res Function(_OwnerInfo) _then;

/// Create a copy of OwnerInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? mid = null,Object? name = null,Object? fans = null,Object? videos = null,Object? face = null,}) {
  return _then(_OwnerInfo(
mid: null == mid ? _self.mid : mid // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,fans: null == fans ? _self.fans : fans // ignore: cast_nullable_to_non_nullable
as int,videos: null == videos ? _self.videos : videos // ignore: cast_nullable_to_non_nullable
as int,face: null == face ? _self.face : face // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
