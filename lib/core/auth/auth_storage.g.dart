// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_storage.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// 提供认证本地存储服务。

@ProviderFor(authStorageService)
final authStorageServiceProvider = AuthStorageServiceProvider._();

/// 提供认证本地存储服务。

final class AuthStorageServiceProvider
    extends
        $FunctionalProvider<
          AuthStorageService,
          AuthStorageService,
          AuthStorageService
        >
    with $Provider<AuthStorageService> {
  /// 提供认证本地存储服务。
  AuthStorageServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'authStorageServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$authStorageServiceHash();

  @$internal
  @override
  $ProviderElement<AuthStorageService> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  AuthStorageService create(Ref ref) {
    return authStorageService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AuthStorageService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AuthStorageService>(value),
    );
  }
}

String _$authStorageServiceHash() =>
    r'2deb08a8dbad0d0264287827964b20fce04880eb';
