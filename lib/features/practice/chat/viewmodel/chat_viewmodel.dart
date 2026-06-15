import 'package:interesting_play_flutter/features/practice/chat/model/chat_state.dart';
import 'package:interesting_play_flutter/features/practice/chat/model/message_item.dart';
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

    // 先追加用户消息（右侧）
    final userMessage = MessageItem(type: 1, text: trimmedText, isUser: true);

    // AI 回复（左侧，isUser 默认 false）
    final aiMessage = switch (trimmedText) {
      '1' => const MessageItem(type: 2, text: '这是一个表格'),
      '2' => const MessageItem(type: 3, text: '这是一个图表'),
      _ => MessageItem(type: 1, text: '你说的是："$trimmedText"，我明白了！'),
    };

    state = state.copyWith(
      messages: [...state.messages, userMessage, aiMessage],
    );
  }

  void reset() {
    state = const ChatState();
  }

  void sendImage(String imagePath) {
    final imageMessage = MessageItem(
      type: 4,
      text: '',
      isUser: true,
      imagePath: imagePath,
    );
    state = state.copyWith(
      messages: [...state.messages, imageMessage],
    );
  }
}
