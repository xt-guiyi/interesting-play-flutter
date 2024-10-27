import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';
import 'components/tab_bar_view_type_1.dart';
import 'components/tab_bar_view_type_2.dart';
import 'components/tab_bar_view_type_3.dart';

class DiscoverPage extends StatefulWidget {
  const DiscoverPage({super.key});

  @override
  State<StatefulWidget> createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  final List<String> _tabs = const ["附近", "同城", "关注"];
  late TabController _tabController;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: _tabs.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Container(
          decoration: const BoxDecoration(color: Colors.white),
          child: Column(
            children: [_buildTabBar(), Expanded(child: _buildTableBarView())],
          ),
        ),
      ),
    );
  }

  /// 头部
  Widget _buildTabBar() => SizedBox(
        height: 46,
        child: TabBar(
          isScrollable: true,
          tabAlignment: TabAlignment.center,
          dividerHeight: 0,
          controller: _tabController,
          indicatorColor: AppColors.green_300,
          labelColor: AppColors.green_300,
          unselectedLabelColor: const Color(0xFF3D3D3D),
          labelStyle: const TextStyle(fontSize: 15),
          unselectedLabelStyle: const TextStyle(fontSize: 14),
          tabs: _tabs.map((e) => Tab(text: e)).toList(),
        ),
      );

  Widget _buildTableBarView() => TabBarView(
      controller: _tabController,
      children: _tabs.map((title) {
        if (title == "附近") {
          return TabBarViewType1(type: title);
        } else if (title == "同城") {
          return TabBarViewType2(type: title);
        } else {
          return TabBarViewType3(type: title);
        }
      }).toList());
}
