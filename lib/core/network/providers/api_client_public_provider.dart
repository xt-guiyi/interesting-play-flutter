import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../factory/api_client_factory.dart';

part 'api_client_public_provider.g.dart';

@riverpod
Dio apiClientPublic(Ref ref) {
  final client = ApiClientFactory.public();
  ref.onDispose(() => client.close(force: true));
  return client;
}
