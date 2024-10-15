
import 'package:json_annotation/json_annotation.dart';
part 'ownerInfo.g.dart';

@JsonSerializable()
class OwnerInfo {
    OwnerInfo(this.mid, this.name, this.fans, this.videos, this.face);

    final double mid;
    final String name;
    final double fans;
    final double videos;
    final String face;
    //不同的类使用不同的mixin即可
    factory OwnerInfo.fromJson(Map<String, dynamic> json) => _$OwnerInfoFromJson(json);
    Map<String, dynamic> toJson() => _$OwnerInfoToJson(this);
}