import 'package:json_annotation/json_annotation.dart';

part 'page_data.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class PageData<T> {
  PageData({
    required this.page,
    required this.pageSize,
    required this.total,
    required this.data,
  });

  int page;
  int pageSize;
  int total;
  T data;
  //不同的类使用不同的mixin即可
  factory PageData.fromJson(
          Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$PageDataFromJson(json, fromJsonT);
  Map<String, dynamic> toJson(Object Function(T value) toJsonT) =>
      _$PageDataToJson(this, toJsonT);
}
