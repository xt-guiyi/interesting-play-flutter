import 'package:flutter/material.dart';

import 'dropdown_menu_controller.dart';

class DropdownMenuHeader extends StatelessWidget {
  final double height;
  final int visibleItemCount;
  final Color bgColor;
  final List<DropdownMenuHeaderItem> items;
  final DropdownMenuController controller;

  const DropdownMenuHeader({
    super.key,
    this.height = 36,
    this.visibleItemCount = 3,
    required this.items,
    this.bgColor = Colors.white,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final headerWidth = constraints.hasBoundedWidth
            ? constraints.maxWidth
            : MediaQuery.sizeOf(context).width;
        final itemWidth = headerWidth / visibleItemCount;
        return AnimatedBuilder(
          animation: controller,
          builder: (context, _) {
            return Container(
              decoration: BoxDecoration(color: bgColor),
              width: headerWidth,
              height: height,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: items.asMap().entries.map((item) {
                    return _headerItem(item.key, item.value, itemWidth);
                  }).toList(),
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget _headerItem(int index, DropdownMenuHeaderItem item, double itemWidth) {
    final isSelected = controller.isOpen && index == controller.activeIndex;
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        controller.toggle(index);
      },
      child: SizedBox(
        width: itemWidth,
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
