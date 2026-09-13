import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_feature_collection/shared/models/user_info.dart';

part 'profile_state.freezed.dart';

@freezed
abstract class ProfileState with _$ProfileState {
  const factory ProfileState({
    UserInfo? user,
    @Default(false) bool isLoading,
    String? error,
  }) = _ProfileState;
}
