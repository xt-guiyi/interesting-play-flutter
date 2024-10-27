import 'package:flutter/material.dart';
import 'package:interesting_play_flutter/constants/app_colors.dart';

class TabBarViewType3 extends StatefulWidget {
  const TabBarViewType3({super.key, required this.type});

  final String type;

  @override
  State<StatefulWidget> createState() => _TabBarViewType3State();
}

class _TabBarViewType3State extends State<TabBarViewType3> with AutomaticKeepAliveClientMixin {
  final GlobalKey _widgetKey = GlobalKey();
  late double _screenWidth;
  late double _itemWidth;
  OverlayEntry? _overlayEntry;
  late OverlayState _overlayState;
  var _top = 0.0;
  int? _currentIndex;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _overlayState = Overlay.of(context);
  }

  // 监听显示和隐藏事件，决定是否显示不同状态
  void _dropDownListener() {
    _removeOverlay();
    if (_currentIndex != null) {
      // 1. 获取要打开的索引，和位置，mask高度
      final menuIndex = _currentIndex;
      final top = _top;
      final maskHeight = MediaQuery.sizeOf(context).height - top;
      // 2. 打开overlay
      _overlayEntry = OverlayEntry(
        builder: (context) {
          return Positioned(
            top: top,
            // 必须用Material控件包裹才能应用上material样式，不然文本默认为红色
            // child: Material(
            //   child: Column(
            //     children: [
            //       _view(menuIndex!),
            //       _mask(maskHeight),
            //     ],
            //   ),
            // ),
            //  不使用Material控件包裹的样式
            child: Column(
              children: [
                _view(menuIndex!),
                _mask(maskHeight),
              ],
            ),
          );
        },
      );
      _overlayState.insert(_overlayEntry!);
    }
  }

  void _removeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    _screenWidth = MediaQuery.sizeOf(context).width;
    _itemWidth = _screenWidth / 2;
    return Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          color: AppColors.green_100,
        ),
        child: Column(
          children: [_headerBar(), Expanded(flex: 1, child: _content())],
        ));
  }

  /// 头部筛选栏，使用的没有封装组件，写在一起
  Widget _headerBar() {
    return Container(
      key: _widgetKey,
      decoration: const BoxDecoration(color: Colors.white),
      width: double.infinity,
      height: 36,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            GestureDetector(
              onTap: () {
                // 确定弹框要出现的位置
                if (_widgetKey.currentContext != null) {
                  // 获取 header的 RenderBox
                  RenderBox renderBox = _widgetKey.currentContext!.findRenderObject() as RenderBox;
                  // 获取header的位置
                  final position = renderBox.localToGlobal(Offset.zero);
                  // 获取header的大小
                  final size = renderBox.size;
                  // 出现位置为, header自身的高度+ header距离顶部的距离
                  setState(() {
                    _top = size.height + position.dy;
                    _currentIndex = 0;
                    _dropDownListener();
                  });
                }
              },
              child: SizedBox(
                width: _itemWidth,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "全部日期",
                      style: TextStyle(color: _currentIndex == 0 ? AppColors.green_300 : Colors.black),
                    ),
                    Icon(_currentIndex == 0 ? Icons.keyboard_arrow_down : Icons.keyboard_arrow_up,
                        size: 14, color: _currentIndex == 0 ? AppColors.green_300 : Colors.black),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                // 确定弹框要出现的位置
                if (_widgetKey.currentContext != null) {
                  // 获取 header的 RenderBox
                  RenderBox renderBox = _widgetKey.currentContext!.findRenderObject() as RenderBox;
                  // 获取header的位置
                  final position = renderBox.localToGlobal(Offset.zero);
                  // 获取header的大小
                  final size = renderBox.size;
                  // 出现位置为, header自身的高度+ header距离顶部的距离
                  setState(() {
                    _top = size.height + position.dy;
                    _currentIndex = 1;
                    _dropDownListener();
                  });
                }
              },
              child: SizedBox(
                width: _itemWidth,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "全部分类",
                      style: TextStyle(color: _currentIndex == 1 ? AppColors.green_300 : Colors.black),
                    ),
                    Icon(_currentIndex == 1 ? Icons.keyboard_arrow_down : Icons.keyboard_arrow_up,
                        size: 14, color: _currentIndex == 1 ? AppColors.green_300 : Colors.black),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  ///主要内容
  Widget _content() {
    return const Center(
      child: Text(
        "暂无更多内容，敬请期待(✧∀✧)",
        style: TextStyle(fontSize: 20),
      ),
    );
  }

  /// 遮罩显示内容,这里内容其实可以拆分到多个文件里，避免代码臃肿
  Widget _view(int currentIndex) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 300,
      color: Colors.white,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: IndexedStack(
          index: currentIndex,
          children: const [
            Text("不使用Material控件包裹,文字默认颜色为红色，还有下划线，需要手动重置样式"),
            Text("第二项内容"),
          ],
        ),
      ),
    );
  }

  // 遮罩
  Widget _mask(double maskHeight) {
    return GestureDetector(
      onTap: () {
        _currentIndex = null;
        _dropDownListener();
      },
      child: Container(
        width: MediaQuery.sizeOf(context).width,
        height: maskHeight,
        color: Colors.black.withOpacity(0.3),
      ),
    );
  }
}
