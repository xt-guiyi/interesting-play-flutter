import 'package:freezed_annotation/freezed_annotation.dart';

import 'api_exception.dart';

part 'api_response.freezed.dart';
part 'api_response.g.dart';

@Freezed(genericArgumentFactories: true)
abstract class ApiResponse<T> with _$ApiResponse<T> {
  const factory ApiResponse({required int code, String? message, T? data}) =
      _ApiResponse<T>;

  factory ApiResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) => _$ApiResponseFromJson(json, fromJsonT);
}

T unwrapApiResponse<T>(ApiResponse<T> response, String fallbackMessage) {
  final data = response.data;
  if (response.code != 200 || data == null) {
    throw ApiException(
      message: response.message ?? fallbackMessage,
      statusCode: response.code,
    );
  }
  return data as T;
}
