import 'package:flutter/material.dart';

class DropdownMenuController extends ChangeNotifier {
  double top = 0;
  int menuIndex = 0;
  bool isShow = false;
  bool isShowHideAnimation = false;

  void show(int index) {
    isShow = true;
    menuIndex = index;
    notifyListeners();
  }

  void hide({
    bool isShowHideAnimation = false,
  }) {
    this.isShowHideAnimation = isShowHideAnimation;
    isShow = false;
    notifyListeners();
  }
}
