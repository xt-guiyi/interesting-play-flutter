// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_viewmodel.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// 登录入口页负责 Google、GitHub 登录流程，不持有短信表单或倒计时。

@ProviderFor(LoginViewModel)
final loginViewModelProvider = LoginViewModelProvider._();

/// 登录入口页负责 Google、GitHub 登录流程，不持有短信表单或倒计时。
final class LoginViewModelProvider
    extends $NotifierProvider<LoginViewModel, LoginState> {
  /// 登录入口页负责 Google、GitHub 登录流程，不持有短信表单或倒计时。
  LoginViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'loginViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$loginViewModelHash();

  @$internal
  @override
  LoginViewModel create() => LoginViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LoginState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LoginState>(value),
    );
  }
}

String _$loginViewModelHash() => r'777f55f8e31835fc364bb5c5fdd3fdd066936504';

/// 登录入口页负责 Google、GitHub 登录流程，不持有短信表单或倒计时。

abstract class _$LoginViewModel extends $Notifier<LoginState> {
  LoginState build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<LoginState, LoginState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<LoginState, LoginState>,
              LoginState,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
