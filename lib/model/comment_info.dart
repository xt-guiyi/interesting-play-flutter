import 'package:json_annotation/json_annotation.dart';

part 'comment_info.g.dart';

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

  int? id;
  String? username;
  int? pubDate;
  String? ipAddress;
  String? content;
  String? avatar;
  int? like;
  //不同的类使用不同的mixin即可
  factory CommentInfo.fromJson(Map<String, dynamic> json) =>
      _$CommentInfoFromJson(json);
  Map<String, dynamic> toJson() => _$CommentInfoToJson(this);
}
