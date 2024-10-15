
import 'package:interesting_play_flutter/model/ownerInfo.dart';
import 'package:json_annotation/json_annotation.dart';

part 'videoInfo.g.dart';

@JsonSerializable(explicitToJson: true)
class VideoInfo {

    VideoInfo(this.id, this.title, this.pubDate, this.duration, this.desc, this.pic, this.url, this.views, this.reply, this.favorite, this.coin, this.share, this.like, this.dislike, this.danmaku, this.owner);

    final double id;
    final String title;
    final double pubDate;
    final double duration;
    final String desc;
    final String pic;
    final String url;
    final double views;
    final double reply;
    final double favorite;
    final double coin;
    final double share;
    final double like;
    final double dislike;
    final double danmaku;
    final OwnerInfo owner;
    //不同的类使用不同的mixin即可
    factory VideoInfo.fromJson(Map<String, dynamic> json) => _$VideoInfoFromJson(json);
    Map<String, dynamic> toJson() => _$VideoInfoToJson(this);
}