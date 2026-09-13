// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// 为登录接口注入应用 HTTP 客户端。

@ProviderFor(loginService)
final loginServiceProvider = LoginServiceProvider._();

/// 为登录接口注入应用 HTTP 客户端。

final class LoginServiceProvider
    extends $FunctionalProvider<LoginService, LoginService, LoginService>
    with $Provider<LoginService> {
  /// 为登录接口注入应用 HTTP 客户端。
  LoginServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'loginServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$loginServiceHash();

  @$internal
  @override
  $ProviderElement<LoginService> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  LoginService create(Ref ref) {
    return loginService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LoginService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LoginService>(value),
    );
  }
}

String _$loginServiceHash() => r'61abb6c102294bb0258fa4321b08b701550ae001';
