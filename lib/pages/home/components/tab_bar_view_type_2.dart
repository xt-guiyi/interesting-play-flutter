import 'package:flutter/material.dart';

class TabBarViewType2 extends StatefulWidget {
  const TabBarViewType2({super.key, required this.tabTitle});

  final String tabTitle;

  @override
  State<StatefulWidget> createState() => _TabBarViewType2State();
}

class _TabBarViewType2State extends State<TabBarViewType2>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return const Center(
      child: Text(
        "暂无更多内容，敬请期待(✧∀✧)",
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}
