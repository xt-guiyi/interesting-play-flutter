import 'package:dio/dio.dart';
import 'package:flutter_feature_collection/core/network/providers/api_client_provider.dart';
import 'package:flutter_feature_collection/core/network/models/api_response.dart';
import 'package:flutter_feature_collection/features/login/model/login_dto.dart';
import 'package:flutter_feature_collection/shared/models/user_info.dart';
import 'package:flutter_feature_collection/core/utils/api_json_parser.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_service.g.dart';

@riverpod
LoginService loginService(Ref ref) {
  return LoginService(ref.watch(apiClientProvider));
}

class LoginService {
  LoginService(this._client);

  final Dio _client;

  Future<ApiResponse<String>> login(
    LoginDto loginDto, {
    bool showGlobalErrorToast = true,
  }) async {
    final response = await _client.post(
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
    final response = await _client.get(
      '/mock/getUserInfo',
      options: ApiRequestOptions.globalErrorToast(
        enabled: showGlobalErrorToast,
      ),
    );
    return parseApiObjectResponse(response.data, UserInfo.fromJson);
  }
}
