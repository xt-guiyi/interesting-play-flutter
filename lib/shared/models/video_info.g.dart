// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_VideoInfo _$VideoInfoFromJson(Map<String, dynamic> json) => _VideoInfo(
  id: (json['id'] as num).toInt(),
  title: json['title'] as String,
  pubDate: (json['pubDate'] as num).toInt(),
  duration: (json['duration'] as num).toInt(),
  desc: json['desc'] as String,
  pic: json['pic'] as String,
  url: json['url'] as String,
  views: (json['views'] as num).toInt(),
  reply: (json['reply'] as num).toInt(),
  favorite: (json['favorite'] as num).toInt(),
  coin: (json['coin'] as num).toInt(),
  share: (json['share'] as num).toInt(),
  like: (json['like'] as num).toInt(),
  dislike: (json['dislike'] as num).toInt(),
  danmaku: (json['danmaku'] as num).toInt(),
  owner: OwnerInfo.fromJson(json['owner'] as Map<String, dynamic>),
);

Map<String, dynamic> _$VideoInfoToJson(_VideoInfo instance) =>
    <String, dynamic>{
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
      'owner': instance.owner,
    };
