import '../../model/discover_info.dart';
import '../index.dart';
import '../page_data.dart';
import '../response_result.dart';

/// 获取视频数据
Future<ResponseResult<PageData<List<DiscoverInfo>>>> getDiscoverList(
    int page, int pageSize) async {
  final response =
      await dio.get('/mock/getDiscoverList?page=$page&pageSize=$pageSize');
  return ResponseResult<PageData<List<DiscoverInfo>>>.fromJson(
    response.data,
    (pageDataJson) => PageData<List<DiscoverInfo>>.fromJson(
      pageDataJson as Map<String, dynamic>,
      (discoverInfoJson) {
        return (discoverInfoJson as List<dynamic>)
            .map((item) => DiscoverInfo.fromJson(item as Map<String, dynamic>))
            .toList();
      },
    ),
  );
}
