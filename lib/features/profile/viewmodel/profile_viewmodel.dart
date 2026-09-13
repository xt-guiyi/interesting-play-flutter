import 'package:flutter_feature_collection/core/auth/auth_session.dart';
import 'package:flutter_feature_collection/features/login/model/login_repository.dart';
import 'package:flutter_feature_collection/features/profile/data/profile_repository.dart';
import 'package:flutter_feature_collection/features/profile/model/profile_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'profile_viewmodel.g.dart';

@riverpod
class ProfileViewModel extends _$ProfileViewModel {
  int _requestGeneration = 0;

  @override
  ProfileState build() {
    return const ProfileState();
  }

  Future<void> loadProfile() async {
    final generation = ++_requestGeneration;
    final session = ref.read(authSessionProvider);
    if (session.isLoading || session.hasError || session.value != true) {
      state = const ProfileState();
      return;
    }
    state = state.copyWith(isLoading: true, error: null);
    try {
      final repository = ref.read(profileRepositoryProvider);
      final user = await repository.getCurrentUser();
      if (!ref.mounted || generation != _requestGeneration) return;
      state = state.copyWith(user: user, isLoading: false);
    } catch (error) {
      if (!ref.mounted || generation != _requestGeneration) return;
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
