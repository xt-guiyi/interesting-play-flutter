// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bannerInfo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BannerInfo _$BannerInfoFromJson(Map<String, dynamic> json) => BannerInfo(
      (json['id'] as num).toDouble(),
      json['url'] as String,
      json['jumpUrl'] as String,
    );

Map<String, dynamic> _$BannerInfoToJson(BannerInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
      'jumpUrl': instance.jumpUrl,
    };
