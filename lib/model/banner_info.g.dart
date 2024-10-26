// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banner_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BannerInfo _$BannerInfoFromJson(Map<String, dynamic> json) => BannerInfo(
      (json['id'] as num).toInt(),
      json['url'] as String,
      json['jumpUrl'] as String,
    );

Map<String, dynamic> _$BannerInfoToJson(BannerInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
      'jumpUrl': instance.jumpUrl,
    };
