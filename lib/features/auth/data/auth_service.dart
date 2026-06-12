import 'package:dio/dio.dart';
import 'package:interesting_play_flutter/core/network/api_client.dart';
import 'package:interesting_play_flutter/core/network/response_result.dart';
import 'package:interesting_play_flutter/features/auth/model/login_dto.dart';
import 'package:interesting_play_flutter/shared/models/user_info.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_service.g.dart';

@riverpod
AuthService authService(Ref ref) {
  return AuthService(ref.watch(dioProvider));
}

class AuthService {
  AuthService(this._dio);

  final Dio _dio;

  Future<ResponseResult<String>> login(LoginDto loginDto) async {
    final response = await _dio.post('/mock/login', data: loginDto.toJson());
    return ResponseResult<String>.fromJson(
      response.data as Map<String, dynamic>,
      (json) => json as String,
    );
  }

  Future<ResponseResult<UserInfo>> getUserInfo() async {
    final response = await _dio.get('/mock/getUserInfo');
    return ResponseResult<UserInfo>.fromJson(
      response.data as Map<String, dynamic>,
      (json) => UserInfo.fromJson(json as Map<String, dynamic>),
    );
  }
}
