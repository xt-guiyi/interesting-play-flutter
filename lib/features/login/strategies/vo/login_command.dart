import 'login_method.dart';

/// 描述登录渠道及其输入参数，短信参数不会混入第三方登录命令。
sealed class LoginCommand {
  /// 供本文件内的具体命令继承，外部通过命名工厂创建。
  const LoginCommand._();

  /// 创建无需表单参数的 Google 登录命令。
  const factory LoginCommand.google() = GoogleLoginCommand;
  /// 创建无需表单参数的 GitHub 登录命令。
  const factory LoginCommand.github() = GithubLoginCommand;
  /// 创建携带手机号和验证码的短信登录命令。
  const factory LoginCommand.sms({
    required String phone,
    required String code,
  }) = SmsLoginCommand;

  /// 根据命令类型确定渠道，供工厂选择策略及页面展示进度。
  LoginMethod get method => switch (this) {
    GoogleLoginCommand() => LoginMethod.google,
    GithubLoginCommand() => LoginMethod.github,
    SmsLoginCommand() => LoginMethod.sms,
  };
}

/// Google 登录输入，授权凭证由策略从 SDK 获取。
final class GoogleLoginCommand extends LoginCommand {
  /// 创建 Google 登录输入。
  const GoogleLoginCommand() : super._();
}

/// GitHub 登录输入，授权码由策略打开系统授权页获取。
final class GithubLoginCommand extends LoginCommand {
  /// 创建 GitHub 登录输入。
  const GithubLoginCommand() : super._();
}

/// 短信登录输入，保存本次提交的手机号和验证码。
final class SmsLoginCommand extends LoginCommand {
  /// 创建短信登录输入，不在此处执行表单校验。
  const SmsLoginCommand({required this.phone, required this.code}) : super._();

  final String phone;
  final String code;
}
