import 'package:flutter/material.dart';
import 'package:flutter_feature_collection/shared/widgets/custom_bottom_nav_bar/custom_bottom_nav_bar.dart';
import 'package:go_router/go_router.dart';

class TabPage extends StatelessWidget {
  const TabPage({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;
  static const List<BottomNavItem> _items = [
    BottomNavItem(label: '首页', icon: 'lib/assets/home.png'),
    BottomNavItem(label: '发现', icon: 'lib/assets/discover.png'),
    BottomNavItem(label: '我的', icon: 'lib/assets/user.png'),
  ];

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
      // bottomNavigationBar: BottomNavigationBar(
      //   onTap: _onItemTapped,
      //   currentIndex: navigationShell.currentIndex,
      //   elevation: 1,
      //   backgroundColor: Colors.white,
      //   iconSize: 25,
      //   selectedItemColor: AppColors.green_300,
      //   unselectedItemColor: Colors.black54,
      //   selectedFontSize: 16,
      //   unselectedFontSize: 16,
      //   showUnselectedLabels: true,
      //   showSelectedLabels: true,
      //   type: BottomNavigationBarType.fixed,
      //   items: _items
      //       .map(
      //         (item) => BottomNavigationBarItem(
      //           label: item.label,
      //           icon: ImageIcon(AssetImage(item.icon), size: 24),
      //         ),
      //       )
      //       .toList(),
      // ),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: navigationShell.currentIndex,
        items: _items,
        onTap: _onItemTapped,
      ),
    );
  }
}
