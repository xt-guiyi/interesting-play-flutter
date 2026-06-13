import 'package:freezed_annotation/freezed_annotation.dart';

part 'response_result.freezed.dart';
part 'response_result.g.dart';

@Freezed(genericArgumentFactories: true)
abstract class ResponseResult<T> with _$ResponseResult<T> {
  const factory ResponseResult({required int code, String? message, T? data}) =
      _ResponseResult<T>;

  factory ResponseResult.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) => _$ResponseResultFromJson(json, fromJsonT);
}