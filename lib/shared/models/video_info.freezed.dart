// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'video_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$VideoInfo {

 int get id; String get title; int get pubDate; int get duration; String get desc; String get pic; String get url; int get views; int get reply; int get favorite; int get coin; int get share; int get like; int get dislike; int get danmaku; OwnerInfo get owner;
/// Create a copy of VideoInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VideoInfoCopyWith<VideoInfo> get copyWith => _$VideoInfoCopyWithImpl<VideoInfo>(this as VideoInfo, _$identity);

  /// Serializes this VideoInfo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VideoInfo&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.pubDate, pubDate) || other.pubDate == pubDate)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.desc, desc) || other.desc == desc)&&(identical(other.pic, pic) || other.pic == pic)&&(identical(other.url, url) || other.url == url)&&(identical(other.views, views) || other.views == views)&&(identical(other.reply, reply) || other.reply == reply)&&(identical(other.favorite, favorite) || other.favorite == favorite)&&(identical(other.coin, coin) || other.coin == coin)&&(identical(other.share, share) || other.share == share)&&(identical(other.like, like) || other.like == like)&&(identical(other.dislike, dislike) || other.dislike == dislike)&&(identical(other.danmaku, danmaku) || other.danmaku == danmaku)&&(identical(other.owner, owner) || other.owner == owner));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,pubDate,duration,desc,pic,url,views,reply,favorite,coin,share,like,dislike,danmaku,owner);

@override
String toString() {
  return 'VideoInfo(id: $id, title: $title, pubDate: $pubDate, duration: $duration, desc: $desc, pic: $pic, url: $url, views: $views, reply: $reply, favorite: $favorite, coin: $coin, share: $share, like: $like, dislike: $dislike, danmaku: $danmaku, owner: $owner)';
}


}

/// @nodoc
abstract mixin class $VideoInfoCopyWith<$Res>  {
  factory $VideoInfoCopyWith(VideoInfo value, $Res Function(VideoInfo) _then) = _$VideoInfoCopyWithImpl;
@useResult
$Res call({
 int id, String title, int pubDate, int duration, String desc, String pic, String url, int views, int reply, int favorite, int coin, int share, int like, int dislike, int danmaku, OwnerInfo owner
});


$OwnerInfoCopyWith<$Res> get owner;

}
/// @nodoc
class _$VideoInfoCopyWithImpl<$Res>
    implements $VideoInfoCopyWith<$Res> {
  _$VideoInfoCopyWithImpl(this._self, this._then);

  final VideoInfo _self;
  final $Res Function(VideoInfo) _then;

/// Create a copy of VideoInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? pubDate = null,Object? duration = null,Object? desc = null,Object? pic = null,Object? url = null,Object? views = null,Object? reply = null,Object? favorite = null,Object? coin = null,Object? share = null,Object? like = null,Object? dislike = null,Object? danmaku = null,Object? owner = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,pubDate: null == pubDate ? _self.pubDate : pubDate // ignore: cast_nullable_to_non_nullable
as int,duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as int,desc: null == desc ? _self.desc : desc // ignore: cast_nullable_to_non_nullable
as String,pic: null == pic ? _self.pic : pic // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,views: null == views ? _self.views : views // ignore: cast_nullable_to_non_nullable
as int,reply: null == reply ? _self.reply : reply // ignore: cast_nullable_to_non_nullable
as int,favorite: null == favorite ? _self.favorite : favorite // ignore: cast_nullable_to_non_nullable
as int,coin: null == coin ? _self.coin : coin // ignore: cast_nullable_to_non_nullable
as int,share: null == share ? _self.share : share // ignore: cast_nullable_to_non_nullable
as int,like: null == like ? _self.like : like // ignore: cast_nullable_to_non_nullable
as int,dislike: null == dislike ? _self.dislike : dislike // ignore: cast_nullable_to_non_nullable
as int,danmaku: null == danmaku ? _self.danmaku : danmaku // ignore: cast_nullable_to_non_nullable
as int,owner: null == owner ? _self.owner : owner // ignore: cast_nullable_to_non_nullable
as OwnerInfo,
  ));
}
/// Create a copy of VideoInfo
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OwnerInfoCopyWith<$Res> get owner {
  
  return $OwnerInfoCopyWith<$Res>(_self.owner, (value) {
    return _then(_self.copyWith(owner: value));
  });
}
}


/// Adds pattern-matching-related methods to [VideoInfo].
extension VideoInfoPatterns on VideoInfo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VideoInfo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VideoInfo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VideoInfo value)  $default,){
final _that = this;
switch (_that) {
case _VideoInfo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VideoInfo value)?  $default,){
final _that = this;
switch (_that) {
case _VideoInfo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String title,  int pubDate,  int duration,  String desc,  String pic,  String url,  int views,  int reply,  int favorite,  int coin,  int share,  int like,  int dislike,  int danmaku,  OwnerInfo owner)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VideoInfo() when $default != null:
return $default(_that.id,_that.title,_that.pubDate,_that.duration,_that.desc,_that.pic,_that.url,_that.views,_that.reply,_that.favorite,_that.coin,_that.share,_that.like,_that.dislike,_that.danmaku,_that.owner);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String title,  int pubDate,  int duration,  String desc,  String pic,  String url,  int views,  int reply,  int favorite,  int coin,  int share,  int like,  int dislike,  int danmaku,  OwnerInfo owner)  $default,) {final _that = this;
switch (_that) {
case _VideoInfo():
return $default(_that.id,_that.title,_that.pubDate,_that.duration,_that.desc,_that.pic,_that.url,_that.views,_that.reply,_that.favorite,_that.coin,_that.share,_that.like,_that.dislike,_that.danmaku,_that.owner);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String title,  int pubDate,  int duration,  String desc,  String pic,  String url,  int views,  int reply,  int favorite,  int coin,  int share,  int like,  int dislike,  int danmaku,  OwnerInfo owner)?  $default,) {final _that = this;
switch (_that) {
case _VideoInfo() when $default != null:
return $default(_that.id,_that.title,_that.pubDate,_that.duration,_that.desc,_that.pic,_that.url,_that.views,_that.reply,_that.favorite,_that.coin,_that.share,_that.like,_that.dislike,_that.danmaku,_that.owner);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VideoInfo implements VideoInfo {
  const _VideoInfo({required this.id, required this.title, required this.pubDate, required this.duration, required this.desc, required this.pic, required this.url, required this.views, required this.reply, required this.favorite, required this.coin, required this.share, required this.like, required this.dislike, required this.danmaku, required this.owner});
  factory _VideoInfo.fromJson(Map<String, dynamic> json) => _$VideoInfoFromJson(json);

@override final  int id;
@override final  String title;
@override final  int pubDate;
@override final  int duration;
@override final  String desc;
@override final  String pic;
@override final  String url;
@override final  int views;
@override final  int reply;
@override final  int favorite;
@override final  int coin;
@override final  int share;
@override final  int like;
@override final  int dislike;
@override final  int danmaku;
@override final  OwnerInfo owner;

/// Create a copy of VideoInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VideoInfoCopyWith<_VideoInfo> get copyWith => __$VideoInfoCopyWithImpl<_VideoInfo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VideoInfoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VideoInfo&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.pubDate, pubDate) || other.pubDate == pubDate)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.desc, desc) || other.desc == desc)&&(identical(other.pic, pic) || other.pic == pic)&&(identical(other.url, url) || other.url == url)&&(identical(other.views, views) || other.views == views)&&(identical(other.reply, reply) || other.reply == reply)&&(identical(other.favorite, favorite) || other.favorite == favorite)&&(identical(other.coin, coin) || other.coin == coin)&&(identical(other.share, share) || other.share == share)&&(identical(other.like, like) || other.like == like)&&(identical(other.dislike, dislike) || other.dislike == dislike)&&(identical(other.danmaku, danmaku) || other.danmaku == danmaku)&&(identical(other.owner, owner) || other.owner == owner));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,pubDate,duration,desc,pic,url,views,reply,favorite,coin,share,like,dislike,danmaku,owner);

@override
String toString() {
  return 'VideoInfo(id: $id, title: $title, pubDate: $pubDate, duration: $duration, desc: $desc, pic: $pic, url: $url, views: $views, reply: $reply, favorite: $favorite, coin: $coin, share: $share, like: $like, dislike: $dislike, danmaku: $danmaku, owner: $owner)';
}


}

/// @nodoc
abstract mixin class _$VideoInfoCopyWith<$Res> implements $VideoInfoCopyWith<$Res> {
  factory _$VideoInfoCopyWith(_VideoInfo value, $Res Function(_VideoInfo) _then) = __$VideoInfoCopyWithImpl;
@override @useResult
$Res call({
 int id, String title, int pubDate, int duration, String desc, String pic, String url, int views, int reply, int favorite, int coin, int share, int like, int dislike, int danmaku, OwnerInfo owner
});


@override $OwnerInfoCopyWith<$Res> get owner;

}
/// @nodoc
class __$VideoInfoCopyWithImpl<$Res>
    implements _$VideoInfoCopyWith<$Res> {
  __$VideoInfoCopyWithImpl(this._self, this._then);

  final _VideoInfo _self;
  final $Res Function(_VideoInfo) _then;

/// Create a copy of VideoInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? pubDate = null,Object? duration = null,Object? desc = null,Object? pic = null,Object? url = null,Object? views = null,Object? reply = null,Object? favorite = null,Object? coin = null,Object? share = null,Object? like = null,Object? dislike = null,Object? danmaku = null,Object? owner = null,}) {
  return _then(_VideoInfo(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,pubDate: null == pubDate ? _self.pubDate : pubDate // ignore: cast_nullable_to_non_nullable
as int,duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as int,desc: null == desc ? _self.desc : desc // ignore: cast_nullable_to_non_nullable
as String,pic: null == pic ? _self.pic : pic // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,views: null == views ? _self.views : views // ignore: cast_nullable_to_non_nullable
as int,reply: null == reply ? _self.reply : reply // ignore: cast_nullable_to_non_nullable
as int,favorite: null == favorite ? _self.favorite : favorite // ignore: cast_nullable_to_non_nullable
as int,coin: null == coin ? _self.coin : coin // ignore: cast_nullable_to_non_nullable
as int,share: null == share ? _self.share : share // ignore: cast_nullable_to_non_nullable
as int,like: null == like ? _self.like : like // ignore: cast_nullable_to_non_nullable
as int,dislike: null == dislike ? _self.dislike : dislike // ignore: cast_nullable_to_non_nullable
as int,danmaku: null == danmaku ? _self.danmaku : danmaku // ignore: cast_nullable_to_non_nullable
as int,owner: null == owner ? _self.owner : owner // ignore: cast_nullable_to_non_nullable
as OwnerInfo,
  ));
}

/// Create a copy of VideoInfo
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OwnerInfoCopyWith<$Res> get owner {
  
  return $OwnerInfoCopyWith<$Res>(_self.owner, (value) {
    return _then(_self.copyWith(owner: value));
  });
}
}

// dart format on
