import 'package:interesting_play_flutter/core/network/api_response.dart';
import 'package:interesting_play_flutter/features/auth/data/auth_repository.dart';
import 'package:interesting_play_flutter/features/home/data/home_service.dart';
import 'package:interesting_play_flutter/shared/models/banner_info.dart';
import 'package:interesting_play_flutter/shared/models/comment_info.dart';
import 'package:interesting_play_flutter/shared/models/page_data.dart';
import 'package:interesting_play_flutter/shared/models/user_info.dart';
import 'package:interesting_play_flutter/shared/models/video_info.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_repository.g.dart';

@riverpod
HomeRepository homeRepository(Ref ref) {
  return HomeRepository(
    homeService: ref.watch(homeServiceProvider),
    authRepository: ref.watch(authRepositoryProvider),
  );
}

class HomeRepository {
  HomeRepository({
    required HomeService homeService,
    required AuthRepository authRepository,
  }) : _homeService = homeService,
       _authRepository = authRepository;

  final HomeService _homeService;
  final AuthRepository _authRepository;

  Future<UserInfo?> getCurrentUser() {
    return _authRepository.getCurrentUser();
  }

  Future<List<BannerInfo>> getBanners({
    bool showGlobalErrorToast = true,
  }) async {
    final result = await _homeService.getBanners(
      showGlobalErrorToast: showGlobalErrorToast,
    );
    return unwrapApiResponse(result, '获取轮播图失败');
  }

  Future<PageData<List<VideoInfo>>> getVideoList(
    int page,
    int pageSize, {
    bool showGlobalErrorToast = true,
  }) async {
    final result = await _homeService.getVideoList(
      page,
      pageSize,
      showGlobalErrorToast: showGlobalErrorToast,
    );
    return unwrapApiResponse(result, '获取视频列表失败');
  }

  Future<PageData<List<CommentInfo>>> getCommentList(
    int page,
    int pageSize, {
    bool showGlobalErrorToast = true,
  }) async {
    final result = await _homeService.getCommentList(
      page,
      pageSize,
      showGlobalErrorToast: showGlobalErrorToast,
    );
    return unwrapApiResponse(result, '获取评论列表失败');
  }
}
