import 'package:dio/dio.dart';

import '../constants/api_base_urls.dart';
import '../../auth/auth_storage.dart';
import '../interceptors/auth_interceptor.dart';
import '../interceptors/error_interceptor.dart';

/// 统一创建 Dio，业务接口添加鉴权和错误拦截器。
abstract final class ApiClientFactory {



  
  static Dio app(
    AuthStorageService storage, {
    void Function()? onUnauthorized,
  }) {
    final client = _create(ApiBaseUrls.app);
    client.interceptors.add(AuthInterceptor(storage));
    client.interceptors.add(
      ErrorInterceptor(storage, onUnauthorized: onUnauthorized),
    );
    return client;
  }

  static Dio public({String baseUrl = ApiBaseUrls.public}) => _create(baseUrl);

  static Dio _create(String baseUrl) => Dio(
    BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 3),
    ),
  );
}
