// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sms_login_viewmodel.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SmsLoginViewModel)
final smsLoginViewModelProvider = SmsLoginViewModelProvider._();

final class SmsLoginViewModelProvider
    extends $NotifierProvider<SmsLoginViewModel, SmsLoginState> {
  SmsLoginViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'smsLoginViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$smsLoginViewModelHash();

  @$internal
  @override
  SmsLoginViewModel create() => SmsLoginViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SmsLoginState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SmsLoginState>(value),
    );
  }
}

String _$smsLoginViewModelHash() => r'aab55d02675f060afac2fd06538eca48ada97c7f';

abstract class _$SmsLoginViewModel extends $Notifier<SmsLoginState> {
  SmsLoginState build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<SmsLoginState, SmsLoginState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<SmsLoginState, SmsLoginState>,
              SmsLoginState,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
