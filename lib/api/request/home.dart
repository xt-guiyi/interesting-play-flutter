import 'package:interesting_play_flutter/api/pageData.dart';
import 'package:interesting_play_flutter/api/responseResult.dart';
import 'package:interesting_play_flutter/model/commentInfo.dart';
import 'package:interesting_play_flutter/model/videoInfo.dart';
import 'package:interesting_play_flutter/model/bannerInfo.dart';
import '../index.dart';

/// 获取视频数据
Future<ResponseResult<PageData<List<VideoInfo>>>> getVideoList(int page, int pageSize) async {
  final response = await dio.get('/mock/getVideoList?page=$page&pageSize=$pageSize');
  return ResponseResult<PageData<List<VideoInfo>>>.fromJson(
    response.data,
        (pageDataJson) => PageData<List<VideoInfo>>.fromJson(
      pageDataJson as Map<String, dynamic>,
          (videoInfoJson) {
        return (videoInfoJson as List<dynamic>)
            .map((item) => VideoInfo.fromJson(item as Map<String, dynamic>))
            .toList();
      },
    ),
  );
}

/// 获取视频评论列表
Future<ResponseResult<PageData<List<CommentInfo>>>> getCommentList(
    int page, int pageSize) async {
  final response = await dio.get('/mock/getCommentList?page=$page&pageSize=$pageSize');
  return ResponseResult<PageData<List<CommentInfo>>>.fromJson(
    response.data,
    (pageDataJson) => PageData<List<CommentInfo>>.fromJson(
      pageDataJson as Map<String, dynamic>,
      (commentInfoJson) {
        return (commentInfoJson as List<dynamic>)
            .map((item) => CommentInfo.fromJson(item as Map<String, dynamic>))
            .toList();
      },
    ),
  );
}

/// 获取轮播图数据
Future<ResponseResult<BannerInfo>> getBanners(int page, int pageSize) async {
  final response = await dio.get('/mock/getBanners');
  return ResponseResult<BannerInfo>.fromJson(
    response.data,
      (bannerJson) => BannerInfo.fromJson(bannerJson as Map<String, dynamic>)
  );
}
