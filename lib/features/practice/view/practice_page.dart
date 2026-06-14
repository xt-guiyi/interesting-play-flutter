import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:interesting_play_flutter/core/theme/app_colors.dart';

class PracticePage extends StatelessWidget {
  const PracticePage({super.key});

  static const _items = [
    _PracticeItem(title: '弹框', icon: Icons.inbox, route: '/practice/dialog'),
    _PracticeItem(
      title: '底部弹框',
      icon: Icons.check_box_outline_blank,
      route: '/practice/bottom-sheet',
    ),
    _PracticeItem(
      title: '时间选择器',
      icon: Icons.schedule,
      route: '/practice/date-picker',
    ),
    _PracticeItem(
      title: '年月日选择器',
      icon: Icons.calendar_month,
      route: '/practice/year-month-day-picker',
    ),
    _PracticeItem(
      title: '扫一扫',
      icon: Icons.qr_code_scanner,
      route: '/practice/scan',
    ),
    _PracticeItem(
      title: '图片选择',
      icon: Icons.add_photo_alternate,
      route: '/practice/image-picker',
    ),
    _PracticeItem(
      title: '权限管理',
      icon: Icons.admin_panel_settings,
      route: '/practice/permission',
    ),
    _PracticeItem(
      title: '定位',
      icon: Icons.location_on,
      route: '/practice/location',
    ),
    _PracticeItem(
      title: '文件选择',
      icon: Icons.attach_file,
      route: '/practice/file-picker',
    ),
    _PracticeItem(title: '分享', icon: Icons.ios_share, route: '/practice/share'),
    _PracticeItem(
      title: '剪贴板',
      icon: Icons.content_paste,
      route: '/practice/clipboard',
    ),
    _PracticeItem(
      title: '下载进度',
      icon: Icons.download,
      route: '/practice/download',
    ),
    _PracticeItem(
      title: '本地通知',
      icon: Icons.notifications,
      route: '/practice/notification',
    ),
    _PracticeItem(
      title: 'WebView',
      icon: Icons.web,
      route: '/practice/webview',
    ),
    _PracticeItem(
      title: '生成二维码',
      icon: Icons.qr_code,
      route: '/practice/qr-code',
    ),
    _PracticeItem(
      title: '省市区选择器',
      icon: Icons.map,
      route: '/practice/region-picker',
    ),
    _PracticeItem(title: '聊天', icon: Icons.telegram, route: '/practice/chat'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.green_300,
        scrolledUnderElevation: 0,
        title: const Text('实践'),
        centerTitle: true,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(12),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: _resolveColumnCount(MediaQuery.sizeOf(context).width),
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 1.15,
        ),
        itemCount: _items.length,
        itemBuilder: (context, index) {
          final item = _items[index];
          return _PracticeCard(
            item: item,
            onTap: () => context.push(item.route),
          );
        },
      ),
    );
  }

  int _resolveColumnCount(double width) {
    if (width >= 900) return 5;
    if (width >= 600) return 4;
    return 3;
  }
}

class _PracticeItem {
  const _PracticeItem({
    required this.title,
    required this.icon,
    required this.route,
  });

  final String title;
  final IconData icon;
  final String route;
}

class _PracticeCard extends StatelessWidget {
  const _PracticeCard({required this.item, required this.onTap});

  final _PracticeItem item;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8),
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: onTap,
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.black.withValues(alpha: 0.08)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.06),
                blurRadius: 12,
                spreadRadius: -2,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(item.icon, size: 28, color: AppColors.green_300),
              const SizedBox(height: 8),
              Text(
                item.title,
                style: const TextStyle(fontSize: 14, color: Colors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
