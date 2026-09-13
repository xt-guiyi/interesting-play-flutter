abstract final class ApiBaseUrls {
  static const app = String.fromEnvironment(
    'APP_API_BASE_URL',
    defaultValue: 'http://192.168.2.216:8080',
  );
  static const public = 'https://jsonplaceholder.typicode.com/';
}
