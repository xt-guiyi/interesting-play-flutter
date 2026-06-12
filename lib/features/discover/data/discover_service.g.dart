// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'discover_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(discoverService)
final discoverServiceProvider = DiscoverServiceProvider._();

final class DiscoverServiceProvider
    extends
        $FunctionalProvider<DiscoverService, DiscoverService, DiscoverService>
    with $Provider<DiscoverService> {
  DiscoverServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'discoverServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$discoverServiceHash();

  @$internal
  @override
  $ProviderElement<DiscoverService> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  DiscoverService create(Ref ref) {
    return discoverService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DiscoverService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DiscoverService>(value),
    );
  }
}

String _$discoverServiceHash() => r'9dcb36e7d831825eb01d3dac74698b64e4395dd3';
