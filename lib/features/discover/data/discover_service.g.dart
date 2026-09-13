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

String _$discoverServiceHash() => r'0c7512155fd27b6e90f0cdd5b71da9abf67d44b1';
