import 'package:interesting_play_flutter/core/network/api_exception.dart';
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
  HomeRepository({required this.homeService, required this.authRepository});

  final HomeService homeService;
  final AuthRepository authRepository;

  Future<UserInfo?> getCurrentUser() {
    return authRepository.getCurrentUser();
  }

  Future<List<BannerInfo>> getBanners() async {
    final result = await homeService.getBanners();
    if (result.code != 200 || result.data == null) {
      throw ApiException(
        message: result.message ?? '获取轮播图失败',
        statusCode: result.code,
      );
    }
    return result.data!;
  }

  Future<PageData<List<VideoInfo>>> getVideoList(int page, int pageSize) async {
    final result = await homeService.getVideoList(page, pageSize);
    if (result.code != 200 || result.data == null) {
      throw ApiException(
        message: result.message ?? '获取视频列表失败',
        statusCode: result.code,
      );
    }
    return result.data!;
  }

  Future<PageData<List<CommentInfo>>> getCommentList(
    int page,
    int pageSize,
  ) async {
    final result = await homeService.getCommentList(page, pageSize);
    if (result.code != 200 || result.data == null) {
      throw ApiException(
        message: result.message ?? '获取评论列表失败',
        statusCode: result.code,
      );
    }
    return result.data!;
  }
}
