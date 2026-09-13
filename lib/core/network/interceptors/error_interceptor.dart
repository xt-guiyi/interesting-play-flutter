import 'package:dio/dio.dart';

import '../../auth/auth_storage.dart';
import '../../utils/app_toast.dart';
import '../exceptions/api_exception.dart';
import '../models/api_request_options.dart';
import 'auth_interceptor.dart';

class ErrorInterceptor extends Interceptor {
  ErrorInterceptor(this._storage, {this.onUnauthorized});

  final AuthStorageService _storage;
  final void Function()? onUnauthorized;
  Future<void>? _unauthorizedTask;

  @override
  Future<void> onError(
    DioException error,
    ErrorInterceptorHandler handler,
  ) async {
    final statusCode = error.response?.statusCode;
    final message = statusCode != null
        ? handleHttpErrorCode(statusCode)
        : switch (error.type) {
            DioExceptionType.connectionTimeout ||
            DioExceptionType.sendTimeout ||
            DioExceptionType.receiveTimeout => '网络请求超时',
            DioExceptionType.connectionError => '网络连接失败，请检查网络',
            DioExceptionType.cancel => '请求已取消',
            _ => '网络请求失败，请稍后重试',
          };
    if (error.type != DioExceptionType.cancel &&
        ApiRequestOptions.shouldShowGlobalErrorToast(error.requestOptions)) {
      AppToast.showError(message);
    }
    try {
      if (statusCode == 401 &&
          AuthInterceptor.isServiceRequest(error.requestOptions)) {
        await (_unauthorizedTask ??= _clearSession());
      }
    } catch (failure, stackTrace) {
      handler.next(
        DioException(
          requestOptions: error.requestOptions,
          response: error.response,
          error: failure,
          stackTrace: stackTrace,
          message: '清理登录信息失败',
        ),
      );
      return;
    }
    handler.next(error);
  }

  Future<void> _clearSession() async {
    try {
      await _storage.clearAuthState();
      onUnauthorized?.call();
    } finally {
      _unauthorizedTask = null;
    }
  }
}
