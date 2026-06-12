import 'package:freezed_annotation/freezed_annotation.dart';

part 'banner_info.freezed.dart';
part 'banner_info.g.dart';

@freezed
abstract class BannerInfo with _$BannerInfo {
  const factory BannerInfo({
    required int id,
    required String url,
    required String jumpUrl,
  }) = _BannerInfo;

  factory BannerInfo.fromJson(Map<String, dynamic> json) =>
      _$BannerInfoFromJson(json);
}
