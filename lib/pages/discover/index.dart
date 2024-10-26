import 'package:flutter/material.dart';

import 'components/TableViewItem1.dart';

class DiscoverPage extends StatefulWidget {
  const DiscoverPage({super.key});

  @override
  State<StatefulWidget> createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  final List<String> tabs = const ['草稿箱', '审核中', '待完稿', '已完稿'];
  late TabController _tabController;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: tabs.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(color: Colors.white),
        child: Column(
          children: [_buildTabBar(), Expanded(child: _buildTableBarView())],
        ),
      ),
    );
  }

  Widget _buildTabBar() => SizedBox(
        height: 46,
        child: TabBar(
          isScrollable: false,
          dividerHeight: 0,
          controller: _tabController,
          indicatorColor: const Color(0xFF3D3D3D),
          labelColor: const Color(0xFF3D3D3D),
          labelStyle: const TextStyle(fontSize: 15),
          unselectedLabelStyle: const TextStyle(fontSize: 14),
          unselectedLabelColor: const Color(0xFF3D3D3D),
          tabs: tabs.map((e) => Tab(text: e)).toList(),
        ),
      );

  Widget _buildTableBarView() => TabBarView(
      controller: _tabController,
      children: tabs.map((title) => TableViewItem1(type: title)).toList());
}
