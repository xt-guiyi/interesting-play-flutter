import 'package:interesting_play_flutter/model/owner_info.dart';
import 'package:json_annotation/json_annotation.dart';

part 'video_info.g.dart';

@JsonSerializable(explicitToJson: true)
class VideoInfo {
  VideoInfo(
      this.id,
      this.title,
      this.pubDate,
      this.duration,
      this.desc,
      this.pic,
      this.url,
      this.views,
      this.reply,
      this.favorite,
      this.coin,
      this.share,
      this.like,
      this.dislike,
      this.danmaku,
      this.owner);

  final int id;
  final String title;
  final int pubDate;
  final int duration;
  final String desc;
  final String pic;
  final String url;
  final int views;
  final int reply;
  final int favorite;
  final int coin;
  final int share;
  final int like;
  final int dislike;
  final int danmaku;
  final OwnerInfo owner;
  //不同的类使用不同的mixin即可
  factory VideoInfo.fromJson(Map<String, dynamic> json) =>
      _$VideoInfoFromJson(json);
  Map<String, dynamic> toJson() => _$VideoInfoToJson(this);
}
