import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_request.freezed.dart';
part 'login_request.g.dart';

/// 短信登录请求体，仅生成发送请求所需的 toJson。
@Freezed(fromJson: false, toJson: true)
abstract class LoginRequest with _$LoginRequest {
  /// 构造手机号、验证码及登录类型，默认使用 SMS_CODE。
  const factory LoginRequest({
    required String account,
    required String code,
    @Default('SMS_CODE') String loginType,
  }) = _LoginRequest;
}
