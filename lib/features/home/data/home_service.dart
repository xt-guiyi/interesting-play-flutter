import 'package:dio/dio.dart';
import 'package:interesting_play_flutter/core/network/api_client.dart';
import 'package:interesting_play_flutter/core/network/api_response.dart';
import 'package:interesting_play_flutter/shared/models/banner_info.dart';
import 'package:interesting_play_flutter/shared/models/comment_info.dart';
import 'package:interesting_play_flutter/shared/models/page_data.dart';
import 'package:interesting_play_flutter/shared/models/video_info.dart';
import 'package:interesting_play_flutter/shared/utils/api_json_parser.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_service.g.dart';

@riverpod
HomeService homeService(Ref ref) {
  return HomeService(ref.watch(dioProvider));
}

class HomeService {
  HomeService(this._dio);

  final Dio _dio;

  Future<ApiResponse<PageData<List<VideoInfo>>>> getVideoList(
    int page,
    int pageSize, {
    bool showGlobalErrorToast = true,
  }) async {
    final response = await _dio.get(
      '/mock/getVideoList?page=$page&pageSize=$pageSize',
      options: ApiRequestOptions.globalErrorToast(
        enabled: showGlobalErrorToast,
      ),
    );

    return parseApiPageObjectListResponse(response.data, VideoInfo.fromJson);
  }

  Future<ApiResponse<PageData<List<CommentInfo>>>> getCommentList(
    int page,
    int pageSize, {
    bool showGlobalErrorToast = true,
  }) async {
    final response = await _dio.get(
      '/mock/getCommentList?page=$page&pageSize=$pageSize',
      options: ApiRequestOptions.globalErrorToast(
        enabled: showGlobalErrorToast,
      ),
    );
    return parseApiPageObjectListResponse(response.data, CommentInfo.fromJson);
  }

  Future<ApiResponse<List<BannerInfo>>> getBanners({
    bool showGlobalErrorToast = true,
  }) async {
    final response = await _dio.get(
      '/mock/getBanners',
      options: ApiRequestOptions.globalErrorToast(
        enabled: showGlobalErrorToast,
      ),
    );
    return parseApiObjectListResponse(response.data, BannerInfo.fromJson);
  }
}
