// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ownerInfo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OwnerInfo _$OwnerInfoFromJson(Map<String, dynamic> json) => OwnerInfo(
      (json['mid'] as num).toDouble(),
      json['name'] as String,
      (json['fans'] as num).toDouble(),
      (json['videos'] as num).toDouble(),
      json['face'] as String,
    );

Map<String, dynamic> _$OwnerInfoToJson(OwnerInfo instance) => <String, dynamic>{
      'mid': instance.mid,
      'name': instance.name,
      'fans': instance.fans,
      'videos': instance.videos,
      'face': instance.face,
    };
