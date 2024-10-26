import 'package:flutter/material.dart';

class TabBarViewType3 extends StatefulWidget {
  const TabBarViewType3({super.key, required this.type});

  final String type;

  @override
  State<StatefulWidget> createState() => _TabBarViewType3State();
}

class _TabBarViewType3State extends State<TabBarViewType3> with AutomaticKeepAliveClientMixin {
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
