import 'package:dio/dio.dart';
import 'package:flutter_feature_collection/core/network/providers/api_client_provider.dart';
import 'package:flutter_feature_collection/core/network/models/api_response.dart';
import 'package:flutter_feature_collection/shared/models/discover_info.dart';
import 'package:flutter_feature_collection/shared/models/page_data.dart';
import 'package:flutter_feature_collection/core/utils/api_json_parser.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'discover_service.g.dart';

@riverpod
DiscoverService discoverService(Ref ref) {
  return DiscoverService(ref.watch(apiClientProvider));
}

class DiscoverService {
  DiscoverService(this._client);

  final Dio _client;

  Future<ApiResponse<PageData<List<DiscoverInfo>>>> getDiscoverList(
    int page,
    int pageSize, {
    bool showGlobalErrorToast = true,
  }) async {
    final response = await _client.get(
      '/mock/getDiscoverList',
      queryParameters: {'page': page, 'pageSize': pageSize},
      options: ApiRequestOptions.globalErrorToast(
        enabled: showGlobalErrorToast,
      ),
    );
    return parseApiPageObjectListResponse(response.data, DiscoverInfo.fromJson);
  }
}
