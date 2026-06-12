import 'package:interesting_play_flutter/features/chat/model/message_item.dart';
import 'package:interesting_play_flutter/features/chat/model/chat_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'chat_viewmodel.g.dart';

@riverpod
class ChatViewModel extends _$ChatViewModel {
  @override
  ChatState build() {
    return const ChatState();
  }

  void send(String text) {
    final trimmedText = text.trim();
    if (trimmedText.isEmpty) return;

    final message = switch (trimmedText) {
      '1' => const MessageItem(type: 2, text: '这是一个表格'),
      '2' => const MessageItem(type: 3, text: '这是一个图表'),
      _ => MessageItem(type: 1, text: trimmedText),
    };

    state = state.copyWith(messages: [...state.messages, message]);
  }

  void reset() {
    state = const ChatState();
  }
}
