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
    504: '网关超时'
  };

String handlerErrorCode(int code) {
  return httpErrors[code] ?? 'http错误码: $code';
}
