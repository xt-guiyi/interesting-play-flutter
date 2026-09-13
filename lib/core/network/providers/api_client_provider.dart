import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../auth/auth_session.dart';
import '../../auth/auth_storage.dart';
import '../factory/api_client_factory.dart';

export '../models/api_request_options.dart';

part 'api_client_provider.g.dart';

@riverpod
Dio apiClient(Ref ref) {
  final client = ApiClientFactory.app(
    ref.watch(authStorageServiceProvider),
    onUnauthorized: () {
      if (ref.mounted) ref.read(authSessionProvider.notifier).loggedOut();
    },
  );
  ref.onDispose(() => client.close(force: true));
  return client;
}
