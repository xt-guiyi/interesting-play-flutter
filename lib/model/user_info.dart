import 'package:json_annotation/json_annotation.dart';

part 'user_info.g.dart';

@JsonSerializable()
class UserInfo {
  UserInfo(this.username, this.age, this.avatar, this.introduction);

  final String username;
  final int? age;
  final String? avatar;
  final String? introduction;
  //不同的类使用不同的mixin即可
  factory UserInfo.fromJson(Map<String, dynamic> json) => _$UserInfoFromJson(json);
  Map<String, dynamic> toJson() => _$UserInfoToJson(this);
}
