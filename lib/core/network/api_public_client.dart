import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../constants/api_base_urls.dart';

part 'api_public_client.g.dart';

@riverpod
Dio publicDio(Ref ref) {
  return createPublicDio();
}

Dio createPublicDio() {
  return Dio(
    BaseOptions(
      baseUrl: ApiBaseUrls.public,
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 3),
    ),
  );
}
