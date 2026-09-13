import 'package:flutter_feature_collection/core/network/models/api_response.dart';
import 'package:flutter_feature_collection/features/login/data/login_repository.dart';
import 'package:flutter_feature_collection/features/home/data/home_service.dart';
import 'package:flutter_feature_collection/shared/models/banner_info.dart';
import 'package:flutter_feature_collection/shared/models/comment_info.dart';
import 'package:flutter_feature_collection/shared/models/page_data.dart';
import 'package:flutter_feature_collection/shared/models/user_info.dart';
import 'package:flutter_feature_collection/shared/models/video_info.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_repository.g.dart';

@riverpod
HomeRepository homeRepository(Ref ref) {
  return HomeRepository(
    homeService: ref.watch(homeServiceProvider),
    loginRepository: ref.watch(loginRepositoryProvider),
  );
}

class HomeRepository {
  HomeRepository({
    required HomeService homeService,
    required LoginRepository loginRepository,
  }) : _homeService = homeService,
       _loginRepository = loginRepository;

  final HomeService _homeService;
  final LoginRepository _loginRepository;

  Future<UserInfo?> getCurrentUser() {
    return _loginRepository.getCurrentUser();
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
