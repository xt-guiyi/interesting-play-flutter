import 'package:interesting_play_flutter/features/auth/viewmodel/auth_viewmodel.dart';
import 'package:interesting_play_flutter/features/profile/data/profile_repository.dart';
import 'package:interesting_play_flutter/features/profile/model/profile_state.dart';
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
    final repository = ref.read(profileRepositoryProvider);
    await repository.logout();
    ref.invalidate(authViewModelProvider);
    state = const ProfileState();
  }
}
