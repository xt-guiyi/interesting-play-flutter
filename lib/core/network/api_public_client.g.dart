// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_public_client.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(publicDio)
final publicDioProvider = PublicDioProvider._();

final class PublicDioProvider extends $FunctionalProvider<Dio, Dio, Dio>
    with $Provider<Dio> {
  PublicDioProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'publicDioProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$publicDioHash();

  @$internal
  @override
  $ProviderElement<Dio> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Dio create(Ref ref) {
    return publicDio(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Dio value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Dio>(value),
    );
  }
}

String _$publicDioHash() => r'efc95b8c15e2b02c2f851b9ac8e4c8ac206313ef';
