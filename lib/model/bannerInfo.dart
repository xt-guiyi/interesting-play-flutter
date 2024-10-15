import 'package:json_annotation/json_annotation.dart';
part 'bannerInfo.g.dart';

@JsonSerializable()
class BannerInfo {
  BannerInfo(this.id, this.url, this.jumpUrl);

  final double id;
  final String url;
  final String jumpUrl;
  //不同的类使用不同的mixin即可
  factory BannerInfo.fromJson(Map<String, dynamic> json) => _$BannerInfoFromJson(json);
  Map<String, dynamic> toJson() => _$BannerInfoToJson(this);
}