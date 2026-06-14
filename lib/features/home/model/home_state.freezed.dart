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

 List<String> get searchTextList; String get currentSearchText; List<String> get tabItems; List<VideoInfo> get videos; List<BannerInfo> get banners; List<CommentInfo> get comments; UserInfo? get currentUser; String? get userError; String? get bannerError; String? get videoError; bool get isRefreshing; bool get isLoadingMore; String? get loadMoreError; int get page; int get pageSize; bool get hasMore;
/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeStateCopyWith<HomeState> get copyWith => _$HomeStateCopyWithImpl<HomeState>(this as HomeState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeState&&const DeepCollectionEquality().equals(other.searchTextList, searchTextList)&&(identical(other.currentSearchText, currentSearchText) || other.currentSearchText == currentSearchText)&&const DeepCollectionEquality().equals(other.tabItems, tabItems)&&const DeepCollectionEquality().equals(other.videos, videos)&&const DeepCollectionEquality().equals(other.banners, banners)&&const DeepCollectionEquality().equals(other.comments, comments)&&(identical(other.currentUser, currentUser) || other.currentUser == currentUser)&&(identical(other.userError, userError) || other.userError == userError)&&(identical(other.bannerError, bannerError) || other.bannerError == bannerError)&&(identical(other.videoError, videoError) || other.videoError == videoError)&&(identical(other.isRefreshing, isRefreshing) || other.isRefreshing == isRefreshing)&&(identical(other.isLoadingMore, isLoadingMore) || other.isLoadingMore == isLoadingMore)&&(identical(other.loadMoreError, loadMoreError) || other.loadMoreError == loadMoreError)&&(identical(other.page, page) || other.page == page)&&(identical(other.pageSize, pageSize) || other.pageSize == pageSize)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(searchTextList),currentSearchText,const DeepCollectionEquality().hash(tabItems),const DeepCollectionEquality().hash(videos),const DeepCollectionEquality().hash(banners),const DeepCollectionEquality().hash(comments),currentUser,userError,bannerError,videoError,isRefreshing,isLoadingMore,loadMoreError,page,pageSize,hasMore);

@override
String toString() {
  return 'HomeState(searchTextList: $searchTextList, currentSearchText: $currentSearchText, tabItems: $tabItems, videos: $videos, banners: $banners, comments: $comments, currentUser: $currentUser, userError: $userError, bannerError: $bannerError, videoError: $videoError, isRefreshing: $isRefreshing, isLoadingMore: $isLoadingMore, loadMoreError: $loadMoreError, page: $page, pageSize: $pageSize, hasMore: $hasMore)';
}


}

/// @nodoc
abstract mixin class $HomeStateCopyWith<$Res>  {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) _then) = _$HomeStateCopyWithImpl;
@useResult
$Res call({
 List<String> searchTextList, String currentSearchText, List<String> tabItems, List<VideoInfo> videos, List<BannerInfo> banners, List<CommentInfo> comments, UserInfo? currentUser, String? userError, String? bannerError, String? videoError, bool isRefreshing, bool isLoadingMore, String? loadMoreError, int page, int pageSize, bool hasMore
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
@pragma('vm:prefer-inline') @override $Res call({Object? searchTextList = null,Object? currentSearchText = null,Object? tabItems = null,Object? videos = null,Object? banners = null,Object? comments = null,Object? currentUser = freezed,Object? userError = freezed,Object? bannerError = freezed,Object? videoError = freezed,Object? isRefreshing = null,Object? isLoadingMore = null,Object? loadMoreError = freezed,Object? page = null,Object? pageSize = null,Object? hasMore = null,}) {
  return _then(_self.copyWith(
searchTextList: null == searchTextList ? _self.searchTextList : searchTextList // ignore: cast_nullable_to_non_nullable
as List<String>,currentSearchText: null == currentSearchText ? _self.currentSearchText : currentSearchText // ignore: cast_nullable_to_non_nullable
as String,tabItems: null == tabItems ? _self.tabItems : tabItems // ignore: cast_nullable_to_non_nullable
as List<String>,videos: null == videos ? _self.videos : videos // ignore: cast_nullable_to_non_nullable
as List<VideoInfo>,banners: null == banners ? _self.banners : banners // ignore: cast_nullable_to_non_nullable
as List<BannerInfo>,comments: null == comments ? _self.comments : comments // ignore: cast_nullable_to_non_nullable
as List<CommentInfo>,currentUser: freezed == currentUser ? _self.currentUser : currentUser // ignore: cast_nullable_to_non_nullable
as UserInfo?,userError: freezed == userError ? _self.userError : userError // ignore: cast_nullable_to_non_nullable
as String?,bannerError: freezed == bannerError ? _self.bannerError : bannerError // ignore: cast_nullable_to_non_nullable
as String?,videoError: freezed == videoError ? _self.videoError : videoError // ignore: cast_nullable_to_non_nullable
as String?,isRefreshing: null == isRefreshing ? _self.isRefreshing : isRefreshing // ignore: cast_nullable_to_non_nullable
as bool,isLoadingMore: null == isLoadingMore ? _self.isLoadingMore : isLoadingMore // ignore: cast_nullable_to_non_nullable
as bool,loadMoreError: freezed == loadMoreError ? _self.loadMoreError : loadMoreError // ignore: cast_nullable_to_non_nullable
as String?,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,pageSize: null == pageSize ? _self.pageSize : pageSize // ignore: cast_nullable_to_non_nullable
as int,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<String> searchTextList,  String currentSearchText,  List<String> tabItems,  List<VideoInfo> videos,  List<BannerInfo> banners,  List<CommentInfo> comments,  UserInfo? currentUser,  String? userError,  String? bannerError,  String? videoError,  bool isRefreshing,  bool isLoadingMore,  String? loadMoreError,  int page,  int pageSize,  bool hasMore)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HomeState() when $default != null:
return $default(_that.searchTextList,_that.currentSearchText,_that.tabItems,_that.videos,_that.banners,_that.comments,_that.currentUser,_that.userError,_that.bannerError,_that.videoError,_that.isRefreshing,_that.isLoadingMore,_that.loadMoreError,_that.page,_that.pageSize,_that.hasMore);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<String> searchTextList,  String currentSearchText,  List<String> tabItems,  List<VideoInfo> videos,  List<BannerInfo> banners,  List<CommentInfo> comments,  UserInfo? currentUser,  String? userError,  String? bannerError,  String? videoError,  bool isRefreshing,  bool isLoadingMore,  String? loadMoreError,  int page,  int pageSize,  bool hasMore)  $default,) {final _that = this;
switch (_that) {
case _HomeState():
return $default(_that.searchTextList,_that.currentSearchText,_that.tabItems,_that.videos,_that.banners,_that.comments,_that.currentUser,_that.userError,_that.bannerError,_that.videoError,_that.isRefreshing,_that.isLoadingMore,_that.loadMoreError,_that.page,_that.pageSize,_that.hasMore);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<String> searchTextList,  String currentSearchText,  List<String> tabItems,  List<VideoInfo> videos,  List<BannerInfo> banners,  List<CommentInfo> comments,  UserInfo? currentUser,  String? userError,  String? bannerError,  String? videoError,  bool isRefreshing,  bool isLoadingMore,  String? loadMoreError,  int page,  int pageSize,  bool hasMore)?  $default,) {final _that = this;
switch (_that) {
case _HomeState() when $default != null:
return $default(_that.searchTextList,_that.currentSearchText,_that.tabItems,_that.videos,_that.banners,_that.comments,_that.currentUser,_that.userError,_that.bannerError,_that.videoError,_that.isRefreshing,_that.isLoadingMore,_that.loadMoreError,_that.page,_that.pageSize,_that.hasMore);case _:
  return null;

}
}

}

/// @nodoc


class _HomeState extends HomeState {
  const _HomeState({final  List<String> searchTextList = const ["拜登把泽连斯基叫成普京", "原神肯德基套餐上线", "macBook air13寸和15寸差别多大", "绝区零KDA双厨狂喜", "北伐是什么梗", "神偷奶爸今日上映", "通往夏天的隧道", "安卓开发"], this.currentSearchText = '', final  List<String> tabItems = const ["推荐", "小说", "漫画", "游戏", "音乐", "舞蹈", "萌宠", "其他"], final  List<VideoInfo> videos = const [], final  List<BannerInfo> banners = const [], final  List<CommentInfo> comments = const [], this.currentUser, this.userError, this.bannerError, this.videoError, this.isRefreshing = false, this.isLoadingMore = false, this.loadMoreError, this.page = 1, this.pageSize = 20, this.hasMore = true}): _searchTextList = searchTextList,_tabItems = tabItems,_videos = videos,_banners = banners,_comments = comments,super._();
  

 final  List<String> _searchTextList;
@override@JsonKey() List<String> get searchTextList {
  if (_searchTextList is EqualUnmodifiableListView) return _searchTextList;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_searchTextList);
}

@override@JsonKey() final  String currentSearchText;
 final  List<String> _tabItems;
@override@JsonKey() List<String> get tabItems {
  if (_tabItems is EqualUnmodifiableListView) return _tabItems;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tabItems);
}

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
@override final  String? userError;
@override final  String? bannerError;
@override final  String? videoError;
@override@JsonKey() final  bool isRefreshing;
@override@JsonKey() final  bool isLoadingMore;
@override final  String? loadMoreError;
@override@JsonKey() final  int page;
@override@JsonKey() final  int pageSize;
@override@JsonKey() final  bool hasMore;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HomeStateCopyWith<_HomeState> get copyWith => __$HomeStateCopyWithImpl<_HomeState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HomeState&&const DeepCollectionEquality().equals(other._searchTextList, _searchTextList)&&(identical(other.currentSearchText, currentSearchText) || other.currentSearchText == currentSearchText)&&const DeepCollectionEquality().equals(other._tabItems, _tabItems)&&const DeepCollectionEquality().equals(other._videos, _videos)&&const DeepCollectionEquality().equals(other._banners, _banners)&&const DeepCollectionEquality().equals(other._comments, _comments)&&(identical(other.currentUser, currentUser) || other.currentUser == currentUser)&&(identical(other.userError, userError) || other.userError == userError)&&(identical(other.bannerError, bannerError) || other.bannerError == bannerError)&&(identical(other.videoError, videoError) || other.videoError == videoError)&&(identical(other.isRefreshing, isRefreshing) || other.isRefreshing == isRefreshing)&&(identical(other.isLoadingMore, isLoadingMore) || other.isLoadingMore == isLoadingMore)&&(identical(other.loadMoreError, loadMoreError) || other.loadMoreError == loadMoreError)&&(identical(other.page, page) || other.page == page)&&(identical(other.pageSize, pageSize) || other.pageSize == pageSize)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_searchTextList),currentSearchText,const DeepCollectionEquality().hash(_tabItems),const DeepCollectionEquality().hash(_videos),const DeepCollectionEquality().hash(_banners),const DeepCollectionEquality().hash(_comments),currentUser,userError,bannerError,videoError,isRefreshing,isLoadingMore,loadMoreError,page,pageSize,hasMore);

@override
String toString() {
  return 'HomeState(searchTextList: $searchTextList, currentSearchText: $currentSearchText, tabItems: $tabItems, videos: $videos, banners: $banners, comments: $comments, currentUser: $currentUser, userError: $userError, bannerError: $bannerError, videoError: $videoError, isRefreshing: $isRefreshing, isLoadingMore: $isLoadingMore, loadMoreError: $loadMoreError, page: $page, pageSize: $pageSize, hasMore: $hasMore)';
}


}

/// @nodoc
abstract mixin class _$HomeStateCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory _$HomeStateCopyWith(_HomeState value, $Res Function(_HomeState) _then) = __$HomeStateCopyWithImpl;
@override @useResult
$Res call({
 List<String> searchTextList, String currentSearchText, List<String> tabItems, List<VideoInfo> videos, List<BannerInfo> banners, List<CommentInfo> comments, UserInfo? currentUser, String? userError, String? bannerError, String? videoError, bool isRefreshing, bool isLoadingMore, String? loadMoreError, int page, int pageSize, bool hasMore
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
@override @pragma('vm:prefer-inline') $Res call({Object? searchTextList = null,Object? currentSearchText = null,Object? tabItems = null,Object? videos = null,Object? banners = null,Object? comments = null,Object? currentUser = freezed,Object? userError = freezed,Object? bannerError = freezed,Object? videoError = freezed,Object? isRefreshing = null,Object? isLoadingMore = null,Object? loadMoreError = freezed,Object? page = null,Object? pageSize = null,Object? hasMore = null,}) {
  return _then(_HomeState(
searchTextList: null == searchTextList ? _self._searchTextList : searchTextList // ignore: cast_nullable_to_non_nullable
as List<String>,currentSearchText: null == currentSearchText ? _self.currentSearchText : currentSearchText // ignore: cast_nullable_to_non_nullable
as String,tabItems: null == tabItems ? _self._tabItems : tabItems // ignore: cast_nullable_to_non_nullable
as List<String>,videos: null == videos ? _self._videos : videos // ignore: cast_nullable_to_non_nullable
as List<VideoInfo>,banners: null == banners ? _self._banners : banners // ignore: cast_nullable_to_non_nullable
as List<BannerInfo>,comments: null == comments ? _self._comments : comments // ignore: cast_nullable_to_non_nullable
as List<CommentInfo>,currentUser: freezed == currentUser ? _self.currentUser : currentUser // ignore: cast_nullable_to_non_nullable
as UserInfo?,userError: freezed == userError ? _self.userError : userError // ignore: cast_nullable_to_non_nullable
as String?,bannerError: freezed == bannerError ? _self.bannerError : bannerError // ignore: cast_nullable_to_non_nullable
as String?,videoError: freezed == videoError ? _self.videoError : videoError // ignore: cast_nullable_to_non_nullable
as String?,isRefreshing: null == isRefreshing ? _self.isRefreshing : isRefreshing // ignore: cast_nullable_to_non_nullable
as bool,isLoadingMore: null == isLoadingMore ? _self.isLoadingMore : isLoadingMore // ignore: cast_nullable_to_non_nullable
as bool,loadMoreError: freezed == loadMoreError ? _self.loadMoreError : loadMoreError // ignore: cast_nullable_to_non_nullable
as String?,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,pageSize: null == pageSize ? _self.pageSize : pageSize // ignore: cast_nullable_to_non_nullable
as int,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,
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
