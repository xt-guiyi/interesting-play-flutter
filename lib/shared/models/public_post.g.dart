// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'public_post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PublicPost _$PublicPostFromJson(Map<String, dynamic> json) => _PublicPost(
  userId: (json['userId'] as num).toInt(),
  id: (json['id'] as num).toInt(),
  title: json['title'] as String,
  body: json['body'] as String,
);

Map<String, dynamic> _$PublicPostToJson(_PublicPost instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'id': instance.id,
      'title': instance.title,
      'body': instance.body,
    };
