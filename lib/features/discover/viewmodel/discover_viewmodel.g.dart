// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'discover_viewmodel.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(DiscoverViewModel)
final discoverViewModelProvider = DiscoverViewModelProvider._();

final class DiscoverViewModelProvider
    extends $NotifierProvider<DiscoverViewModel, DiscoverState> {
  DiscoverViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'discoverViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$discoverViewModelHash();

  @$internal
  @override
  DiscoverViewModel create() => DiscoverViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DiscoverState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DiscoverState>(value),
    );
  }
}

String _$discoverViewModelHash() => r'b765d5baceb3ad28c8936ba1c50890f10d963dd6';

abstract class _$DiscoverViewModel extends $Notifier<DiscoverState> {
  DiscoverState build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<DiscoverState, DiscoverState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<DiscoverState, DiscoverState>,
              DiscoverState,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
