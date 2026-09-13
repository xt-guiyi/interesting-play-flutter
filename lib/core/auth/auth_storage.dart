import 'dart:convert';

import 'package:flutter_feature_collection/shared/models/user_info.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../network/constants/app_constants.dart';

part 'auth_storage.g.dart';

/// 提供认证本地存储服务。
@riverpod
AuthStorageService authStorageService(Ref ref) {
  return AuthStorageService();
}

/// 基于 [SharedPreferencesAsync] 的认证本地存储封装。
class AuthStorageService {

  /// [prefs] 主要用于测试注入；生产环境默认使用 [SharedPreferencesAsync]。
  AuthStorageService({SharedPreferencesAsync? prefs})
    : _prefs = prefs ?? SharedPreferencesAsync();

  final SharedPreferencesAsync _prefs;

  /// 读取本地缓存的授权 token。
  Future<String?> getAuthorization() {
    return _prefs.getString(App.authorization);
  }

  /// 保存接口鉴权使用的 token。
  Future<void> setAuthorization(String token) {
    return _prefs.setString(App.authorization, token);
  }

  /// 删除本地缓存的授权 token。
  Future<void> removeAuthorization() {
    return _prefs.remove(App.authorization);
  }

  /// 读取本地缓存的用户信息。
  /// 没有缓存用户信息时返回 `null`。如果缓存 JSON 损坏，会自动删除无效缓存并返回 `null`。
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

  /// 保存 userInfo 到本地缓存。传入 `null` 时会清理用户信息缓存。
  Future<void> setUserInfo(UserInfo? userInfo) {
    if (userInfo == null) return removeUserInfo();
    return _prefs.setString(App.userInfo, jsonEncode(userInfo.toJson()));
  }

  /// 删除本地缓存的用户信息。
  Future<void> removeUserInfo() {
    return _prefs.remove(App.userInfo);
  }

  /// 清理本地所有鉴权状态。
  /// 会同时删除授权 token 和用户信息缓存，适用于注销登录或 token 过期处理。
  Future<void> clearAuthState() async {
    await removeAuthorization();
    await removeUserInfo();
  }
}
