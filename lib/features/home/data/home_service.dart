import 'package:dio/dio.dart';
import 'package:flutter_feature_collection/core/network/providers/api_client_provider.dart';
import 'package:flutter_feature_collection/core/network/models/api_response.dart';
import 'package:flutter_feature_collection/shared/models/banner_info.dart';
import 'package:flutter_feature_collection/shared/models/comment_info.dart';
import 'package:flutter_feature_collection/shared/models/page_data.dart';
import 'package:flutter_feature_collection/shared/models/video_info.dart';
import 'package:flutter_feature_collection/core/utils/api_json_parser.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_service.g.dart';

@riverpod
HomeService homeService(Ref ref) {
  return HomeService(ref.watch(apiClientProvider));
}

class HomeService {
  HomeService(this._client);

  final Dio _client;

  Future<ApiResponse<PageData<List<VideoInfo>>>> getVideoList(
    int page,
    int pageSize, {
    bool showGlobalErrorToast = true,
  }) async {
    final response = await _client.get(
      '/mock/getVideoList',
      queryParameters: {'page': page, 'pageSize': pageSize},
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
    final response = await _client.get(
      '/mock/getCommentList',
      queryParameters: {'page': page, 'pageSize': pageSize},
      options: ApiRequestOptions.globalErrorToast(
        enabled: showGlobalErrorToast,
      ),
    );
    return parseApiPageObjectListResponse(response.data, CommentInfo.fromJson);
  }

  Future<ApiResponse<List<BannerInfo>>> getBanners({
    bool showGlobalErrorToast = true,
  }) async {
    final response = await _client.get(
      '/mock/getBanners',
      options: ApiRequestOptions.globalErrorToast(
        enabled: showGlobalErrorToast,
      ),
    );
    return parseApiObjectListResponse(response.data, BannerInfo.fromJson);
  }
}
