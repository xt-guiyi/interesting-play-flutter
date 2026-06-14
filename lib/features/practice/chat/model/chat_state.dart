import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:interesting_play_flutter/features/practice/chat/model/message_item.dart';

part 'chat_state.freezed.dart';

@freezed
abstract class ChatState with _$ChatState {
  const factory ChatState({
    @Default([MessageItem(type: 1, text: '你好，我是小羊。 \n 输入1展示一个表格。\n输入2展示一个图表。')])
    List<MessageItem> messages,
  }) = _ChatState;
}
