import 'dart:convert';

import 'package:interesting_play_flutter/shared/models/user_info.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/app_constants.dart';

part 'local_storage.g.dart';

@riverpod
LocalStorageService localStorageService(Ref ref) {
  return LocalStorageService();
}

class LocalStorageService {
  LocalStorageService({SharedPreferencesAsync? prefs})
    : _prefs = prefs ?? SharedPreferencesAsync();

  final SharedPreferencesAsync _prefs;

  Future<String?> getAuthorization() {
    return _prefs.getString(App.authorization);
  }

  Future<void> setAuthorization(String token) {
    return _prefs.setString(App.authorization, token);
  }

  Future<void> removeAuthorization() {
    return _prefs.remove(App.authorization);
  }

  Future<UserInfo?> getUserInfo() async {
    final userInfo = await _prefs.getString(App.userInfo);
    if (userInfo == null || userInfo.isEmpty) return null;

    try {
      return UserInfo.fromJson(jsonDecode(userInfo) as Map<String, dynamic>);
    } on FormatException {
      await removeUserInfo();
      return null;
    } on TypeError {
      await removeUserInfo();
      return null;
    }
  }

  Future<void> setUserInfo(UserInfo? userInfo) {
    if (userInfo == null) return removeUserInfo();
    return _prefs.setString(App.userInfo, jsonEncode(userInfo.toJson()));
  }

  Future<void> removeUserInfo() {
    return _prefs.remove(App.userInfo);
  }

  Future<void> clearAuthState() async {
    await removeAuthorization();
    await removeUserInfo();
  }
}
