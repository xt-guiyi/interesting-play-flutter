import 'package:flutter_test/flutter_test.dart';
import 'package:interesting_play_flutter/core/constants/api_base_urls.dart';
import 'package:interesting_play_flutter/core/network/api_client.dart';
import 'package:interesting_play_flutter/core/network/api_public_client.dart';
import 'package:interesting_play_flutter/core/storage/local_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences_platform_interface/in_memory_shared_preferences_async.dart';
import 'package:shared_preferences_platform_interface/shared_preferences_async_platform_interface.dart';

void main() {
  setUp(() async {
    SharedPreferencesAsyncPlatform.instance =
        InMemorySharedPreferencesAsync.empty();
    SharedPreferences.setMockInitialValues({});
  });

  test('createAppDio uses the app base url', () {
    final dio = createAppDio(LocalStorageService());

    expect(dio.options.baseUrl, ApiBaseUrls.app);
  });

  test('createAppDio adds the auth interceptor', () {
    final dio = createAppDio(LocalStorageService());

    expect(dio.interceptors.whereType<AuthInterceptor>(), hasLength(1));
  });

  test('createPublicDio uses the public base url', () {
    final dio = createPublicDio();

    expect(dio.options.baseUrl, ApiBaseUrls.public);
  });

  test('createPublicDio does not add app interceptors', () {
    final dio = createPublicDio();

    expect(dio.interceptors.whereType<AuthInterceptor>(), isEmpty);
    expect(dio.interceptors.whereType<ErrorInterceptor>(), isEmpty);
  });
}
