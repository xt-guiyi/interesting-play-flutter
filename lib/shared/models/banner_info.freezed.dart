// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'banner_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BannerInfo {

 int get id; String get url; String get jumpUrl;
/// Create a copy of BannerInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BannerInfoCopyWith<BannerInfo> get copyWith => _$BannerInfoCopyWithImpl<BannerInfo>(this as BannerInfo, _$identity);

  /// Serializes this BannerInfo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BannerInfo&&(identical(other.id, id) || other.id == id)&&(identical(other.url, url) || other.url == url)&&(identical(other.jumpUrl, jumpUrl) || other.jumpUrl == jumpUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,url,jumpUrl);

@override
String toString() {
  return 'BannerInfo(id: $id, url: $url, jumpUrl: $jumpUrl)';
}


}

/// @nodoc
abstract mixin class $BannerInfoCopyWith<$Res>  {
  factory $BannerInfoCopyWith(BannerInfo value, $Res Function(BannerInfo) _then) = _$BannerInfoCopyWithImpl;
@useResult
$Res call({
 int id, String url, String jumpUrl
});




}
/// @nodoc
class _$BannerInfoCopyWithImpl<$Res>
    implements $BannerInfoCopyWith<$Res> {
  _$BannerInfoCopyWithImpl(this._self, this._then);

  final BannerInfo _self;
  final $Res Function(BannerInfo) _then;

/// Create a copy of BannerInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? url = null,Object? jumpUrl = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,jumpUrl: null == jumpUrl ? _self.jumpUrl : jumpUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [BannerInfo].
extension BannerInfoPatterns on BannerInfo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BannerInfo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BannerInfo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BannerInfo value)  $default,){
final _that = this;
switch (_that) {
case _BannerInfo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BannerInfo value)?  $default,){
final _that = this;
switch (_that) {
case _BannerInfo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String url,  String jumpUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BannerInfo() when $default != null:
return $default(_that.id,_that.url,_that.jumpUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String url,  String jumpUrl)  $default,) {final _that = this;
switch (_that) {
case _BannerInfo():
return $default(_that.id,_that.url,_that.jumpUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String url,  String jumpUrl)?  $default,) {final _that = this;
switch (_that) {
case _BannerInfo() when $default != null:
return $default(_that.id,_that.url,_that.jumpUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BannerInfo implements BannerInfo {
  const _BannerInfo({required this.id, required this.url, required this.jumpUrl});
  factory _BannerInfo.fromJson(Map<String, dynamic> json) => _$BannerInfoFromJson(json);

@override final  int id;
@override final  String url;
@override final  String jumpUrl;

/// Create a copy of BannerInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BannerInfoCopyWith<_BannerInfo> get copyWith => __$BannerInfoCopyWithImpl<_BannerInfo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BannerInfoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BannerInfo&&(identical(other.id, id) || other.id == id)&&(identical(other.url, url) || other.url == url)&&(identical(other.jumpUrl, jumpUrl) || other.jumpUrl == jumpUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,url,jumpUrl);

@override
String toString() {
  return 'BannerInfo(id: $id, url: $url, jumpUrl: $jumpUrl)';
}


}

/// @nodoc
abstract mixin class _$BannerInfoCopyWith<$Res> implements $BannerInfoCopyWith<$Res> {
  factory _$BannerInfoCopyWith(_BannerInfo value, $Res Function(_BannerInfo) _then) = __$BannerInfoCopyWithImpl;
@override @useResult
$Res call({
 int id, String url, String jumpUrl
});




}
/// @nodoc
class __$BannerInfoCopyWithImpl<$Res>
    implements _$BannerInfoCopyWith<$Res> {
  __$BannerInfoCopyWithImpl(this._self, this._then);

  final _BannerInfo _self;
  final $Res Function(_BannerInfo) _then;

/// Create a copy of BannerInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? url = null,Object? jumpUrl = null,}) {
  return _then(_BannerInfo(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,jumpUrl: null == jumpUrl ? _self.jumpUrl : jumpUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
