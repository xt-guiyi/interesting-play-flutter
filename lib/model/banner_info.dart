import 'package:json_annotation/json_annotation.dart';

part 'banner_info.g.dart';

@JsonSerializable()
class BannerInfo {
  BannerInfo(this.id, this.url, this.jumpUrl);

  final int id;
  final String url;
  final String jumpUrl;
  //不同的类使用不同的mixin即可
  factory BannerInfo.fromJson(Map<String, dynamic> json) =>
      _$BannerInfoFromJson(json);
  Map<String, dynamic> toJson() => _$BannerInfoToJson(this);
}
