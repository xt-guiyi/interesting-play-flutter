import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:interesting_play_flutter/shared/models/banner_info.dart';
import 'package:interesting_play_flutter/shared/models/comment_info.dart';
import 'package:interesting_play_flutter/shared/models/user_info.dart';
import 'package:interesting_play_flutter/shared/models/video_info.dart';

part 'home_state.freezed.dart';

@freezed
abstract class HomeState with _$HomeState {
  const factory HomeState({
    @Default([
      "拜登把泽连斯基叫成普京",
      "原神肯德基套餐上线",
      "macBook air13寸和15寸差别多大",
      "绝区零KDA双厨狂喜",
      "北伐是什么梗",
      "神偷奶爸今日上映",
      "通往夏天的隧道",
      "安卓开发",
    ])
    List<String> searchTextList,
    @Default('') String currentSearchText,
    @Default(["推荐", "小说", "漫画", "游戏", "音乐", "舞蹈", "萌宠", "其他"])
    List<String> tabItems,
    @Default([]) List<VideoInfo> videos,
    @Default([]) List<BannerInfo> banners,
    @Default([]) List<CommentInfo> comments,
    UserInfo? currentUser,
    @Default(1) int page,
    @Default(20) int pageSize,
    @Default(true) bool hasMore,
    @Default(false) bool isLoading,
    String? error,
  }) = _HomeState;
}
