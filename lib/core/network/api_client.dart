import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../constants/api_base_urls.dart';
import '../constants/app_constants.dart';
import '../storage/local_storage.dart';
import 'api_exception.dart';

part 'api_client.g.dart';

@riverpod
Dio dio(Ref ref) {
  final localStorage = ref.watch(localStorageServiceProvider);
  return createAppDio(localStorage);
}

Dio createAppDio(LocalStorageService localStorage) {
  final dio = Dio(
    BaseOptions(
      baseUrl: ApiBaseUrls.app,
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 3),
    ),
  );

  dio.interceptors.add(AuthInterceptor(localStorage));
  dio.interceptors.add(ErrorInterceptor(localStorage));
  return dio;
}

abstract final class ApiRequestOptions {
  static const _showGlobalErrorToastKey = 'showGlobalErrorToast';

  static Options noGlobalErrorToast() {
    return Options(extra: {_showGlobalErrorToastKey: false});
  }

  static Options? globalErrorToast({bool enabled = true}) {
    return enabled ? null : noGlobalErrorToast();
  }

  static bool shouldShowGlobalErrorToast(RequestOptions options) {
    return options.extra[_showGlobalErrorToastKey] as bool? ?? true;
  }
}

class AuthInterceptor extends Interceptor {
  AuthInterceptor(this._localStorage);

  final LocalStorageService _localStorage;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = await _localStorage.getAuthorization();
    if (token != null && token.isNotEmpty) {
      options.headers[App.authorization] = token;
    }
    handler.next(options);
  }

  @override
  Future<void> onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) async {
    final token = response.headers.value(App.refreshToken);
    if (token != null && token.isNotEmpty) {
      await _localStorage.setAuthorization(token);
    }
    handler.next(response);
  }
}

class ErrorInterceptor extends Interceptor {
  ErrorInterceptor(this._localStorage);

  final LocalStorageService _localStorage;

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    final statusCode = err.response?.statusCode;
    final shouldShowToast = ApiRequestOptions.shouldShowGlobalErrorToast(
      err.requestOptions,
    );

    if (statusCode != null) {
      final message = handleHttpErrorCode(statusCode);
      if (shouldShowToast) {
        _showErrorToast(message);
      }

      if (statusCode == 401) {
        await _localStorage.clearAuthState();
      }
    } else if (err.type == DioExceptionType.connectionTimeout) {
      if (shouldShowToast) {
        _showErrorToast('网络连接超时');
      }
    }

    debugPrint(
      'dio异常: \n错误类型为 ${err.type}  \n原因为 ${err.message}  \n堆栈为 ${err.stackTrace}',
    );
    handler.next(err);
  }

  void _showErrorToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.black,
      textColor: Colors.white,
      fontSize: 16,
    );
  }
}
