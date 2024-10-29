// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserInfo _$UserInfoFromJson(Map<String, dynamic> json) => UserInfo(
      json['username'] as String,
      (json['age'] as num?)?.toInt(),
      json['avatar'] as String?,
      json['introduction'] as String?,
    );

Map<String, dynamic> _$UserInfoToJson(UserInfo instance) => <String, dynamic>{
      'username': instance.username,
      'age': instance.age,
      'avatar': instance.avatar,
      'introduction': instance.introduction,
    };
