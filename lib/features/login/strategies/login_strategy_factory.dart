import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../model/login_repository.dart';
import 'vo/login_method.dart';
import 'impl/github_login_strategy.dart';
import 'impl/google_login_strategy.dart';
import 'login_strategy.dart';
import 'impl/sms_login_strategy.dart';

part 'login_strategy_factory.g.dart';

/// 注入登录 Repository，供各渠道策略复用。
@riverpod
LoginStrategyFactory loginStrategyFactory(Ref ref) {
  return LoginStrategyFactory(ref.watch(loginRepositoryProvider));
}

/// 根据登录渠道创建对应策略，不负责执行登录或管理状态。
class LoginStrategyFactory {
  
  /// 保存各策略访问后端所需的 Repository。
  LoginStrategyFactory(this._repository);

  final LoginRepository _repository;

  /// 返回 Google、GitHub 或短信登录策略。
  LoginStrategy getStrategy(LoginMethod method) => switch (method) {
    LoginMethod.google => GoogleLoginStrategy(_repository),
    LoginMethod.github => GithubLoginStrategy(_repository),
    LoginMethod.sms => SmsLoginStrategy(_repository),
  };
}
