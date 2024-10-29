import 'dart:convert';

import 'package:get/get.dart';
import 'package:interesting_play_flutter/model/user_info.dart';

import '../constants/app.dart';
import 'index.dart';

class UserInfoController extends GetxController {
  final _userInfo = Rxn<UserInfo>();
  final _isLoggedIn = false.obs;

  void setUserInfo(UserInfo? userInfo) {
    _userInfo.value = userInfo;
    if (userInfo != null) {
      _isLoggedIn.value = true;
      asyncPrefs.setString(App.userInfo, jsonEncode(userInfo.toJson()));
    }
  }

  void removeUserInfo() {
    _userInfo.value = null;
    asyncPrefs.remove(App.userInfo);
    _isLoggedIn.value = false;
  }

  // 检查用户是否已登录
  bool checkIfLoggedIn() => _isLoggedIn.value;
  Future<UserInfo?> getUserInfo() async {
    // 假设 _userInfo 是一个 GetX 的响应式变量
    if (_userInfo.value != null) return Future.value(_userInfo.value);
    final userInfo = await asyncPrefs.getString(App.userInfo);
    if (userInfo != null) return Future.value(UserInfo.fromJson(jsonDecode(userInfo)));
    return Future.value(null);
  }
}
