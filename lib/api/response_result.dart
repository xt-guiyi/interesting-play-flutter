import 'package:json_annotation/json_annotation.dart';

part 'response_result.g.dart';

// 请求结果数据
@JsonSerializable(genericArgumentFactories: true)
class ResponseResult<T> {
  ResponseResult({required this.code, required this.message, this.data});

  final int code;
  final String message;
  T? data;
  //不同的类使用不同的mixin即可
  factory ResponseResult.fromJson(
          Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$ResponseResultFromJson(json, fromJsonT);
  Map<String, dynamic> toJson(Object Function(T value) toJsonT) =>
      _$ResponseResultToJson(this, toJsonT);
}
