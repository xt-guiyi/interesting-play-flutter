
// 请求结果数据
class ResponseResult<T> {
  final int code;
  final String message;
  final T data;

  ResponseResult({required this.code, required this.message, required this.data});

  factory ResponseResult.fromJson(Map<String, dynamic> json, T Function(Object? json) fromJsonT) {
    return ResponseResult<T>(
      code: json['code'],
      message: json['message'],
      data: fromJsonT(json['data']),
    );
  }
}