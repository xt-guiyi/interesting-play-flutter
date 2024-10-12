
import 'package:dio/dio.dart';
import 'package:interesting_play_flutter/api/responseResult.dart';
import '../index.dart';

/// 获取视频列表
Future<Response<ResponseResult>> getCommentList(int page, int pageSize) async {
  return await dio.get('/mock/getCommentList?page=$page&pageSize=$pageSize');
}

/// 获取轮播图数据
Future<Response<ResponseResult>> getBanners(int page, int pageSize) async {
  return await dio.get('/mock/getBanners');
}