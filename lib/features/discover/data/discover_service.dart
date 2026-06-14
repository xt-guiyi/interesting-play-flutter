import 'package:dio/dio.dart';
import 'package:interesting_play_flutter/core/network/api_client.dart';
import 'package:interesting_play_flutter/core/network/api_response.dart';
import 'package:interesting_play_flutter/shared/models/discover_info.dart';
import 'package:interesting_play_flutter/shared/models/page_data.dart';
import 'package:interesting_play_flutter/shared/utils/api_json_parser.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'discover_service.g.dart';

@riverpod
DiscoverService discoverService(Ref ref) {
  return DiscoverService(ref.watch(dioProvider));
}

class DiscoverService {
  DiscoverService(this._dio);

  final Dio _dio;

  Future<ApiResponse<PageData<List<DiscoverInfo>>>> getDiscoverList(
    int page,
    int pageSize, {
    bool showGlobalErrorToast = true,
  }) async {
    final response = await _dio.get(
      '/mock/getDiscoverList?page=$page&pageSize=$pageSize',
      options: ApiRequestOptions.globalErrorToast(
        enabled: showGlobalErrorToast,
      ),
    );
    return parseApiPageObjectListResponse(response.data, DiscoverInfo.fromJson);
  }
}
