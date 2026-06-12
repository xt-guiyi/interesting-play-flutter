// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'owner_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OwnerInfo _$OwnerInfoFromJson(Map<String, dynamic> json) => _OwnerInfo(
  mid: (json['mid'] as num).toInt(),
  name: json['name'] as String,
  fans: (json['fans'] as num).toInt(),
  videos: (json['videos'] as num).toInt(),
  face: json['face'] as String,
);

Map<String, dynamic> _$OwnerInfoToJson(_OwnerInfo instance) =>
    <String, dynamic>{
      'mid': instance.mid,
      'name': instance.name,
      'fans': instance.fans,
      'videos': instance.videos,
      'face': instance.face,
    };
