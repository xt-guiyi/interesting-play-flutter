/*
 * @Author: xt 1661219752@qq.com
 * @Date: 2024-09-11 18:34:20
 * @LastEditors: xt 1661219752@qq.com
 * @LastEditTime: 2024-09-12 09:52:19
 * @Description: 聊天页
 */
import 'package:flutter/material.dart';
import 'package:interesting_play_flutter/constants/app_colors.dart';

import 'components/chat_item_1.dart';
import 'components/chat_item_2.dart';
import 'components/chat_item_3.dart';

enum Side { left, right }

enum ChatType { text, textAndTable }

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {

  final List<Map<String, dynamic>> messageData = <Map<String, dynamic>>[
    {'type': 1, 'text': '你好👋，我是小🐑。 \n 输入1展示一个表格。\n输入2展示一个图表。'},
  ];
  late TextEditingController _controller;
  late ScrollController _scrollController;

  void onSend() {
    // debugPrint("提交--->${_controller.text}");
    if(_controller.text.isEmpty) {return;}
    setState(() {
      switch(_controller.text) {
        case '2' : messageData.add({'type': 3, 'text': '这是一个图表'});
        case '1' : messageData.add({'type': 2, 'text': '这是一个表格'});
        default : messageData.add({'type': 1, 'text': _controller.text});
      }
      _controller.clear();
    });
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
                itemCount: messageData.length,
                controller: _scrollController,
                itemBuilder: (BuildContext context, int index) {
                  return switch (messageData[index]['type']) {
                    1 => ChatItem1(
                        content: messageData[index]['text'],
                        side: index == 0  ? Side.left : Side.right,
                      ),
                    2 => ChatItem2(
                        content: messageData[index]['text'],
                        side:   Side.left,
                      ),
                    3 => ChatItem3(
                        content: messageData[index]['text'],
                        side: Side.left,
                      ),
                    _ => null
                  };
                }),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
            decoration: const BoxDecoration(
                color: AppColors.green_100,
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                      margin:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 12),
                      padding:
                      const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
                      decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.circular(8)),
                      child: TextField(
                        controller: _controller,
                        style: const TextStyle(color: Colors.black, fontSize: 14,height: 1,),
                        cursorColor: AppColors.green_300, // 直接设置光标颜色
                        decoration: InputDecoration(
                          hintText: '请输入内容',
                          labelStyle: null,
                          isCollapsed: true,
                          // filled: true,
                          contentPadding:
                          const EdgeInsets.symmetric(vertical: 10, horizontal: 6),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(6.0),
                          ),
                        ),
                      )),
                ),
                TextButton(
                  onPressed: onSend,
                  style: TextButton.styleFrom(
                      backgroundColor:AppColors.green_300,
                      padding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                      minimumSize: const Size(66, 36)),
                  child: const Text(
                    '发送',
                    style: TextStyle(fontSize: 12, color: Colors.white),
                  ),
                ),
                const SizedBox(
                  width: 12.0,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
