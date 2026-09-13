import 'package:dio/dio.dart';

import 'vo/login_command.dart';
import '../model/vo/response/login_response.dart';

/// 登录策略
abstract interface class LoginStrategy {
  /// 执行渠道登录并返回应用登录结果；正常取消授权时返回 null。
  /// 网络取消也可能抛出异常，由 ViewModel 根据取消标记忽略。
  Future<LoginResponse?> authenticate(
    LoginCommand command,
    CancelToken cancelToken,
  );
}
