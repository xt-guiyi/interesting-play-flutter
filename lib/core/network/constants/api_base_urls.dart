abstract final class ApiBaseUrls {
  static const app = String.fromEnvironment(
    'APP_API_BASE_URL',
    defaultValue: 'http://10.18.10.21:8080',
  );
  static const public = 'https://jsonplaceholder.typicode.com/';
}
