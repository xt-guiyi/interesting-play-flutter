// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_viewmodel.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ProfileViewModel)
final profileViewModelProvider = ProfileViewModelProvider._();

final class ProfileViewModelProvider
    extends $NotifierProvider<ProfileViewModel, ProfileState> {
  ProfileViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'profileViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$profileViewModelHash();

  @$internal
  @override
  ProfileViewModel create() => ProfileViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ProfileState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ProfileState>(value),
    );
  }
}

String _$profileViewModelHash() => r'023a18be253de2d94489be90c7111ead56f1d329';

abstract class _$ProfileViewModel extends $Notifier<ProfileState> {
  ProfileState build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<ProfileState, ProfileState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ProfileState, ProfileState>,
              ProfileState,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
