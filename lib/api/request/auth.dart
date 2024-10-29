import 'package:interesting_play_flutter/model/login_model.dart';
import 'package:interesting_play_flutter/model/user_info.dart';

import '../index.dart';
import '../response_result.dart';

/// 登录
Future<ResponseResult<String>> login(LoginModel loginModel) async {
  final response = await dio.post('/mock/login', data: loginModel.toJson());
  // json转换
  return ResponseResult<String>.fromJson(
    response.data,
    (json) => json as String,
  );
}

/// 获取用户数据
Future<ResponseResult<UserInfo>> getUserInfo() async {
  final response = await dio.get('/mock/getUserInfo');
  // json转换
  return ResponseResult<UserInfo>.fromJson(
      response.data, (userInfoJson) => UserInfo.fromJson(userInfoJson as Map<String, dynamic>));
}
