import 'package:freezed_annotation/freezed_annotation.dart';

part 'comment_info.freezed.dart';
part 'comment_info.g.dart';

@freezed
abstract class CommentInfo with _$CommentInfo {
  const factory CommentInfo({
    int? id,
    String? username,
    int? pubDate,
    String? ipAddress,
    String? content,
    String? avatar,
    int? like,
  }) = _CommentInfo;

  factory CommentInfo.fromJson(Map<String, dynamic> json) =>
      _$CommentInfoFromJson(json);
}
