const Map<int, String> httpErrors = {
  400: '错误的请求',
  401: '未授权，请重新登录',
  403: '没有访问权限',
  404: '资源未找到',
  405: '方法不允许',
  409: '请求冲突',
  500: '服务器错误，请稍后重试',
  502: '网关错误',
  503: '服务不可用',
  504: '网关超时',
};

class ApiException implements Exception {
  const ApiException({required this.message, this.statusCode});

  final String message;
  final int? statusCode;

  @override
  String toString() {
    if (statusCode == null) return message;
    return '$message ($statusCode)';
  }
}

String handleHttpErrorCode(int code) {
  return httpErrors[code] ?? 'http错误码: $code';
}

@Deprecated('Use handleHttpErrorCode instead.')
String handlerErrorCode(int code) {
  return handleHttpErrorCode(code);
}
