// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'json_placeholder_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(jsonPlaceholderService)
final jsonPlaceholderServiceProvider = JsonPlaceholderServiceProvider._();

final class JsonPlaceholderServiceProvider
    extends
        $FunctionalProvider<
          JsonPlaceholderService,
          JsonPlaceholderService,
          JsonPlaceholderService
        >
    with $Provider<JsonPlaceholderService> {
  JsonPlaceholderServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'jsonPlaceholderServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$jsonPlaceholderServiceHash();

  @$internal
  @override
  $ProviderElement<JsonPlaceholderService> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  JsonPlaceholderService create(Ref ref) {
    return jsonPlaceholderService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(JsonPlaceholderService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<JsonPlaceholderService>(value),
    );
  }
}

String _$jsonPlaceholderServiceHash() =>
    r'c23a722a8367148787ec7915cd5b8ef1577de16d';
