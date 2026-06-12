import 'package:dio/dio.dart';
import 'package:interesting_play_flutter/core/network/api_client.dart';
import 'package:interesting_play_flutter/core/network/response_result.dart';
import 'package:interesting_play_flutter/shared/models/banner_info.dart';
import 'package:interesting_play_flutter/shared/models/comment_info.dart';
import 'package:interesting_play_flutter/shared/models/page_data.dart';
import 'package:interesting_play_flutter/shared/models/video_info.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_service.g.dart';

@riverpod
HomeService homeService(Ref ref) {
  return HomeService(ref.watch(dioProvider));
}

class HomeService {
  HomeService(this._dio);

  final Dio _dio;

  Future<ResponseResult<PageData<List<VideoInfo>>>> getVideoList(
    int page,
    int pageSize,
  ) async {
    final response = await _dio.get(
      '/mock/getVideoList?page=$page&pageSize=$pageSize',
    );
    return ResponseResult<PageData<List<VideoInfo>>>.fromJson(
      response.data as Map<String, dynamic>,
      (json) => PageData<List<VideoInfo>>.fromJson(
        json as Map<String, dynamic>,
        (listJson) => (listJson as List<dynamic>)
            .map((item) => VideoInfo.fromJson(item as Map<String, dynamic>))
            .toList(),
      ),
    );
  }

  Future<ResponseResult<PageData<List<CommentInfo>>>> getCommentList(
    int page,
    int pageSize,
  ) async {
    final response = await _dio.get(
      '/mock/getCommentList?page=$page&pageSize=$pageSize',
    );
    return ResponseResult<PageData<List<CommentInfo>>>.fromJson(
      response.data as Map<String, dynamic>,
      (json) => PageData<List<CommentInfo>>.fromJson(
        json as Map<String, dynamic>,
        (listJson) => (listJson as List<dynamic>)
            .map((item) => CommentInfo.fromJson(item as Map<String, dynamic>))
            .toList(),
      ),
    );
  }

  Future<ResponseResult<List<BannerInfo>>> getBanners() async {
    final response = await _dio.get('/mock/getBanners');
    return ResponseResult<List<BannerInfo>>.fromJson(
      response.data as Map<String, dynamic>,
      (json) => (json as List<dynamic>)
          .map((item) => BannerInfo.fromJson(item as Map<String, dynamic>))
          .toList(),
    );
  }
}
