// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'discoverInfo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DiscoverInfo _$DiscoverInfoFromJson(Map<String, dynamic> json) => DiscoverInfo(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
      pic: json['pic'] as String?,
      reply: (json['reply'] as num?)?.toInt(),
      picW: (json['picW'] as num?)?.toInt(),
      picH: (json['picH'] as num?)?.toInt(),
    );

Map<String, dynamic> _$DiscoverInfoToJson(DiscoverInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'pic': instance.pic,
      'reply': instance.reply,
      'picW': instance.picW,
      'picH': instance.picH,
    };
