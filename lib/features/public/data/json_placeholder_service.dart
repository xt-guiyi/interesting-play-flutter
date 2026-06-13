import 'package:dio/dio.dart';
import 'package:interesting_play_flutter/core/network/api_public_client.dart';
import 'package:interesting_play_flutter/shared/models/public_post.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'json_placeholder_service.g.dart';

@riverpod
JsonPlaceholderService jsonPlaceholderService(Ref ref) {
  return JsonPlaceholderService(ref.watch(publicDioProvider));
}

class JsonPlaceholderService {
  JsonPlaceholderService(this._dio);

  final Dio _dio;

  Future<List<PublicPost>> getPosts({int limit = 10}) async {
    final response = await _dio.get<List<dynamic>>(
      '/posts',
      queryParameters: {'_limit': limit},
    );

    final data = response.data ?? <dynamic>[];
    return data
        .map((item) => PublicPost.fromJson(item as Map<String, dynamic>))
        .toList();
  }
}
