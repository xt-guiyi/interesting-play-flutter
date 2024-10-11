

import 'package:flutter/material.dart';
import 'DropdownMenuController.dart';
import 'DropdownMenuHeader.dart';
import 'DropdownMenuView.dart';

class DropdownMenu extends StatefulWidget {

  final List<DropdownMenuHeaderItem> headerItems;
  final List<Widget> viewBuilders;
  final DropdownMenuController controller;

  const DropdownMenu({super.key,   required this.viewBuilders, required this.controller, required this.headerItems});

  @override
  State<StatefulWidget> createState() => _DropdownMenuSate();

}

class _DropdownMenuSate extends State<DropdownMenu> {
  OverlayEntry? overlayEntry;
  OverlayState? overlayState;
  @override
  void initState() {
    super.initState();
    overlayState = Overlay.of(context);
    widget.controller.addListener(_dropDownListener);
  }

  void _dropDownListener() {
    _removeOverlay();
    if(widget.controller.isShow) {
      // 1. 获取要打开的索引，和位置，mask高度
      final menuIndex = widget.controller.menuIndex;
      final top = widget.controller.top;
      final maskHeight = MediaQuery.of(context).size.height - top!;
      if(menuIndex > widget.viewBuilders.length - 1)  throw ArgumentError("菜单项索引：$menuIndex大于菜单主体数");
      // 2. 打开overlay
        overlayEntry = OverlayEntry(
          builder: (context) {
            return Positioned(
              top: top,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  view(menuIndex),
                  mask(maskHeight),
                ],
              ),
            );
          },
        );
        overlayState!.insert(overlayEntry!);
    }
  }

  void _removeOverlay() {
    overlayEntry?.remove();
    overlayEntry = null;
  }


  Widget view(int currentIndex) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 200,
      color: Colors.white,
      child: IndexedStack(
        index: currentIndex,
        children: widget.viewBuilders.map((e) => DropdownMenuView(controller: widget.controller, child: e)).toList(),
      ),
    );
  }


  Widget mask(double maskHeight) {
    return GestureDetector(
      onTap: () {
        widget.controller.hide();
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: maskHeight,
        color: Colors.black.withOpacity(0.3),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return DropdownMenuHeader(
      items: widget.headerItems,
      controller: widget.controller,
    );
  }

}