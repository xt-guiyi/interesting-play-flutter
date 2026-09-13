import 'package:flutter_feature_collection/core/network/models/api_response.dart';
import 'package:flutter_feature_collection/features/discover/data/discover_service.dart';
import 'package:flutter_feature_collection/shared/models/discover_info.dart';
import 'package:flutter_feature_collection/shared/models/page_data.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'discover_repository.g.dart';

@riverpod
DiscoverRepository discoverRepository(Ref ref) {
  return DiscoverRepository(ref.watch(discoverServiceProvider));
}

class DiscoverRepository {
  DiscoverRepository(this._discoverService);

  final DiscoverService _discoverService;

  Future<PageData<List<DiscoverInfo>>> getDiscoverList(
    int page,
    int pageSize, {
    bool showGlobalErrorToast = true,
  }) async {
    final result = await _discoverService.getDiscoverList(
      page,
      pageSize,
      showGlobalErrorToast: showGlobalErrorToast,
    );
    return unwrapApiResponse(result, '获取发现列表失败');
  }
}
