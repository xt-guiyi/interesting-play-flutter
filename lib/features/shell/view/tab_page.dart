import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:interesting_play_flutter/core/theme/app_colors.dart';

class TabPage extends StatelessWidget {
  const TabPage({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;
  static const Map<String, String> iconsMap = {
    "首页": 'lib/assets/home.png',
    "发现": 'lib/assets/discover.png',
    "我的": 'lib/assets/user.png',
  };

  void _onItemTapped(int position) {
    navigationShell.goBranch(
      position,
      initialLocation: position == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onItemTapped,
        currentIndex: navigationShell.currentIndex,
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
            .map(
              (key) => BottomNavigationBarItem(
                label: key,
                icon: ImageIcon(AssetImage(iconsMap[key]!), size: 24),
              ),
            )
            .toList(),
      ),
    );
  }
}
