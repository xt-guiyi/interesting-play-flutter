// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'discover_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DiscoverInfo {

 int? get id; String? get title; String? get pic; int? get reply; int? get picW; int? get picH; OwnerInfo? get owner;
/// Create a copy of DiscoverInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DiscoverInfoCopyWith<DiscoverInfo> get copyWith => _$DiscoverInfoCopyWithImpl<DiscoverInfo>(this as DiscoverInfo, _$identity);

  /// Serializes this DiscoverInfo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DiscoverInfo&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.pic, pic) || other.pic == pic)&&(identical(other.reply, reply) || other.reply == reply)&&(identical(other.picW, picW) || other.picW == picW)&&(identical(other.picH, picH) || other.picH == picH)&&(identical(other.owner, owner) || other.owner == owner));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,pic,reply,picW,picH,owner);

@override
String toString() {
  return 'DiscoverInfo(id: $id, title: $title, pic: $pic, reply: $reply, picW: $picW, picH: $picH, owner: $owner)';
}


}

/// @nodoc
abstract mixin class $DiscoverInfoCopyWith<$Res>  {
  factory $DiscoverInfoCopyWith(DiscoverInfo value, $Res Function(DiscoverInfo) _then) = _$DiscoverInfoCopyWithImpl;
@useResult
$Res call({
 int? id, String? title, String? pic, int? reply, int? picW, int? picH, OwnerInfo? owner
});


$OwnerInfoCopyWith<$Res>? get owner;

}
/// @nodoc
class _$DiscoverInfoCopyWithImpl<$Res>
    implements $DiscoverInfoCopyWith<$Res> {
  _$DiscoverInfoCopyWithImpl(this._self, this._then);

  final DiscoverInfo _self;
  final $Res Function(DiscoverInfo) _then;

/// Create a copy of DiscoverInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? title = freezed,Object? pic = freezed,Object? reply = freezed,Object? picW = freezed,Object? picH = freezed,Object? owner = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,pic: freezed == pic ? _self.pic : pic // ignore: cast_nullable_to_non_nullable
as String?,reply: freezed == reply ? _self.reply : reply // ignore: cast_nullable_to_non_nullable
as int?,picW: freezed == picW ? _self.picW : picW // ignore: cast_nullable_to_non_nullable
as int?,picH: freezed == picH ? _self.picH : picH // ignore: cast_nullable_to_non_nullable
as int?,owner: freezed == owner ? _self.owner : owner // ignore: cast_nullable_to_non_nullable
as OwnerInfo?,
  ));
}
/// Create a copy of DiscoverInfo
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OwnerInfoCopyWith<$Res>? get owner {
    if (_self.owner == null) {
    return null;
  }

  return $OwnerInfoCopyWith<$Res>(_self.owner!, (value) {
    return _then(_self.copyWith(owner: value));
  });
}
}


/// Adds pattern-matching-related methods to [DiscoverInfo].
extension DiscoverInfoPatterns on DiscoverInfo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DiscoverInfo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DiscoverInfo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DiscoverInfo value)  $default,){
final _that = this;
switch (_that) {
case _DiscoverInfo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DiscoverInfo value)?  $default,){
final _that = this;
switch (_that) {
case _DiscoverInfo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  String? title,  String? pic,  int? reply,  int? picW,  int? picH,  OwnerInfo? owner)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DiscoverInfo() when $default != null:
return $default(_that.id,_that.title,_that.pic,_that.reply,_that.picW,_that.picH,_that.owner);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  String? title,  String? pic,  int? reply,  int? picW,  int? picH,  OwnerInfo? owner)  $default,) {final _that = this;
switch (_that) {
case _DiscoverInfo():
return $default(_that.id,_that.title,_that.pic,_that.reply,_that.picW,_that.picH,_that.owner);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  String? title,  String? pic,  int? reply,  int? picW,  int? picH,  OwnerInfo? owner)?  $default,) {final _that = this;
switch (_that) {
case _DiscoverInfo() when $default != null:
return $default(_that.id,_that.title,_that.pic,_that.reply,_that.picW,_that.picH,_that.owner);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DiscoverInfo implements DiscoverInfo {
  const _DiscoverInfo({this.id, this.title, this.pic, this.reply, this.picW, this.picH, this.owner});
  factory _DiscoverInfo.fromJson(Map<String, dynamic> json) => _$DiscoverInfoFromJson(json);

@override final  int? id;
@override final  String? title;
@override final  String? pic;
@override final  int? reply;
@override final  int? picW;
@override final  int? picH;
@override final  OwnerInfo? owner;

/// Create a copy of DiscoverInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DiscoverInfoCopyWith<_DiscoverInfo> get copyWith => __$DiscoverInfoCopyWithImpl<_DiscoverInfo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DiscoverInfoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DiscoverInfo&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.pic, pic) || other.pic == pic)&&(identical(other.reply, reply) || other.reply == reply)&&(identical(other.picW, picW) || other.picW == picW)&&(identical(other.picH, picH) || other.picH == picH)&&(identical(other.owner, owner) || other.owner == owner));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,pic,reply,picW,picH,owner);

@override
String toString() {
  return 'DiscoverInfo(id: $id, title: $title, pic: $pic, reply: $reply, picW: $picW, picH: $picH, owner: $owner)';
}


}

/// @nodoc
abstract mixin class _$DiscoverInfoCopyWith<$Res> implements $DiscoverInfoCopyWith<$Res> {
  factory _$DiscoverInfoCopyWith(_DiscoverInfo value, $Res Function(_DiscoverInfo) _then) = __$DiscoverInfoCopyWithImpl;
@override @useResult
$Res call({
 int? id, String? title, String? pic, int? reply, int? picW, int? picH, OwnerInfo? owner
});


@override $OwnerInfoCopyWith<$Res>? get owner;

}
/// @nodoc
class __$DiscoverInfoCopyWithImpl<$Res>
    implements _$DiscoverInfoCopyWith<$Res> {
  __$DiscoverInfoCopyWithImpl(this._self, this._then);

  final _DiscoverInfo _self;
  final $Res Function(_DiscoverInfo) _then;

/// Create a copy of DiscoverInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? title = freezed,Object? pic = freezed,Object? reply = freezed,Object? picW = freezed,Object? picH = freezed,Object? owner = freezed,}) {
  return _then(_DiscoverInfo(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,pic: freezed == pic ? _self.pic : pic // ignore: cast_nullable_to_non_nullable
as String?,reply: freezed == reply ? _self.reply : reply // ignore: cast_nullable_to_non_nullable
as int?,picW: freezed == picW ? _self.picW : picW // ignore: cast_nullable_to_non_nullable
as int?,picH: freezed == picH ? _self.picH : picH // ignore: cast_nullable_to_non_nullable
as int?,owner: freezed == owner ? _self.owner : owner // ignore: cast_nullable_to_non_nullable
as OwnerInfo?,
  ));
}

/// Create a copy of DiscoverInfo
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OwnerInfoCopyWith<$Res>? get owner {
    if (_self.owner == null) {
    return null;
  }

  return $OwnerInfoCopyWith<$Res>(_self.owner!, (value) {
    return _then(_self.copyWith(owner: value));
  });
}
}

// dart format on
