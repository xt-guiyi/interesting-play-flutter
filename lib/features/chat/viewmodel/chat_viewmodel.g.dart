// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_viewmodel.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ChatViewModel)
final chatViewModelProvider = ChatViewModelProvider._();

final class ChatViewModelProvider
    extends $NotifierProvider<ChatViewModel, ChatState> {
  ChatViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'chatViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$chatViewModelHash();

  @$internal
  @override
  ChatViewModel create() => ChatViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ChatState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ChatState>(value),
    );
  }
}

String _$chatViewModelHash() => r'416c399427425782dc0b6ee926a77256299431c7';

abstract class _$ChatViewModel extends $Notifier<ChatState> {
  ChatState build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<ChatState, ChatState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ChatState, ChatState>,
              ChatState,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
