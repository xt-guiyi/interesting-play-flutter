import 'dart:math';

import 'package:interesting_play_flutter/features/home/data/home_repository.dart';
import 'package:interesting_play_flutter/features/home/model/home_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_viewmodel.g.dart';

@riverpod
class HomeViewModel extends _$HomeViewModel {
  final _random = Random();

  @override
  HomeState build() {
    return const HomeState();
  }

  void rotateSearchText() {
    final searchTextList = state.searchTextList;
    if (searchTextList.isEmpty) return;
    state = state.copyWith(
      currentSearchText: searchTextList[_random.nextInt(searchTextList.length)],
    );
  }

  Future<void> loadInitial() async {
    state = state.copyWith(isLoading: true, error: null, page: 1);
    try {
      final repository = ref.read(homeRepositoryProvider);
      final user = await repository.getCurrentUser();
      final banners = await repository.getBanners();
      final videoPage = await repository.getVideoList(1, state.pageSize);
      state = state.copyWith(
        currentUser: user,
        banners: banners,
        videos: videoPage.data,
        page: 2,
        hasMore: videoPage.total > videoPage.data.length,
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
      final repository = ref.read(homeRepositoryProvider);
      final videoPage = await repository.getVideoList(
        state.page,
        state.pageSize,
      );
      final videos = [...state.videos, ...videoPage.data];
      state = state.copyWith(
        videos: videos,
        page: state.page + 1,
        hasMore: videoPage.total > videos.length,
        isLoading: false,
      );
    } catch (error) {
      state = state.copyWith(isLoading: false, error: error.toString());
    }
  }
}
