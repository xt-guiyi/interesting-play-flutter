import 'package:freezed_annotation/freezed_annotation.dart';

import 'owner_info.dart';

part 'discover_info.freezed.dart';
part 'discover_info.g.dart';

@freezed
abstract class DiscoverInfo with _$DiscoverInfo {
  const factory DiscoverInfo({
    int? id,
    String? title,
    String? pic,
    int? reply,
    int? picW,
    int? picH,
    OwnerInfo? owner,
  }) = _DiscoverInfo;

  factory DiscoverInfo.fromJson(Map<String, dynamic> json) =>
      _$DiscoverInfoFromJson(json);
}
