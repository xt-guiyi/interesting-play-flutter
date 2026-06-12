import 'package:freezed_annotation/freezed_annotation.dart';

import 'owner_info.dart';

part 'video_info.freezed.dart';
part 'video_info.g.dart';

@freezed
abstract class VideoInfo with _$VideoInfo {
  const factory VideoInfo({
    required int id,
    required String title,
    required int pubDate,
    required int duration,
    required String desc,
    required String pic,
    required String url,
    required int views,
    required int reply,
    required int favorite,
    required int coin,
    required int share,
    required int like,
    required int dislike,
    required int danmaku,
    required OwnerInfo owner,
  }) = _VideoInfo;

  factory VideoInfo.fromJson(Map<String, dynamic> json) =>
      _$VideoInfoFromJson(json);
}
