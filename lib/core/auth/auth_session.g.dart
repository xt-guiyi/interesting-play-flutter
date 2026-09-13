// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_session.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// 应用级登录会话状态，供路由和网络层共享。

@ProviderFor(AuthSession)
final authSessionProvider = AuthSessionProvider._();

/// 应用级登录会话状态，供路由和网络层共享。
final class AuthSessionProvider
    extends $AsyncNotifierProvider<AuthSession, bool> {
  /// 应用级登录会话状态，供路由和网络层共享。
  AuthSessionProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'authSessionProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$authSessionHash();

  @$internal
  @override
  AuthSession create() => AuthSession();
}

String _$authSessionHash() => r'f7dcb4825ecd52ec18b221531d32406774b37b85';

/// 应用级登录会话状态，供路由和网络层共享。

abstract class _$AuthSession extends $AsyncNotifier<bool> {
  FutureOr<bool> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<bool>, bool>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<bool>, bool>,
              AsyncValue<bool>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
