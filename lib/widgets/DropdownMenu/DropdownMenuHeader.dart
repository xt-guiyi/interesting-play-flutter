

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import './DropdownMenuController.dart';

class DropdownMenuHeader extends StatefulWidget {
  final double height;
  final Color bgColor;
  final List<DropdownMenuHeaderItem> items;
  final DropdownMenuController controller;

  const DropdownMenuHeader({super.key, this.height = 36, required this.items,  this.bgColor = Colors.white, required this.controller, });

  @override
  State<StatefulWidget> createState() => _DropdownMenuHeaderState();

}

class _DropdownMenuHeaderState extends State<DropdownMenuHeader> {
  late double _screenWidth;
  final GlobalKey _widgetKey = GlobalKey();
  var isShow = false;


  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_dropDownListener);
  }

  void _dropDownListener() {
      setState(() {
        isShow = widget.controller.isShow;
      });
  }


  Widget  _gridViewItem(int index, DropdownMenuHeaderItem item) {
    var isSelected = isShow && index == widget.controller.menuIndex;
    return GestureDetector(
      onTap: () {
          //  1. 获取点击索引项

          // 2. 确定menuView出现的位置
          if (_widgetKey.currentContext != null) {
            // 获取 RenderBox
            RenderBox renderBox = _widgetKey.currentContext!.findRenderObject() as RenderBox;
            // 获取位置
            var position =  renderBox.localToGlobal(Offset.zero);
            var size =  renderBox.size;
            widget.controller.top = size.height + position.dy;
            widget.controller.show(index);
            print('按钮被点击了，当前项:$index ');
            print('按钮被点击了，当前位置:${position.dy} ');
            print('按钮被点击了，当前位置:${renderBox.size} ');
          }
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(item.title, style: item.textStyle != null ? item.textStyle?.copyWith(
            color: isSelected ? item.selectColor : item.unselectColor, // 根据选中状态切换颜色
          ) : TextStyle(color: isSelected ? item.selectColor : item.unselectColor),),
          Icon(isSelected ? item.iconSelect : item.iconUnselect,size: item.iconSize, color: isSelected ? item.selectColor : item.unselectColor),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    _screenWidth = mediaQuery.size.width;

    return Container(
      key: _widgetKey,
      decoration: BoxDecoration(
        color: widget.bgColor
      ),
      width: double.infinity,
      height: widget.height,
      child: GridView.count(
        scrollDirection: Axis.horizontal,
        primary: false,
        padding: const EdgeInsets.all(0),
        crossAxisSpacing: 0,
        mainAxisSpacing: 0,
        crossAxisCount: 1,
        childAspectRatio: widget.height /  (_screenWidth / widget.items.length) ,
        children: widget.items.asMap().entries.map((item) => _gridViewItem(item.key,item.value)).toList(),
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