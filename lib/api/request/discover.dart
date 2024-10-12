
import 'package:dio/dio.dart';
import '../index.dart';

/// 获取视频列表
Future<Response> getDiscoverList(int page, int pageSize) async {
  return await dio.get('/mock/getDiscoverList?page=$page&pageSize=$pageSize');
}