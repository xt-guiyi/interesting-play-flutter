// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'commentInfo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommentInfo _$CommentInfoFromJson(Map<String, dynamic> json) => CommentInfo(
      id: (json['id'] as num?)?.toDouble(),
      username: json['username'] as String?,
      pubDate: (json['pubDate'] as num?)?.toDouble(),
      ipAddress: json['ipAddress'] as String?,
      content: json['content'] as String?,
      avatar: json['avatar'] as String?,
      like: (json['like'] as num?)?.toDouble(),
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
