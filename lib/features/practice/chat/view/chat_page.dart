/*
 * @Author: xt 1661219752@qq.com
 * @Date: 2024-09-11 18:34:20
 * @LastEditors: xt 1661219752@qq.com
 * @LastEditTime: 2024-09-12 09:52:19
 * @Description: 聊天页
 */
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:interesting_play_flutter/core/theme/app_colors.dart';
import 'package:interesting_play_flutter/features/practice/chat/viewmodel/chat_viewmodel.dart';

import 'components/chat_item_1.dart';
import 'components/chat_item_2.dart';
import 'components/chat_item_3.dart';

enum Side { left, right }

enum ChatType { text, textAndTable }

class ChatPage extends ConsumerStatefulWidget {
  const ChatPage({super.key});

  @override
  ConsumerState<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends ConsumerState<ChatPage> {
  late TextEditingController _controller;
  late ScrollController _scrollController;

  void onSend() {
    if (_controller.text.isEmpty) {
      return;
    }
    ref.read(chatViewModelProvider.notifier).send(_controller.text);
    _controller.clear();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToBottom();
    });
  }

  void _scrollToBottom() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent, // 滚动到最大位置，即底部
      duration: const Duration(milliseconds: 300), // 动画持续时间
      curve: Curves.easeOut, // 动画曲线
    );
  }

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final messages = ref.watch(chatViewModelProvider).messages;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.green_300,
        scrolledUnderElevation: 0,
        title: const Text('小🐑聊天'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: ListView.builder(
              padding: const EdgeInsets.fromLTRB(12, 8, 12, 0),
              itemCount: messages.length,
              controller: _scrollController,
              itemBuilder: (BuildContext context, int index) {
                final message = messages[index];
                return switch (message.type) {
                  1 => ChatItem1(
                    content: message.text,
                    side: index == 0 ? Side.left : Side.right,
                  ),
                  2 => ChatItem2(content: message.text, side: Side.left),
                  3 => ChatItem3(content: message.text, side: Side.left),
                  _ => const SizedBox.shrink(),
                };
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
            decoration: const BoxDecoration(color: AppColors.green_100),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: 0,
                      horizontal: 12,
                    ),
                    padding: const EdgeInsets.symmetric(
                      vertical: 4,
                      horizontal: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: TextField(
                      controller: _controller,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        height: 1,
                      ),
                      cursorColor: AppColors.green_300, // 直接设置光标颜色
                      decoration: InputDecoration(
                        hintText: '请输入内容',
                        labelStyle: null,
                        isCollapsed: true,
                        // filled: true,
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 6,
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(6.0),
                        ),
                      ),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: onSend,
                  style: TextButton.styleFrom(
                    backgroundColor: AppColors.green_300,
                    padding: const EdgeInsets.symmetric(
                      vertical: 0,
                      horizontal: 0,
                    ),
                    minimumSize: const Size(66, 36),
                  ),
                  child: const Text(
                    '发送',
                    style: TextStyle(fontSize: 12, color: Colors.white),
                  ),
                ),
                const SizedBox(width: 12.0),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
