import 'package:flutter/material.dart';
import 'package:interesting_play_flutter/core/theme/app_colors.dart';

class BottomSheetPracticePage extends StatelessWidget {
  const BottomSheetPracticePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.green_300,
        scrolledUnderElevation: 0,
        title: const Text('底部弹框'),
        centerTitle: true,
      ),
      body: Builder(
        builder: (context) {
          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton(
                  onPressed: () => _showModalBottomSheet(context),
                  child: const Text('普通底部弹框'),
                ),
                const SizedBox(height: 12),
                ElevatedButton(
                  onPressed: () => _showDraggableBottomSheet(context),
                  child: const Text('可拖拽底部弹框'),
                ),
                const SizedBox(height: 12),
                ElevatedButton(
                  onPressed: () => _showPersistentBottomSheet(context),
                  child: const Text('非遮罩底部面板'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  void _showModalBottomSheet(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return _BottomSheetContent(
          title: '这是一个普通底部弹框',
          description: '它会显示遮罩，必须关闭后才能继续操作底下页面。',
          onClose: () => Navigator.pop(context),
        );
      },
    );
  }

  void _showDraggableBottomSheet(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return DraggableScrollableSheet(
          expand: false,
          initialChildSize: 0.45,
          minChildSize: 0.25,
          maxChildSize: 0.9,
          builder: (context, scrollController) {
            return Material(
              color: Colors.white,
              child: ListView(
                controller: scrollController,
                padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
                children: [
                  Center(
                    child: Container(
                      width: 40,
                      height: 4,
                      decoration: BoxDecoration(
                        color: Colors.black.withValues(alpha: 0.18),
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    '可拖拽底部弹框',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    '可以向上拖动展开，也可以向下拖动收起，适合评论列表、地图面板、商品详情这类内容。',
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  for (var index = 1; index <= 20; index++)
                    ListTile(
                      leading: CircleAvatar(child: Text('$index')),
                      title: Text('列表内容 $index'),
                      subtitle: const Text('拖动弹窗或滚动列表都可以体验。'),
                    ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  void _showPersistentBottomSheet(BuildContext context) {
    Scaffold.of(context).showBottomSheet((context) {
      return _BottomSheetContent(
        title: '这是一个非遮罩底部面板',
        description: '它不会显示 modal 遮罩，属于当前 Scaffold 的一部分。',
        onClose: () => Navigator.pop(context),
      );
    });
  }
}

class _BottomSheetContent extends StatelessWidget {
  const _BottomSheetContent({
    required this.title,
    required this.description,
    required this.onClose,
  });

  final String title;
  final String description;
  final VoidCallback onClose;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 360,
      width: double.infinity,
      color: Colors.white,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 8),
              Text(description, textAlign: TextAlign.center),
              const SizedBox(height: 16),
              ElevatedButton(onPressed: onClose, child: const Text('关闭')),
            ],
          ),
        ),
      ),
    );
  }
}
