import 'package:dio/dio.dart';
import 'package:flutter_feature_collection/core/network/providers/api_client_public_provider.dart';
import 'package:flutter_feature_collection/shared/models/public_post.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'json_placeholder_service.g.dart';

@riverpod
JsonPlaceholderService jsonPlaceholderService(Ref ref) {
  return JsonPlaceholderService(ref.watch(apiClientPublicProvider));
}

class JsonPlaceholderService {
  JsonPlaceholderService(this._client);

  final Dio _client;

  Future<List<PublicPost>> getPosts({int limit = 10}) async {
    final response = await _client.get<List<dynamic>>(
      '/posts',
      queryParameters: {'_limit': limit},
    );

    final data = response.data ?? <dynamic>[];
    return data
        .map((item) => PublicPost.fromJson(item as Map<String, dynamic>))
        .toList();
  }
}
