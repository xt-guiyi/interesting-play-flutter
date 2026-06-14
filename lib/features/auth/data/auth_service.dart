import 'package:dio/dio.dart';
import 'package:interesting_play_flutter/core/network/api_client.dart';
import 'package:interesting_play_flutter/core/network/api_response.dart';
import 'package:interesting_play_flutter/features/auth/model/login_dto.dart';
import 'package:interesting_play_flutter/shared/models/user_info.dart';
import 'package:interesting_play_flutter/shared/utils/api_json_parser.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_service.g.dart';

@riverpod
AuthService authService(Ref ref) {
  return AuthService(ref.watch(dioProvider));
}

class AuthService {
  AuthService(this._dio);

  final Dio _dio;

  Future<ApiResponse<String>> login(
    LoginDto loginDto, {
    bool showGlobalErrorToast = true,
  }) async {
    final response = await _dio.post(
      '/mock/login',
      data: loginDto.toJson(),
      options: ApiRequestOptions.globalErrorToast(
        enabled: showGlobalErrorToast,
      ),
    );
    return parseApiResponse<String>(response.data, (json) => json as String);
  }

  Future<ApiResponse<UserInfo>> getUserInfo({
    bool showGlobalErrorToast = true,
  }) async {
    final response = await _dio.get(
      '/mock/getUserInfo',
      options: ApiRequestOptions.globalErrorToast(
        enabled: showGlobalErrorToast,
      ),
    );
    return parseApiObjectResponse(response.data, UserInfo.fromJson);
  }
}
