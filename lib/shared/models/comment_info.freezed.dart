// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'comment_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CommentInfo {

 int? get id; String? get username; int? get pubDate; String? get ipAddress; String? get content; String? get avatar; int? get like;
/// Create a copy of CommentInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CommentInfoCopyWith<CommentInfo> get copyWith => _$CommentInfoCopyWithImpl<CommentInfo>(this as CommentInfo, _$identity);

  /// Serializes this CommentInfo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CommentInfo&&(identical(other.id, id) || other.id == id)&&(identical(other.username, username) || other.username == username)&&(identical(other.pubDate, pubDate) || other.pubDate == pubDate)&&(identical(other.ipAddress, ipAddress) || other.ipAddress == ipAddress)&&(identical(other.content, content) || other.content == content)&&(identical(other.avatar, avatar) || other.avatar == avatar)&&(identical(other.like, like) || other.like == like));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,username,pubDate,ipAddress,content,avatar,like);

@override
String toString() {
  return 'CommentInfo(id: $id, username: $username, pubDate: $pubDate, ipAddress: $ipAddress, content: $content, avatar: $avatar, like: $like)';
}


}

/// @nodoc
abstract mixin class $CommentInfoCopyWith<$Res>  {
  factory $CommentInfoCopyWith(CommentInfo value, $Res Function(CommentInfo) _then) = _$CommentInfoCopyWithImpl;
@useResult
$Res call({
 int? id, String? username, int? pubDate, String? ipAddress, String? content, String? avatar, int? like
});




}
/// @nodoc
class _$CommentInfoCopyWithImpl<$Res>
    implements $CommentInfoCopyWith<$Res> {
  _$CommentInfoCopyWithImpl(this._self, this._then);

  final CommentInfo _self;
  final $Res Function(CommentInfo) _then;

/// Create a copy of CommentInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? username = freezed,Object? pubDate = freezed,Object? ipAddress = freezed,Object? content = freezed,Object? avatar = freezed,Object? like = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,username: freezed == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String?,pubDate: freezed == pubDate ? _self.pubDate : pubDate // ignore: cast_nullable_to_non_nullable
as int?,ipAddress: freezed == ipAddress ? _self.ipAddress : ipAddress // ignore: cast_nullable_to_non_nullable
as String?,content: freezed == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String?,avatar: freezed == avatar ? _self.avatar : avatar // ignore: cast_nullable_to_non_nullable
as String?,like: freezed == like ? _self.like : like // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [CommentInfo].
extension CommentInfoPatterns on CommentInfo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CommentInfo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CommentInfo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CommentInfo value)  $default,){
final _that = this;
switch (_that) {
case _CommentInfo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CommentInfo value)?  $default,){
final _that = this;
switch (_that) {
case _CommentInfo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  String? username,  int? pubDate,  String? ipAddress,  String? content,  String? avatar,  int? like)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CommentInfo() when $default != null:
return $default(_that.id,_that.username,_that.pubDate,_that.ipAddress,_that.content,_that.avatar,_that.like);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  String? username,  int? pubDate,  String? ipAddress,  String? content,  String? avatar,  int? like)  $default,) {final _that = this;
switch (_that) {
case _CommentInfo():
return $default(_that.id,_that.username,_that.pubDate,_that.ipAddress,_that.content,_that.avatar,_that.like);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  String? username,  int? pubDate,  String? ipAddress,  String? content,  String? avatar,  int? like)?  $default,) {final _that = this;
switch (_that) {
case _CommentInfo() when $default != null:
return $default(_that.id,_that.username,_that.pubDate,_that.ipAddress,_that.content,_that.avatar,_that.like);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CommentInfo implements CommentInfo {
  const _CommentInfo({this.id, this.username, this.pubDate, this.ipAddress, this.content, this.avatar, this.like});
  factory _CommentInfo.fromJson(Map<String, dynamic> json) => _$CommentInfoFromJson(json);

@override final  int? id;
@override final  String? username;
@override final  int? pubDate;
@override final  String? ipAddress;
@override final  String? content;
@override final  String? avatar;
@override final  int? like;

/// Create a copy of CommentInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CommentInfoCopyWith<_CommentInfo> get copyWith => __$CommentInfoCopyWithImpl<_CommentInfo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CommentInfoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CommentInfo&&(identical(other.id, id) || other.id == id)&&(identical(other.username, username) || other.username == username)&&(identical(other.pubDate, pubDate) || other.pubDate == pubDate)&&(identical(other.ipAddress, ipAddress) || other.ipAddress == ipAddress)&&(identical(other.content, content) || other.content == content)&&(identical(other.avatar, avatar) || other.avatar == avatar)&&(identical(other.like, like) || other.like == like));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,username,pubDate,ipAddress,content,avatar,like);

@override
String toString() {
  return 'CommentInfo(id: $id, username: $username, pubDate: $pubDate, ipAddress: $ipAddress, content: $content, avatar: $avatar, like: $like)';
}


}

/// @nodoc
abstract mixin class _$CommentInfoCopyWith<$Res> implements $CommentInfoCopyWith<$Res> {
  factory _$CommentInfoCopyWith(_CommentInfo value, $Res Function(_CommentInfo) _then) = __$CommentInfoCopyWithImpl;
@override @useResult
$Res call({
 int? id, String? username, int? pubDate, String? ipAddress, String? content, String? avatar, int? like
});




}
/// @nodoc
class __$CommentInfoCopyWithImpl<$Res>
    implements _$CommentInfoCopyWith<$Res> {
  __$CommentInfoCopyWithImpl(this._self, this._then);

  final _CommentInfo _self;
  final $Res Function(_CommentInfo) _then;

/// Create a copy of CommentInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? username = freezed,Object? pubDate = freezed,Object? ipAddress = freezed,Object? content = freezed,Object? avatar = freezed,Object? like = freezed,}) {
  return _then(_CommentInfo(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,username: freezed == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String?,pubDate: freezed == pubDate ? _self.pubDate : pubDate // ignore: cast_nullable_to_non_nullable
as int?,ipAddress: freezed == ipAddress ? _self.ipAddress : ipAddress // ignore: cast_nullable_to_non_nullable
as String?,content: freezed == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String?,avatar: freezed == avatar ? _self.avatar : avatar // ignore: cast_nullable_to_non_nullable
as String?,like: freezed == like ? _self.like : like // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
