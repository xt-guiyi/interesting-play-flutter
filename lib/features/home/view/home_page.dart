import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:interesting_play_flutter/core/theme/app_colors.dart';
import 'package:interesting_play_flutter/features/home/viewmodel/home_viewmodel.dart';
import 'package:interesting_play_flutter/features/home/view/components/tab_bar_view_type_1.dart';

import 'components/tab_bar_view_type_2.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<HomePage>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  late Timer _timer;
  late TabController _tabController;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    // 头部标题变化
    final tabItems = ref.read(homeViewModelProvider).tabItems;
    _timer = Timer.periodic(const Duration(seconds: 2), (timer) {
      ref.read(homeViewModelProvider.notifier).rotateSearchText();
    });
    _tabController = TabController(vsync: this, length: tabItems.length);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final state = ref.read(homeViewModelProvider);
      if (state.videos.isEmpty && !state.isLoading) {
        ref.read(homeViewModelProvider.notifier).loadInitial();
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Column(
          children: [_buildHeader(), _buildTabs(), _buildTabContent()],
        ),
      ),
    );
  }

  /// 头部
  Widget _buildHeader() {
    final userInfo = ref.watch(
      homeViewModelProvider.select((state) => state.currentUser),
    );
    final currentSearchText = ref.watch(
      homeViewModelProvider.select((state) => state.currentSearchText),
    );
    return Container(
      width: double.infinity,
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: const BoxDecoration(color: Colors.white),
      child: Row(
        children: [
          SizedBox(
            width: 36,
            height: 36,
            child: CircleAvatar(
              backgroundImage: userInfo?.avatar?.isNotEmpty == true
                  ? NetworkImage(userInfo!.avatar!)
                  : null,
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              height: 36,
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: AppColors.sliver_100, width: 1),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.search,
                    size: 18,
                    color: AppColors.sliver_400,
                  ),
                  const SizedBox(width: 2),
                  Expanded(
                    child: Text(
                      currentSearchText,
                      style: const TextStyle(
                        fontSize: 14,
                        color: AppColors.sliver_400,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.start,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Icon(Icons.email, size: 24),
        ],
      ),
    );
  }

  /// tab栏
  Widget _buildTabs() {
    final tabItems = ref.watch(
      homeViewModelProvider.select((state) => state.tabItems),
    );
    return Column(
      children: [
        Container(
          height: 40,
          width: double.infinity,
          decoration: const BoxDecoration(color: Colors.white),
          child: TabBar(
            isScrollable: true,
            tabAlignment: TabAlignment.start,
            dividerHeight: 0,
            controller: _tabController,
            indicatorColor: AppColors.green_300,
            labelColor: AppColors.green_300,
            unselectedLabelColor: const Color(0xFF3D3D3D),
            labelStyle: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
            unselectedLabelStyle: const TextStyle(fontSize: 14),
            overlayColor: WidgetStateProperty.all(Colors.transparent),
            splashFactory: NoSplash.splashFactory,
            tabs: tabItems.map((e) => Tab(text: e)).toList(),
          ),
        ),
      ],
    );
  }

  /// 内容部分
  Widget _buildTabContent() {
    final tabItems = ref.watch(
      homeViewModelProvider.select((state) => state.tabItems),
    );
    return Expanded(
      flex: 1,
      child: Container(
        width: double.infinity,
        decoration: const BoxDecoration(color: AppColors.green_400),
        child: TabBarView(
          controller: _tabController,
          children: tabItems.map((title) {
            if (title == "推荐") {
              return TabBarViewType1(tabTitle: title);
            } else {
              return TabBarViewType2(tabTitle: title);
            }
          }).toList(),
        ),
      ),
    );
  }
}
