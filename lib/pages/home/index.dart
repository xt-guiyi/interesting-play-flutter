import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interesting_play_flutter/constants/app_colors.dart';
import 'package:interesting_play_flutter/pages/home/components/tab_bar_view_type_1.dart';

import '../../model/user_info.dart';
import '../../store/userInfoController.dart';
import 'components/tab_bar_view_type_2.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  UserInfo? _userInfo;
  late Timer _timer;
  var _currentSearchText = '';
  final _searchTextList = [
    "拜登把泽连斯基叫成普京",
    "原神肯德基套餐上线",
    "macBook air13寸和15寸差别多大",
    "绝区零KDA双厨狂喜",
    "北伐是什么梗",
    "神偷奶爸今日上映",
    "通往夏天的隧道",
    "安卓开发"
  ];
  final _tabItems = ["推荐", "小说", "漫画", "游戏", "音乐", "舞蹈", "萌宠", "其他"];
  late TabController _tabController;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    // 头部标题变化
    final random = Random();
    _timer = Timer.periodic(const Duration(seconds: 2), (timer) {
      setState(() {
        _currentSearchText = _searchTextList[random.nextInt(_searchTextList.length)];
      });
    });
    _tabController = TabController(vsync: this, length: _tabItems.length);
    final UserInfoController userInfoController = Get.find<UserInfoController>();
    userInfoController.getUserInfo().then((value) {
      setState(() {
        _userInfo = value;
      });
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
    return Container(
      width: double.infinity,
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Row(
        children: [
          SizedBox(
            width: 36,
            height: 36,
            child: CircleAvatar(backgroundImage: NetworkImage(_userInfo?.avatar ?? "")),
          ),
          Expanded(
            flex: 1,
            child: Container(
              height: 36,
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: AppColors.sliver_100,
                  width: 1,
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.search,
                    size: 18,
                    color: AppColors.sliver_400,
                  ),
                  const SizedBox(
                    width: 2,
                  ),
                  Expanded(
                      child: Text(
                    _currentSearchText,
                    style: const TextStyle(fontSize: 14, color: AppColors.sliver_400),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.start,
                  ))
                ],
              ),
            ),
          ),
          const Icon(
            Icons.email,
            size: 24,
          ),
        ],
      ),
    );
  }

  /// tab栏
  Widget _buildTabs() {
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
            labelStyle: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            unselectedLabelStyle: const TextStyle(fontSize: 14),
            tabs: _tabItems.map((e) => Tab(text: e)).toList(),
          ),
        ),
      ],
    );
  }

  /// 内容部分
  Widget _buildTabContent() {
    return Expanded(
      flex: 1,
      child: Container(
        width: double.infinity,
        decoration: const BoxDecoration(color: AppColors.green_400),
        child: TabBarView(
            controller: _tabController,
            children: _tabItems.map((title) {
              if (title == "推荐") {
                return TabBarViewType1(tabTitle: title);
              } else {
                return TabBarViewType2(tabTitle: title);
              }
            }).toList()),
      ),
    );
  }
}
