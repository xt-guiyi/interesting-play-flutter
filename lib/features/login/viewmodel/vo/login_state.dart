import 'package:freezed_annotation/freezed_annotation.dart';

import '../../strategies/vo/login_method.dart';

part 'login_state.freezed.dart';

/// 登录入口页的执行进度和错误提示，不代表全局登录会话。
@freezed
abstract class LoginState with _$LoginState {
  /// 供生成的实现继承 isBusy 计算属性。
  const LoginState._();

  /// 创建入口页状态，未指定渠道时表示当前没有正在执行的登录。
  const factory LoginState({LoginMethod? activeMethod, String? errorMessage}) =
      _LoginState;

  /// 是否正在登录，用于显示进度及禁用重复操作。
  bool get isBusy => activeMethod != null;
}
