import 'package:flutter/material.dart';

import 'dropdown_menu_controller.dart';

class DropdownMenuHeader extends StatefulWidget {
  final double height;
  final int headerCount;
  final Color bgColor;
  final List<DropdownMenuHeaderItem> items;
  final DropdownMenuController controller;

  const DropdownMenuHeader({
    super.key,
    this.height = 36,
    this.headerCount = 3,
    required this.items,
    this.bgColor = Colors.white,
    required this.controller,
  });

  @override
  State<StatefulWidget> createState() => _DropdownMenuHeaderState();
}

class _DropdownMenuHeaderState extends State<DropdownMenuHeader> {
  late double _screenWidth;
  late double _itemWidth;
  final GlobalKey _widgetKey = GlobalKey();
  var _isShow = false;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_dropDownListener);
  }

  void _dropDownListener() {
    setState(() {
      _isShow = widget.controller.isShow;
    });
  }

  @override
  Widget build(BuildContext context) {
    _screenWidth = MediaQuery.sizeOf(context).width;
    _itemWidth = _screenWidth / widget.headerCount;
    return Container(
      key: _widgetKey,
      decoration: BoxDecoration(color: widget.bgColor),
      width: double.infinity,
      height: widget.height,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: widget.items.asMap().entries.map((item) {
            return _headerItem(item.key, item.value);
          }).toList(),
        ),
      ),
    );
  }

  Widget _headerItem(int index, DropdownMenuHeaderItem item) {
    var isSelected = _isShow && index == widget.controller.menuIndex;
    return GestureDetector(
      onTap: () {
        if (_widgetKey.currentContext != null) {
          final renderBox =
              _widgetKey.currentContext!.findRenderObject() as RenderBox;
          final position = renderBox.localToGlobal(Offset.zero);
          final size = renderBox.size;
          widget.controller.top = size.height + position.dy;
          widget.controller.show(index);
          debugPrint('按钮被点击了，当前项:$index ');
        }
      },
      child: SizedBox(
        width: _itemWidth,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              item.title,
              style: item.textStyle != null
                  ? item.textStyle?.copyWith(
                      color: isSelected ? item.selectColor : item.unselectColor,
                    )
                  : TextStyle(
                      color: isSelected ? item.selectColor : item.unselectColor,
                    ),
            ),
            Icon(
              isSelected ? item.iconSelect : item.iconUnselect,
              size: item.iconSize,
              color: isSelected ? item.selectColor : item.unselectColor,
            ),
          ],
        ),
      ),
    );
  }
}

class DropdownMenuHeaderItem {
  final String title;
  final TextStyle? textStyle;
  final IconData iconSelect;
  final IconData iconUnselect;
  final double? iconSize;
  final Color? selectColor;
  final Color? unselectColor;

  DropdownMenuHeaderItem(
    this.title, {
    this.textStyle,
    required this.iconSelect,
    required this.iconUnselect,
    this.iconSize,
    this.selectColor,
    this.unselectColor,
  });
}
