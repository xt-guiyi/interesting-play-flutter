import 'package:interesting_play_flutter/core/network/api_response.dart';
import 'package:interesting_play_flutter/features/discover/data/discover_service.dart';
import 'package:interesting_play_flutter/shared/models/discover_info.dart';
import 'package:interesting_play_flutter/shared/models/page_data.dart';
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
