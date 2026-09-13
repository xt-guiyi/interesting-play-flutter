import 'package:flutter_feature_collection/core/auth/auth_session.dart';
import 'package:flutter_feature_collection/features/login/data/login_repository.dart';
import 'package:flutter_feature_collection/features/profile/data/profile_repository.dart';
import 'package:flutter_feature_collection/features/profile/model/profile_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'profile_viewmodel.g.dart';

@riverpod
class ProfileViewModel extends _$ProfileViewModel {
  @override
  ProfileState build() {
    return const ProfileState();
  }

  Future<void> loadProfile() async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final repository = ref.read(profileRepositoryProvider);
      final user = await repository.getCurrentUser();
      state = state.copyWith(user: user, isLoading: false);
    } catch (error) {
      state = state.copyWith(isLoading: false, error: error.toString());
    }
  }

  Future<void> logout() async {
    final session = ref.read(authSessionProvider.notifier);
    await ref.read(loginRepositoryProvider).logout();
    if (ref.mounted) state = const ProfileState();
    session.loggedOut();
  }
}
