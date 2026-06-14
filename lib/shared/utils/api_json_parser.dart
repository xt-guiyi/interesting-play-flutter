import 'package:interesting_play_flutter/core/network/api_response.dart';
import 'package:interesting_play_flutter/shared/models/page_data.dart';

typedef JsonMap = Map<String, dynamic>;

/// 业务模型的 JSON 解析函数类型。
///
/// 例如 `UserInfo.fromJson`、`VideoInfo.fromJson` 这类方法都符合这个类型。
/// 抽出这个类型后，下面的通用解析方法就可以接收任意业务模型的
/// `fromJson` 方法，而不需要知道具体模型是谁。
typedef JsonObjectParser<T> = T Function(JsonMap json);

/// 把任意 JSON 数据转换成 `Map<String, dynamic>`。
///
/// 使用场景：
/// - 解析接口最外层响应对象，例如 `{ code, message, data }`。
/// - 解析业务对象，例如 `{ id, name }`。
/// - 解析分页对象，例如 `{ page, pageSize, total, data }`。
///
/// 如果传入的已经是 `Map<String, dynamic>`，会直接返回。
/// 如果传入的是普通 `Map`，会把 key 转成 `String`，方便后续传给
/// freezed/json_serializable 生成的 `fromJson` 方法。
///
/// 如果传入的数据不是对象结构，会抛出 `FormatException`，说明接口返回格式
/// 和当前解析方法期望的不一致。
JsonMap parseJsonMap(Object? json) {
  if (json is JsonMap) return json;
  if (json is Map) {
    return json.map((key, value) => MapEntry(key.toString(), value));
  }
  throw FormatException('Expected JSON object, but got ${json.runtimeType}.');
}

/// 把任意 JSON 数据转换成 `List<dynamic>`。
///
/// 使用场景：
/// - 解析接口里的数组字段，例如 `data: [...]`。
/// - 作为列表模型解析的第一步，再逐个元素转成具体业务模型。
///
/// 如果传入的已经是 `List<dynamic>`，会直接返回。
/// 如果传入的是其他泛型列表，会转换成 `List<dynamic>`。
///
/// 如果传入的数据不是数组结构，会抛出 `FormatException`，说明接口返回格式
/// 和当前解析方法期望的不一致。
List<dynamic> parseJsonList(Object? json) {
  if (json is List<dynamic>) return json;
  if (json is List) return json.cast<dynamic>();
  throw FormatException('Expected JSON list, but got ${json.runtimeType}.');
}

/// 把一个 JSON 对象解析成具体业务模型。
///
/// 使用场景：
/// - 解析单个对象，例如 `UserInfo`、`VideoInfo`、`BannerInfo`。
///
/// 参数：
/// - `json`：接口返回里的对象数据。
/// - `fromJson`：具体模型自己的 `fromJson` 方法。
///
/// 示例：
/// ```dart
/// final user = parseJsonObject(json, UserInfo.fromJson);
/// ```
///
/// 内部会先调用 [parseJsonMap] 保证数据是对象结构，再交给模型自己的
/// `fromJson` 继续解析。
T parseJsonObject<T>(Object? json, JsonObjectParser<T> fromJson) {
  return fromJson(parseJsonMap(json));
}

/// 把一个 JSON 数组解析成具体业务模型列表。
///
/// 使用场景：
/// - 解析 `List<BannerInfo>`。
/// - 解析 `List<VideoInfo>`。
/// - 解析 `PageData<List<T>>` 里面的 `data` 数组。
///
/// 参数：
/// - `json`：接口返回里的数组数据。
/// - `fromJson`：数组里每个元素对应模型的 `fromJson` 方法。
///
/// 示例：
/// ```dart
/// final banners = parseJsonObjectList(json, BannerInfo.fromJson);
/// ```
///
/// 内部会先调用 [parseJsonList] 确保外层是数组，再对每一项调用
/// [parseJsonObject] 转成具体模型。
List<T> parseJsonObjectList<T>(Object? json, JsonObjectParser<T> fromJson) {
  return parseJsonList(
    json,
  ).map((item) => parseJsonObject(item, fromJson)).toList();
}

/// 解析接口最外层的统一响应结构 `ApiResponse<T>`。
///
/// 使用场景：
/// - 接口返回结构统一是 `{ code, message, data }`。
/// - `data` 可能是字符串、数字、对象、数组、分页对象等任意类型。
///
/// 参数：
/// - `json`：Dio 返回的 `response.data`。
/// - `fromJsonT`：告诉 `ApiResponse` 应该怎么解析里面的 `data` 字段。
///
/// 示例：
/// ```dart
/// final response = parseApiResponse<String>(
///   response.data,
///   (json) => json as String,
/// );
/// ```
///
/// 这个方法只负责 JSON 转模型，不负责判断 `code == 200`。
/// 业务成功/失败判断仍然交给 repository 层的 `unwrapApiResponse`。
ApiResponse<T> parseApiResponse<T>(
  Object? json,
  T Function(Object? json) fromJsonT,
) {
  return ApiResponse<T>.fromJson(parseJsonMap(json), fromJsonT);
}

/// 解析 `ApiResponse<T>`，其中 `data` 是单个业务对象。
///
/// 适合这种接口结构：
/// ```json
/// {
///   "code": 200,
///   "message": "ok",
///   "data": { "id": 1, "name": "Tom" }
/// }
/// ```
///
/// 使用场景：
/// - `ApiResponse<UserInfo>`
/// - `ApiResponse<VideoInfo>`
/// - `ApiResponse<BannerInfo>`
///
/// 示例：
/// ```dart
/// return parseApiObjectResponse(response.data, UserInfo.fromJson);
/// ```
ApiResponse<T> parseApiObjectResponse<T>(
  Object? json,
  JsonObjectParser<T> fromJson,
) {
  return parseApiResponse<T>(
    json,
    (dataJson) => parseJsonObject(dataJson, fromJson),
  );
}

/// 解析 `ApiResponse<List<T>>`，其中 `data` 是业务对象数组。
///
/// 适合这种接口结构：
/// ```json
/// {
///   "code": 200,
///   "message": "ok",
///   "data": [
///     { "id": 1, "title": "A" },
///     { "id": 2, "title": "B" }
///   ]
/// }
/// ```
///
/// 使用场景：
/// - `ApiResponse<List<BannerInfo>>`
/// - `ApiResponse<List<CommentInfo>>`
/// - 任意没有分页包装的列表接口。
///
/// 示例：
/// ```dart
/// return parseApiObjectListResponse(response.data, BannerInfo.fromJson);
/// ```
ApiResponse<List<T>> parseApiObjectListResponse<T>(
  Object? json,
  JsonObjectParser<T> fromJson,
) {
  return parseApiResponse<List<T>>(
    json,
    (dataJson) => parseJsonObjectList(dataJson, fromJson),
  );
}

/// 解析 `ApiResponse<PageData<List<T>>>`，其中 `data` 是分页对象，
/// 分页对象里的 `data` 字段又是业务对象数组。
///
/// 适合这种接口结构：
/// ```json
/// {
///   "code": 200,
///   "message": "ok",
///   "data": {
///     "page": 1,
///     "pageSize": 10,
///     "total": 100,
///     "data": [
///       { "id": 1, "title": "A" },
///       { "id": 2, "title": "B" }
///     ]
///   }
/// }
/// ```
///
/// 使用场景：
/// - `ApiResponse<PageData<List<VideoInfo>>>`
/// - `ApiResponse<PageData<List<DiscoverInfo>>>`
/// - `ApiResponse<PageData<List<CommentInfo>>>`
///
/// 示例：
/// ```dart
/// return parseApiPageObjectListResponse(response.data, VideoInfo.fromJson);
/// ```
///
/// 这是项目里最常见、也是之前代码最冗长的一种解析方式。抽出这个方法后，
/// service 层只需要表达“这是一个分页列表接口”，不用每个接口都重复写
/// `ApiResponse -> PageData -> List<T>` 的嵌套转换。
ApiResponse<PageData<List<T>>> parseApiPageObjectListResponse<T>(
  Object? json,
  JsonObjectParser<T> fromJson,
) {
  return parseApiResponse<PageData<List<T>>>(
    json,
    (dataJson) => PageData<List<T>>.fromJson(
      parseJsonMap(dataJson),
      (listJson) => parseJsonObjectList(listJson, fromJson),
    ),
  );
}
