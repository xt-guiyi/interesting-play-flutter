// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HomeState {

 List<VideoInfo> get videos; List<BannerInfo> get banners; List<CommentInfo> get comments; UserInfo? get currentUser; int get page; int get pageSize; bool get hasMore; bool get isLoading; String? get error;
/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeStateCopyWith<HomeState> get copyWith => _$HomeStateCopyWithImpl<HomeState>(this as HomeState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeState&&const DeepCollectionEquality().equals(other.videos, videos)&&const DeepCollectionEquality().equals(other.banners, banners)&&const DeepCollectionEquality().equals(other.comments, comments)&&(identical(other.currentUser, currentUser) || other.currentUser == currentUser)&&(identical(other.page, page) || other.page == page)&&(identical(other.pageSize, pageSize) || other.pageSize == pageSize)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(videos),const DeepCollectionEquality().hash(banners),const DeepCollectionEquality().hash(comments),currentUser,page,pageSize,hasMore,isLoading,error);

@override
String toString() {
  return 'HomeState(videos: $videos, banners: $banners, comments: $comments, currentUser: $currentUser, page: $page, pageSize: $pageSize, hasMore: $hasMore, isLoading: $isLoading, error: $error)';
}


}

/// @nodoc
abstract mixin class $HomeStateCopyWith<$Res>  {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) _then) = _$HomeStateCopyWithImpl;
@useResult
$Res call({
 List<VideoInfo> videos, List<BannerInfo> banners, List<CommentInfo> comments, UserInfo? currentUser, int page, int pageSize, bool hasMore, bool isLoading, String? error
});


$UserInfoCopyWith<$Res>? get currentUser;

}
/// @nodoc
class _$HomeStateCopyWithImpl<$Res>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._self, this._then);

  final HomeState _self;
  final $Res Function(HomeState) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? videos = null,Object? banners = null,Object? comments = null,Object? currentUser = freezed,Object? page = null,Object? pageSize = null,Object? hasMore = null,Object? isLoading = null,Object? error = freezed,}) {
  return _then(_self.copyWith(
videos: null == videos ? _self.videos : videos // ignore: cast_nullable_to_non_nullable
as List<VideoInfo>,banners: null == banners ? _self.banners : banners // ignore: cast_nullable_to_non_nullable
as List<BannerInfo>,comments: null == comments ? _self.comments : comments // ignore: cast_nullable_to_non_nullable
as List<CommentInfo>,currentUser: freezed == currentUser ? _self.currentUser : currentUser // ignore: cast_nullable_to_non_nullable
as UserInfo?,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,pageSize: null == pageSize ? _self.pageSize : pageSize // ignore: cast_nullable_to_non_nullable
as int,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserInfoCopyWith<$Res>? get currentUser {
    if (_self.currentUser == null) {
    return null;
  }

  return $UserInfoCopyWith<$Res>(_self.currentUser!, (value) {
    return _then(_self.copyWith(currentUser: value));
  });
}
}


/// Adds pattern-matching-related methods to [HomeState].
extension HomeStatePatterns on HomeState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HomeState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HomeState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HomeState value)  $default,){
final _that = this;
switch (_that) {
case _HomeState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HomeState value)?  $default,){
final _that = this;
switch (_that) {
case _HomeState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<VideoInfo> videos,  List<BannerInfo> banners,  List<CommentInfo> comments,  UserInfo? currentUser,  int page,  int pageSize,  bool hasMore,  bool isLoading,  String? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HomeState() when $default != null:
return $default(_that.videos,_that.banners,_that.comments,_that.currentUser,_that.page,_that.pageSize,_that.hasMore,_that.isLoading,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<VideoInfo> videos,  List<BannerInfo> banners,  List<CommentInfo> comments,  UserInfo? currentUser,  int page,  int pageSize,  bool hasMore,  bool isLoading,  String? error)  $default,) {final _that = this;
switch (_that) {
case _HomeState():
return $default(_that.videos,_that.banners,_that.comments,_that.currentUser,_that.page,_that.pageSize,_that.hasMore,_that.isLoading,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<VideoInfo> videos,  List<BannerInfo> banners,  List<CommentInfo> comments,  UserInfo? currentUser,  int page,  int pageSize,  bool hasMore,  bool isLoading,  String? error)?  $default,) {final _that = this;
switch (_that) {
case _HomeState() when $default != null:
return $default(_that.videos,_that.banners,_that.comments,_that.currentUser,_that.page,_that.pageSize,_that.hasMore,_that.isLoading,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _HomeState implements HomeState {
  const _HomeState({final  List<VideoInfo> videos = const [], final  List<BannerInfo> banners = const [], final  List<CommentInfo> comments = const [], this.currentUser, this.page = 1, this.pageSize = 20, this.hasMore = true, this.isLoading = false, this.error}): _videos = videos,_banners = banners,_comments = comments;
  

 final  List<VideoInfo> _videos;
@override@JsonKey() List<VideoInfo> get videos {
  if (_videos is EqualUnmodifiableListView) return _videos;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_videos);
}

 final  List<BannerInfo> _banners;
@override@JsonKey() List<BannerInfo> get banners {
  if (_banners is EqualUnmodifiableListView) return _banners;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_banners);
}

 final  List<CommentInfo> _comments;
@override@JsonKey() List<CommentInfo> get comments {
  if (_comments is EqualUnmodifiableListView) return _comments;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_comments);
}

@override final  UserInfo? currentUser;
@override@JsonKey() final  int page;
@override@JsonKey() final  int pageSize;
@override@JsonKey() final  bool hasMore;
@override@JsonKey() final  bool isLoading;
@override final  String? error;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HomeStateCopyWith<_HomeState> get copyWith => __$HomeStateCopyWithImpl<_HomeState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HomeState&&const DeepCollectionEquality().equals(other._videos, _videos)&&const DeepCollectionEquality().equals(other._banners, _banners)&&const DeepCollectionEquality().equals(other._comments, _comments)&&(identical(other.currentUser, currentUser) || other.currentUser == currentUser)&&(identical(other.page, page) || other.page == page)&&(identical(other.pageSize, pageSize) || other.pageSize == pageSize)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_videos),const DeepCollectionEquality().hash(_banners),const DeepCollectionEquality().hash(_comments),currentUser,page,pageSize,hasMore,isLoading,error);

@override
String toString() {
  return 'HomeState(videos: $videos, banners: $banners, comments: $comments, currentUser: $currentUser, page: $page, pageSize: $pageSize, hasMore: $hasMore, isLoading: $isLoading, error: $error)';
}


}

/// @nodoc
abstract mixin class _$HomeStateCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory _$HomeStateCopyWith(_HomeState value, $Res Function(_HomeState) _then) = __$HomeStateCopyWithImpl;
@override @useResult
$Res call({
 List<VideoInfo> videos, List<BannerInfo> banners, List<CommentInfo> comments, UserInfo? currentUser, int page, int pageSize, bool hasMore, bool isLoading, String? error
});


@override $UserInfoCopyWith<$Res>? get currentUser;

}
/// @nodoc
class __$HomeStateCopyWithImpl<$Res>
    implements _$HomeStateCopyWith<$Res> {
  __$HomeStateCopyWithImpl(this._self, this._then);

  final _HomeState _self;
  final $Res Function(_HomeState) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? videos = null,Object? banners = null,Object? comments = null,Object? currentUser = freezed,Object? page = null,Object? pageSize = null,Object? hasMore = null,Object? isLoading = null,Object? error = freezed,}) {
  return _then(_HomeState(
videos: null == videos ? _self._videos : videos // ignore: cast_nullable_to_non_nullable
as List<VideoInfo>,banners: null == banners ? _self._banners : banners // ignore: cast_nullable_to_non_nullable
as List<BannerInfo>,comments: null == comments ? _self._comments : comments // ignore: cast_nullable_to_non_nullable
as List<CommentInfo>,currentUser: freezed == currentUser ? _self.currentUser : currentUser // ignore: cast_nullable_to_non_nullable
as UserInfo?,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,pageSize: null == pageSize ? _self.pageSize : pageSize // ignore: cast_nullable_to_non_nullable
as int,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserInfoCopyWith<$Res>? get currentUser {
    if (_self.currentUser == null) {
    return null;
  }

  return $UserInfoCopyWith<$Res>(_self.currentUser!, (value) {
    return _then(_self.copyWith(currentUser: value));
  });
}
}

// dart format on
