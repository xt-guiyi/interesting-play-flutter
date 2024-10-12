import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../store/index.dart';
final dio = Dio(
  BaseOptions(
    baseUrl: 'http://192.168.2.78:3000',
    connectTimeout: const Duration(seconds: 5),
    receiveTimeout: const Duration(seconds: 3),
  ),
);

/// 缓存拦截器
class CacheInterceptor extends Interceptor {
  CacheInterceptor();

  final _cache = <Uri, Response>{};

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final response = _cache[options.uri];
    if (options.extra['refresh'] == true) {
      if (kDebugMode) { debugPrint('${options.uri}: 强制刷新, 忽略! \n');}
      return handler.next(options);
    } else if (response != null) {
      if (kDebugMode) {  debugPrint('缓存注入: ${options.uri} \n');}
      return handler.resolve(response);
    }
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    _cache[response.requestOptions.uri] = response;
    super.onResponse(response, handler);
  }
}

/// 权限校验拦截器
class AuthInterceptor extends Interceptor {
  AuthInterceptor();

  @override
  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final accessToken =  await asyncPrefs.getString('access_token');
    debugPrint("token为：$accessToken");
    if(accessToken != null) {
      options.headers['authorization'] = accessToken;
    }
    handler.next(options);
  }

  @override
  Future<void> onResponse(Response response, ResponseInterceptorHandler handler) async {
    final isRefresh =  await asyncPrefs.getString('access_token');
    if(isRefresh != null) {
      await asyncPrefs.setString('access_token',isRefresh);
    }
    handler.next(response);
  }
}


/// http错误处理
class ErrorInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // 这里处理错误,为http不为2xx的异常
    if (err.response != null) {
      // 响应错误（例如 404、500 等）
      debugPrint('Error status: ${err.response?.statusCode}');
      debugPrint('Error data: ${err.response?.data}');
    }

    // 根据具体的错误类型进行分类处理，这里为没有收到响应
    debugPrint('http异常: \n类型为 ${err.type}  \n原因为 ${err.message}  \n堆栈为 ${err.stackTrace}');
  }
}


/// 初始化网络请求
void initApi() {
  dio.interceptors.add(AuthInterceptor());
  dio.interceptors.add(CacheInterceptor());
  dio.interceptors.add(ErrorInterceptor());
  dio.interceptors.add(LogInterceptor(logPrint: (o) => debugPrint(o.toString()), responseBody: false));
}
