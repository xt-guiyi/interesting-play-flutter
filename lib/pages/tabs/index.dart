import 'package:flutter/material.dart';
import 'package:interesting_play_flutter/pages/discover/index.dart';
import 'package:interesting_play_flutter/pages/me/index.dart';

import '../../constants/app_colors.dart';
import '../home/index.dart';

class TabPage extends StatefulWidget {
  const TabPage({super.key});

  @override
  State<StatefulWidget> createState() => _TabPageState();
}

class _TabPageState extends State {
  var _position = 0;
  final Map<String, String> iconsMap = {
    "首页": 'lib/assets/home.png',
    "发现": 'lib/assets/discover.png',
    "我的": 'lib/assets/user.png',
  };

  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _position);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onItemTapped(int position) {
    setState(() {
      _position = position;
    });
    _pageController.jumpToPage(position);
  }

  Widget _buildBottomNavigationBar() => BottomNavigationBar(
        onTap: _onItemTapped,
        currentIndex: _position,
        elevation: 1,
        backgroundColor: Colors.white,
        iconSize: 25,
        selectedItemColor: AppColors.green_300,
        unselectedItemColor: Colors.black54,
        selectedFontSize: 16,
        unselectedFontSize: 16,
        showUnselectedLabels: true,
        showSelectedLabels: true,
        type: BottomNavigationBarType.fixed,
        items: iconsMap.keys
            .map((key) => BottomNavigationBarItem(
                  label: key,
                  icon: ImageIcon(
                    AssetImage(iconsMap[key]!),
                    size: 24,
                  ),
                ))
            .toList(),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const ClampingScrollPhysics(),
        controller: _pageController,
        onPageChanged: (position) {
          setState(() => _position = position);
        },
        children: const <Widget>[
          HomePage(),
          DiscoverPage(),
          MePage(),
          // TopicPage(),
        ],
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }
}
