import 'package:flutter/material.dart';

import 'dropdown_menu_controller.dart';
import 'dropdown_menu_header.dart';

class FilterDropdownMenu extends StatefulWidget {
  final double? headerWidth;
  final List<DropdownMenuHeaderItem> headerItems;
  final List<Widget> menuViews;
  final double headerHeight;
  final int visibleHeaderCount;
  final DropdownMenuController controller;

  const FilterDropdownMenu({
    super.key,
    this.headerWidth,
    required this.menuViews,
    required this.controller,
    required this.headerItems,
    required this.headerHeight,
    this.visibleHeaderCount = 3,
  }) : assert(headerItems.length == menuViews.length, '菜单头和菜单内容数量必须一致'),
       assert(visibleHeaderCount > 0, 'visibleHeaderCount 必须大于 0');

  @override
  State<FilterDropdownMenu> createState() => _FilterDropdownMenuState();
}

class _FilterDropdownMenuState extends State<FilterDropdownMenu> {
  final LayerLink _layerLink = LayerLink();
  final OverlayPortalController _overlayController = OverlayPortalController();

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_handleControllerChanged);
    _syncOverlay();
  }

  @override
  void didUpdateWidget(covariant FilterDropdownMenu oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.controller != widget.controller) {
      oldWidget.controller.removeListener(_handleControllerChanged);
      widget.controller.addListener(_handleControllerChanged);
      _syncOverlay();
    }
  }

  @override
  void dispose() {
    widget.controller.removeListener(_handleControllerChanged);
    if (_overlayController.isShowing) {
      _overlayController.hide();
    }
    super.dispose();
  }

  void _handleControllerChanged() {
    _syncOverlay();
    if (mounted) setState(() {});
  }

  void _syncOverlay() {
    if (widget.controller.isOpen) {
      if (!_overlayController.isShowing) {
        _overlayController.show();
      }
    } else if (_overlayController.isShowing) {
      _overlayController.hide();
    }
  }

  Widget _overlayBuilder(BuildContext context) {
    final currentIndex = widget.controller.activeIndex;
    if (currentIndex == null) return const SizedBox.shrink();

    return Positioned.fill(
      child: CompositedTransformFollower(
        link: _layerLink,
        targetAnchor: Alignment.bottomLeft,
        followerAnchor: Alignment.topLeft,
        showWhenUnlinked: false,
        child: Material(
          color: Colors.transparent,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [_view(currentIndex), _mask()],
          ),
        ),
      ),
    );
  }

  Widget _view(int currentIndex) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      color: Colors.white,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: widget.menuViews[currentIndex],
      ),
    );
  }

  Widget _mask() {
    return Expanded(
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: widget.controller.hide,
        child: Container(
          key: const ValueKey('filter_dropdown_menu_mask'),
          width: MediaQuery.sizeOf(context).width,
          color: Colors.black.withValues(alpha: 0.3),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final child = CompositedTransformTarget(
      link: _layerLink,
      child: DropdownMenuHeader(
        items: widget.headerItems,
        height: widget.headerHeight,
        visibleItemCount: widget.visibleHeaderCount,
        controller: widget.controller,
      ),
    );

    return OverlayPortal(
      controller: _overlayController,
      overlayChildBuilder: _overlayBuilder,
      child: widget.headerWidth == null
          ? child
          : SizedBox(width: widget.headerWidth, child: child),
    );
  }
}
