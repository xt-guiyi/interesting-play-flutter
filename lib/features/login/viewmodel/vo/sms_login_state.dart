import 'package:freezed_annotation/freezed_annotation.dart';

part 'sms_login_state.freezed.dart';

/// 短信页的请求进度、重发剩余秒数和错误提示。
@freezed
abstract class SmsLoginState with _$SmsLoginState {
  /// 供生成的实现继承 isBusy 计算属性。
  const SmsLoginState._();

  /// 创建短信页状态，默认没有请求且可以发送验证码。
  const factory SmsLoginState({
    @Default(false) bool isSendingCode,
    @Default(false) bool isLoggingIn,
    @Default(0) int resendSeconds,
    String? errorMessage,
  }) = _SmsLoginState;

  /// 发验证码或提交登录期间禁用表单操作，倒计时本身不算忙碌。
  bool get isBusy => isSendingCode || isLoggingIn;
}
