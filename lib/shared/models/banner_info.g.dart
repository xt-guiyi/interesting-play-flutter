// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banner_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BannerInfo _$BannerInfoFromJson(Map<String, dynamic> json) => _BannerInfo(
  id: (json['id'] as num).toInt(),
  url: json['url'] as String,
  jumpUrl: json['jumpUrl'] as String,
);

Map<String, dynamic> _$BannerInfoToJson(_BannerInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
      'jumpUrl': instance.jumpUrl,
    };
