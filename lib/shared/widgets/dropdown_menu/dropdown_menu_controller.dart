import 'package:flutter/material.dart';

class DropdownMenuController extends ChangeNotifier {
  int? _activeIndex;

  int? get activeIndex => _activeIndex;

  bool get isOpen => _activeIndex != null;

  void show(int index) {
    if (_activeIndex == index) return;
    _activeIndex = index;
    notifyListeners();
  }

  void hide() {
    if (_activeIndex == null) return;
    _activeIndex = null;
    notifyListeners();
  }

  void toggle(int index) {
    if (_activeIndex == index) {
      hide();
    } else {
      show(index);
    }
  }
}
