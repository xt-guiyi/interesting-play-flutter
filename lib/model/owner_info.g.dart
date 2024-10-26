// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'owner_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OwnerInfo _$OwnerInfoFromJson(Map<String, dynamic> json) => OwnerInfo(
      (json['mid'] as num).toInt(),
      json['name'] as String,
      (json['fans'] as num).toInt(),
      (json['videos'] as num).toInt(),
      json['face'] as String,
    );

Map<String, dynamic> _$OwnerInfoToJson(OwnerInfo instance) => <String, dynamic>{
      'mid': instance.mid,
      'name': instance.name,
      'fans': instance.fans,
      'videos': instance.videos,
      'face': instance.face,
    };
