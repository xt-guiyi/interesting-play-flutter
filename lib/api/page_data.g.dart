// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'page_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PageData<T> _$PageDataFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    PageData<T>(
      page: (json['page'] as num).toInt(),
      pageSize: (json['pageSize'] as num).toInt(),
      total: (json['total'] as num).toInt(),
      data: fromJsonT(json['data']),
    );

Map<String, dynamic> _$PageDataToJson<T>(
  PageData<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'page': instance.page,
      'pageSize': instance.pageSize,
      'total': instance.total,
      'data': toJsonT(instance.data),
    };
