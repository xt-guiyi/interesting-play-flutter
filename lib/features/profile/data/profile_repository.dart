import 'package:flutter_feature_collection/features/login/model/login_repository.dart';
import 'package:flutter_feature_collection/shared/models/user_info.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'profile_repository.g.dart';

@riverpod
ProfileRepository profileRepository(Ref ref) {
  return ProfileRepository(ref.watch(loginRepositoryProvider));
}

class ProfileRepository {
  ProfileRepository(this._loginRepository);

  final LoginRepository _loginRepository;

  Future<UserInfo?> getCurrentUser() {
    return _loginRepository.getCurrentUser();
  }
}
