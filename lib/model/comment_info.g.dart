// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommentInfo _$CommentInfoFromJson(Map<String, dynamic> json) => CommentInfo(
      id: (json['id'] as num?)?.toInt(),
      username: json['username'] as String?,
      pubDate: (json['pubDate'] as num?)?.toInt(),
      ipAddress: json['ipAddress'] as String?,
      content: json['content'] as String?,
      avatar: json['avatar'] as String?,
      like: (json['like'] as num?)?.toInt(),
    );

Map<String, dynamic> _$CommentInfoToJson(CommentInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'pubDate': instance.pubDate,
      'ipAddress': instance.ipAddress,
      'content': instance.content,
      'avatar': instance.avatar,
      'like': instance.like,
    };
