import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../store/index.dart';
final dio = Dio(
  BaseOptions(
    baseUrl: 'https://api.pub.dev',
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

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (kDebugMode) {  debugPrint('缓存拦截器错误: $err');}
    super.onError(err, handler);
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
    // 在这里处理错误
    if (err.response != null) {
      // 响应错误（例如 404、500 等）
      debugPrint('Error status: ${err.response?.statusCode}');
      debugPrint('Error data: ${err.response?.data}');
    }

    // 根据具体的错误类型进行分类处理
    switch (err.type) {
      case DioExceptionType.connectionTimeout:
        debugPrint('Connection timeout');
        break;
      case DioExceptionType.sendTimeout:
        debugPrint('Send timeout');
        break;
      case DioExceptionType.receiveTimeout:
        debugPrint('Receive timeout');
        break;
      case DioExceptionType.cancel:
        debugPrint('Request to API was cancelled');
        break;
      default:
        debugPrint('Unexpected error: ${err.message}');
        break;
    }
    // 继续处理错误
    super.onError(err, handler);
  }
}


/// 初始化网络请求
void initApi() {
  dio.interceptors.add(AuthInterceptor());
  dio.interceptors.add(CacheInterceptor());
  dio.interceptors.add(ErrorInterceptor());
  dio.interceptors.add(LogInterceptor(logPrint: (o) => debugPrint(o.toString()), responseBody: false));
}
