import 'package:interesting_play_flutter/features/auth/data/auth_repository.dart';
import 'package:interesting_play_flutter/shared/models/user_info.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'profile_repository.g.dart';

@riverpod
ProfileRepository profileRepository(Ref ref) {
  return ProfileRepository(ref.watch(authRepositoryProvider));
}

class ProfileRepository {
  ProfileRepository(this._authRepository);

  final AuthRepository _authRepository;

  Future<UserInfo?> getCurrentUser() {
    return _authRepository.getCurrentUser();
  }
}
