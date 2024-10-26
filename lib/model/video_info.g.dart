// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VideoInfo _$VideoInfoFromJson(Map<String, dynamic> json) => VideoInfo(
      (json['id'] as num).toInt(),
      json['title'] as String,
      (json['pubDate'] as num).toInt(),
      (json['duration'] as num).toInt(),
      json['desc'] as String,
      json['pic'] as String,
      json['url'] as String,
      (json['views'] as num).toInt(),
      (json['reply'] as num).toInt(),
      (json['favorite'] as num).toInt(),
      (json['coin'] as num).toInt(),
      (json['share'] as num).toInt(),
      (json['like'] as num).toInt(),
      (json['dislike'] as num).toInt(),
      (json['danmaku'] as num).toInt(),
      OwnerInfo.fromJson(json['owner'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$VideoInfoToJson(VideoInfo instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'pubDate': instance.pubDate,
      'duration': instance.duration,
      'desc': instance.desc,
      'pic': instance.pic,
      'url': instance.url,
      'views': instance.views,
      'reply': instance.reply,
      'favorite': instance.favorite,
      'coin': instance.coin,
      'share': instance.share,
      'like': instance.like,
      'dislike': instance.dislike,
      'danmaku': instance.danmaku,
      'owner': instance.owner.toJson(),
    };
