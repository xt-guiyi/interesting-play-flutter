
import 'package:json_annotation/json_annotation.dart';
part 'commentInfo.g.dart';

@JsonSerializable()
class CommentInfo {
  CommentInfo({
    this.id,
    this.username,
    this.pubDate,
    this.ipAddress,
    this.content,
    this.avatar,
    this.like,
  });

  double? id;
  String? username;
  double? pubDate;
  String? ipAddress;
  String? content;
  String? avatar;
  double? like;
  //不同的类使用不同的mixin即可
  factory CommentInfo.fromJson(Map<String, dynamic> json) => _$CommentInfoFromJson(json);
  Map<String, dynamic> toJson() => _$CommentInfoToJson(this);
}
