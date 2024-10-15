
import 'package:json_annotation/json_annotation.dart';
part 'discoverInfo.g.dart';
@JsonSerializable()
class DiscoverInfo {
  DiscoverInfo({
      this.id, 
      this.title, 
      this.pic, 
      this.reply, 
      this.picW, 
      this.picH,});

  int? id;
  String? title;
  String? pic;
  int? reply;
  int? picW;
  int? picH;
  //不同的类使用不同的mixin即可
  factory DiscoverInfo.fromJson(Map<String, dynamic> json) => _$DiscoverInfoFromJson(json);
  Map<String, dynamic> toJson() => _$DiscoverInfoToJson(this);
}