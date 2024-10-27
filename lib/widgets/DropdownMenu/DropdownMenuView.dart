import 'package:flutter/material.dart';

import 'DropdownMenuController.dart';

class DropdownMenuView extends StatefulWidget {
  final DropdownMenuController controller;
  final Widget child;

  const DropdownMenuView({
    super.key,
    required this.controller,
    required this.child,
  });

  @override
  State<StatefulWidget> createState() => _DropdownMenuViewState();
}

class _DropdownMenuViewState extends State<DropdownMenuView> {
  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_dropDownListener);
  }

  void _dropDownListener() {}

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
