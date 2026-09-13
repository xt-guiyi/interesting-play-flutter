import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_feature_collection/core/network/constants/api_base_urls.dart';
import 'package:flutter_feature_collection/core/network/providers/api_client_provider.dart';
import 'package:flutter_feature_collection/core/network/factory/api_client_factory.dart';
import 'package:flutter_feature_collection/core/auth/auth_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences_platform_interface/in_memory_shared_preferences_async.dart';
import 'package:shared_preferences_platform_interface/shared_preferences_async_platform_interface.dart';

void main() {
  setUp(() async {
    SharedPreferencesAsyncPlatform.instance =
        InMemorySharedPreferencesAsync.empty();
    SharedPreferences.setMockInitialValues({});
  });

  test('app factory uses the app base url', () {
    final client = ApiClientFactory.app(AuthStorageService());
    addTearDown(client.close);

    expect(client.options.baseUrl, ApiBaseUrls.app);
  });

  test('public factory uses the public base url', () {
    final client = ApiClientFactory.public();
    addTearDown(client.close);

    expect(client.options.baseUrl, ApiBaseUrls.public);
  });

  test('global error toast is enabled by default and can be disabled', () {
    final defaultRequestOptions = ApiRequestOptions();

    expect(defaultRequestOptions.showGlobalErrorToast, isTrue);

    final silentOptions = ApiRequestOptions.noGlobalErrorToast();

    expect(silentOptions.showGlobalErrorToast, isFalse);
  });
}
