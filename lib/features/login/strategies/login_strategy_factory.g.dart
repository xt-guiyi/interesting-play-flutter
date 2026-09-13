// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_strategy_factory.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(loginStrategyFactory)
final loginStrategyFactoryProvider = LoginStrategyFactoryProvider._();

final class LoginStrategyFactoryProvider
    extends
        $FunctionalProvider<
          LoginStrategyFactory,
          LoginStrategyFactory,
          LoginStrategyFactory
        >
    with $Provider<LoginStrategyFactory> {
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
