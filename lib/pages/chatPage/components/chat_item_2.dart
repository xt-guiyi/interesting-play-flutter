/*
 * @Author: xt 1661219752@qq.com
 * @Date: 2024-09-12 11:58:04
 * @LastEditors: xt 1661219752@qq.com
 * @LastEditTime: 2024-09-12 14:46:41
 * @Description: 文本类聊天item
 */
import 'package:flutter/material.dart';

import '../chat_page.dart';

class ChatItem2 extends StatelessWidget {
  const ChatItem2({super.key, required this.content, this.side = Side.left});

  final Side side;
  final String content;

  /// 左侧布局
  Widget leftLayout(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CircleAvatar(
          radius: 20,
          backgroundColor: Colors.white,
          backgroundImage: NetworkImage(
              'https://images.cubox.pro/iw3rni/file/2024092617464027713/1.png'),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(10, 4, 0, 0),
          padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 6),
          decoration: BoxDecoration(
              color: Colors.black12, borderRadius: BorderRadius.circular(4)),
          constraints: BoxConstraints(
              minWidth: MediaQuery.of(context).size.width * 0.1,
              maxWidth: MediaQuery.of(context).size.width * 0.6),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(content, style: const TextStyle(fontSize: 16)),
              const SizedBox(
                height: 10,
              ),
              table()
            ],
          ),
        )
      ],
    );
  }

  /// 右侧布局
  Widget rightLayout(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(0, 4, 10, 0),
          padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 6),
          decoration: BoxDecoration(
              color: Colors.black12, borderRadius: BorderRadius.circular(4)),
          constraints: BoxConstraints(
              minWidth: MediaQuery.of(context).size.width * 0.1,
              maxWidth: MediaQuery.of(context).size.width * 0.6),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(content, style: const TextStyle(fontSize: 16)),
              const SizedBox(
                height: 10,
              ),
              table()
            ],
          ),
        ),
        const CircleAvatar(
          radius: 20,
          backgroundColor: Colors.white,
          backgroundImage: NetworkImage(
              'https://images.cubox.pro/iw3rni/file/2024102923062812324/IMG_0794.JPG'),
        ),
      ],
    );
  }

  Widget table() {
    return Table(
      defaultColumnWidth: const FlexColumnWidth(),
      border: TableBorder.all(),
      children: [
        const TableRow(children: [
          Center(
            child: Text('量纲'),
          ),
          Center(
            child: Text('单位符号'),
          ),
          Center(
            child: Text('单位名称'),
          ),
        ]),
        TableRow(children: [
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
            child: const Text("L"),
          ),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
            child: const Text("M"),
          ),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
            child: const Text("米"),
          )
        ])
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 0),
      child: side == Side.left ? leftLayout(context) : rightLayout(context),
    );
  }
}
