import 'package:dio/dio.dart';

import '../../model/login_repository.dart';
import '../vo/login_command.dart';
import '../../model/vo/login_response.dart';
import '../login_strategy.dart';

/// 将手机号和验证码提交给后端，不负责发送验证码或管理倒计时。
class SmsLoginStrategy implements LoginStrategy {
  /// 注入短信登录使用的 Repository。
  SmsLoginStrategy(this._repository);

  final LoginRepository _repository;

  /// 执行短信登录并返回应用登录结果，提交前已取消则返回 null。
  @override
  Future<LoginResponse?> authenticate(
    LoginCommand command,
    CancelToken cancelToken,
  ) async {
    if (command is! SmsLoginCommand) {
      throw ArgumentError('SMS command required');
    }
    if (cancelToken.isCancelled) return null;
    return _repository.loginWithSms(
      command.phone,
      command.code,
      cancelToken: cancelToken,
    );
  }
}
