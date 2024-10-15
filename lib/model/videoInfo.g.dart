// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'videoInfo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VideoInfo _$VideoInfoFromJson(Map<String, dynamic> json) => VideoInfo(
      (json['id'] as num).toDouble(),
      json['title'] as String,
      (json['pubDate'] as num).toDouble(),
      (json['duration'] as num).toDouble(),
      json['desc'] as String,
      json['pic'] as String,
      json['url'] as String,
      (json['views'] as num).toDouble(),
      (json['reply'] as num).toDouble(),
      (json['favorite'] as num).toDouble(),
      (json['coin'] as num).toDouble(),
      (json['share'] as num).toDouble(),
      (json['like'] as num).toDouble(),
      (json['dislike'] as num).toDouble(),
      (json['danmaku'] as num).toDouble(),
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
