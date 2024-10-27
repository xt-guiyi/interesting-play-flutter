import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:interesting_play_flutter/constants/app.dart';

import '../constants/http_error.dart';
import '../store/index.dart';

final dio = Dio(
  BaseOptions(
    baseUrl: 'http://192.168.31.224:3000',
    connectTimeout: const Duration(seconds: 5),
    receiveTimeout: const Duration(seconds: 3),
  ),
);

/// 权限校验拦截器
class AuthInterceptor extends Interceptor {
  AuthInterceptor();

  @override
  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    // 添加token
    final token = await asyncPrefs.getString(authorization);
    if (token != null) {
      options.headers[authorization] = token;
    }
    handler.next(options);
  }

  @override
  Future<void> onResponse(Response response, ResponseInterceptorHandler handler) async {
    // 刷新token
    final token = response.headers.value(refreshToken);
    if (token != null) {
      await asyncPrefs.setString(authorization, token);
    }
    handler.next(response);
  }
}

/// http错误处理
class ErrorInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // 这里处理错误,为http不为2xx的异常,如 404、500 等
    if (err.response != null) {
      final message = handlerErrorCode(err.response!.statusCode!);
      if (kIsWeb) {
        // Web 平台的代码
        debugPrint(message);
      } else {
        // 原生（iOS/Android）平台的代码
        Fluttertoast.showToast(
            msg: message,
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    } else {
      // 根据具体的错误类型进行分类处理，这里为没有收到响应
      debugPrint('dio异常: \n错误类型为 ${err.type}  \n原因为 ${err.message}  \n堆栈为 ${err.stackTrace}');
    }
  }
}

/// 初始化网络请求
void initApi() {
  dio.interceptors.add(AuthInterceptor());
  dio.interceptors.add(ErrorInterceptor());
  // 请求日志打印
  // dio.interceptors.add(LogInterceptor(logPrint: (o) => debugPrint(o.toString()), responseBody: false));
}
