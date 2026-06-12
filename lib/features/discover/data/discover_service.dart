import 'package:dio/dio.dart';
import 'package:interesting_play_flutter/core/network/api_client.dart';
import 'package:interesting_play_flutter/core/network/response_result.dart';
import 'package:interesting_play_flutter/shared/models/discover_info.dart';
import 'package:interesting_play_flutter/shared/models/page_data.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'discover_service.g.dart';

@riverpod
DiscoverService discoverService(Ref ref) {
  return DiscoverService(ref.watch(dioProvider));
}

class DiscoverService {
  DiscoverService(this._dio);

  final Dio _dio;

  Future<ResponseResult<PageData<List<DiscoverInfo>>>> getDiscoverList(
    int page,
    int pageSize,
  ) async {
    final response = await _dio.get(
      '/mock/getDiscoverList?page=$page&pageSize=$pageSize',
    );
    return ResponseResult<PageData<List<DiscoverInfo>>>.fromJson(
      response.data as Map<String, dynamic>,
      (json) => PageData<List<DiscoverInfo>>.fromJson(
        json as Map<String, dynamic>,
        (listJson) => (listJson as List<dynamic>)
            .map((item) => DiscoverInfo.fromJson(item as Map<String, dynamic>))
            .toList(),
      ),
    );
  }
}
