import 'package:flutter/material.dart';

import 'DropdownMenuController.dart';
import 'DropdownMenuHeader.dart';
import 'DropdownMenuView.dart';

class DropdownMenu extends StatefulWidget {
  final List<DropdownMenuHeaderItem> headerItems;
  final List<Widget> viewBuilders;
  final double viewHeight;
  final double headerHeight;
  final int headerCount;
  final DropdownMenuController controller;

  const DropdownMenu(
      {super.key,
      required this.viewBuilders,
      required this.controller,
      required this.headerItems,
      required this.viewHeight,
      required this.headerHeight,
      this.headerCount = 3});

  @override
  State<StatefulWidget> createState() => _DropdownMenuSate();
}

class _DropdownMenuSate extends State<DropdownMenu> {
  OverlayEntry? _overlayEntry;
  late OverlayState _overlayState;
  @override
  void initState() {
    super.initState();
    _overlayState = Overlay.of(context);
    widget.controller.addListener(_dropDownListener);
  }

  // 监听显示和隐藏事件，决定是否显示不同状态
  void _dropDownListener() {
    _removeOverlay();
    if (widget.controller.isShow) {
      // 1. 获取要打开的索引，和位置，mask高度
      final menuIndex = widget.controller.menuIndex;
      final top = widget.controller.top;
      final maskHeight = MediaQuery.sizeOf(context).height - top;
      if (menuIndex > widget.viewBuilders.length - 1) throw ArgumentError("菜单项索引：$menuIndex大于菜单主体数");
      // 2. 打开overlay
      _overlayEntry = OverlayEntry(
        builder: (context) {
          return Positioned(
              top: top,
              child: Material(
                color: Colors.transparent,
                child: Column(
                  children: [
                    _view(menuIndex),
                    _mask(maskHeight),
                  ],
                ),
              ));
        },
      );
      _overlayState.insert(_overlayEntry!);
    }
  }

  void _removeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  // 显示内容
  Widget _view(int currentIndex) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: widget.viewHeight,
      color: Colors.white,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: IndexedStack(
          index: currentIndex,
          children: widget.viewBuilders.map((e) => DropdownMenuView(controller: widget.controller, child: e)).toList(),
        ),
      ),
    );
  }

  // 遮罩
  Widget _mask(double maskHeight) {
    return GestureDetector(
      onTap: () {
        widget.controller.hide();
      },
      child: Container(
        width: MediaQuery.sizeOf(context).width,
        height: maskHeight,
        color: Colors.black.withOpacity(0.3),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DropdownMenuHeader(
      items: widget.headerItems,
      height: widget.headerHeight,
      headerCount: widget.headerCount,
      controller: widget.controller,
    );
  }
}
