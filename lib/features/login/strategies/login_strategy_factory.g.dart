// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_strategy_factory.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// 注入登录 Repository，供各渠道策略复用。

@ProviderFor(loginStrategyFactory)
final loginStrategyFactoryProvider = LoginStrategyFactoryProvider._();

/// 注入登录 Repository，供各渠道策略复用。

final class LoginStrategyFactoryProvider
    extends
        $FunctionalProvider<
          LoginStrategyFactory,
          LoginStrategyFactory,
          LoginStrategyFactory
        >
    with $Provider<LoginStrategyFactory> {
  /// 注入登录 Repository，供各渠道策略复用。
  LoginStrategyFactoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'loginStrategyFactoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$loginStrategyFactoryHash();

  @$internal
  @override
  $ProviderElement<LoginStrategyFactory> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  LoginStrategyFactory create(Ref ref) {
    return loginStrategyFactory(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LoginStrategyFactory value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LoginStrategyFactory>(value),
    );
  }
}

String _$loginStrategyFactoryHash() =>
    r'90bf73c917328890b465bce95933270d2d445588';
