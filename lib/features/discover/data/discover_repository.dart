import 'package:interesting_play_flutter/core/network/api_exception.dart';
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
    int pageSize,
  ) async {
    final result = await _discoverService.getDiscoverList(page, pageSize);
    if (result.code != 200 || result.data == null) {
      throw ApiException(
        message: result.message ?? '获取发现列表失败',
        statusCode: result.code,
      );
    }
    return result.data!;
  }
}
