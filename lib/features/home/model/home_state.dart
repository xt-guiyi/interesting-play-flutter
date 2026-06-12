import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:interesting_play_flutter/shared/models/banner_info.dart';
import 'package:interesting_play_flutter/shared/models/comment_info.dart';
import 'package:interesting_play_flutter/shared/models/user_info.dart';
import 'package:interesting_play_flutter/shared/models/video_info.dart';

part 'home_state.freezed.dart';

@freezed
abstract class HomeState with _$HomeState {
  const factory HomeState({
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
