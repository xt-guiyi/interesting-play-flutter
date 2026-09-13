import 'package:dio/dio.dart';

import '../../auth/auth_storage.dart';
import '../constants/app_constants.dart';

class AuthInterceptor extends Interceptor {
  AuthInterceptor(this._storage);

  final AuthStorageService _storage;

  static bool isServiceRequest(RequestOptions options) {
    final base = Uri.parse(options.baseUrl);
    final url = options.uri;
    return base.scheme == url.scheme &&
        base.host == url.host &&
        base.port == url.port;
  }

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    try {
      if (isServiceRequest(options)) {
        final token = await _storage.getAuthorization();
        if (token != null && token.isNotEmpty) {
          options.headers[App.tokenHeader] = 'Bearer $token';
        }
      }
      handler.next(options);
    } catch (error, stackTrace) {
      handler.reject(
        DioException(
          requestOptions: options,
          error: error,
          stackTrace: stackTrace,
          message: '读取登录信息失败',
        ),
      );
    }
  }

  @override
  Future<void> onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) async {
    try {
      if (isServiceRequest(response.requestOptions)) {
        final token = response.headers.value(App.refreshToken);
        if (token != null && token.isNotEmpty) {
          await _storage.setAuthorization(token);
        }
      }
      handler.next(response);
    } catch (error, stackTrace) {
      handler.reject(
        DioException(
          requestOptions: response.requestOptions,
          response: response,
          error: error,
          stackTrace: stackTrace,
          message: '保存登录信息失败',
        ),
      );
    }
  }
}
