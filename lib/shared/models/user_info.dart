import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_info.freezed.dart';
part 'user_info.g.dart';

@freezed
abstract class UserInfo with _$UserInfo {
  const UserInfo._();

  const factory UserInfo({
    required String username,
    String? id,
    String? nickname,
    int? age,
    String? avatar,
    String? introduction,
  }) = _UserInfo;

  factory UserInfo.fromJson(Map<String, dynamic> json) =>
      _$UserInfoFromJson(json);

  String get displayName =>
      nickname?.trim().isNotEmpty == true ? nickname! : username;
}
