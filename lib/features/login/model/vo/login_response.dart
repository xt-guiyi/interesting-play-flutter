import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../shared/models/user_info.dart';

part 'login_response.freezed.dart';
part 'login_response.g.dart';

/// 后端返回的应用 token 和用户资料，禁用生成的 toString 以免输出 token。
@Freezed(toStringOverride: false)
abstract class LoginResponse with _$LoginResponse {
  /// 供生成的实现继承，使其可以使用 userInfo 转换逻辑。
  const LoginResponse._();

  /// 构造三种登录方式共用的后端登录结果。
  const factory LoginResponse({
    required String token,
    required String userId,
    required String username,
    String? nickname,
    String? avatar,
  }) = _LoginResponse;

  /// 从接口 JSON 解析应用 token 和用户资料。
  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  /// 转成应用通用的用户资料，供本地保存和页面展示。
  UserInfo get userInfo => UserInfo(
    id: userId,
    username: username,
    nickname: nickname,
    avatar: avatar,
  );
}
