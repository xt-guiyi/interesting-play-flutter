import 'package:interesting_play_flutter/features/discover/data/discover_repository.dart';
import 'package:interesting_play_flutter/features/discover/model/discover_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'discover_viewmodel.g.dart';

@riverpod
class DiscoverViewModel extends _$DiscoverViewModel {
  @override
  DiscoverState build() {
    return const DiscoverState();
  }

  Future<void> loadInitial() async {
    state = state.copyWith(isLoading: true, error: null, page: 1);
    try {
      final repository = ref.read(discoverRepositoryProvider);
      final pageData = await repository.getDiscoverList(1, state.pageSize);
      state = state.copyWith(
        items: pageData.data,
        page: 2,
        hasMore: pageData.total > pageData.data.length,
        isLoading: false,
      );
    } catch (error) {
      state = state.copyWith(isLoading: false, error: error.toString());
    }
  }

  Future<void> refresh() {
    return loadInitial();
  }

  Future<void> loadMore() async {
    if (state.isLoading || !state.hasMore) return;
    state = state.copyWith(isLoading: true, error: null);
    try {
      final repository = ref.read(discoverRepositoryProvider);
      final pageData = await repository.getDiscoverList(
        state.page,
        state.pageSize,
      );
      final items = [...state.items, ...pageData.data];
      state = state.copyWith(
        items: items,
        page: state.page + 1,
        hasMore: pageData.total > items.length,
        isLoading: false,
      );
    } catch (error) {
      state = state.copyWith(isLoading: false, error: error.toString());
    }
  }
}
