// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserInfo _$UserInfoFromJson(Map<String, dynamic> json) => _UserInfo(
  username: json['username'] as String,
  id: json['id'] as String?,
  nickname: json['nickname'] as String?,
  age: (json['age'] as num?)?.toInt(),
  avatar: json['avatar'] as String?,
  introduction: json['introduction'] as String?,
);

Map<String, dynamic> _$UserInfoToJson(_UserInfo instance) => <String, dynamic>{
  'username': instance.username,
  'id': instance.id,
  'nickname': instance.nickname,
  'age': instance.age,
  'avatar': instance.avatar,
  'introduction': instance.introduction,
};
