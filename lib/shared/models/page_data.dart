import 'package:freezed_annotation/freezed_annotation.dart';

part 'page_data.freezed.dart';
part 'page_data.g.dart';

@Freezed(genericArgumentFactories: true)
abstract class PageData<T> with _$PageData<T> {
  const factory PageData({
    required int page,
    required int pageSize,
    required int total,
    required T data,
  }) = _PageData<T>;

  factory PageData.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) => _$PageDataFromJson(json, fromJsonT);
}
