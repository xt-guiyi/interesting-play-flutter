import 'dart:math';

import 'package:interesting_play_flutter/features/home/data/home_repository.dart';
import 'package:interesting_play_flutter/features/home/model/home_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_viewmodel.g.dart';

@riverpod
class HomeViewModel extends _$HomeViewModel {
  final _random = Random();
  int _requestGeneration = 0;

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

  Future<void> refresh() async {
    if (state.isRefreshing) return;
    final generation = ++_requestGeneration;

    state = state.copyWith(
      isRefreshing: true,
      userError: null,
      bannerError: null,
      videoError: null,
      loadMoreError: null,
    );
    try {
      await Future.wait<void>([
        _loadCurrentUser(generation),
        _loadBanners(generation),
        _loadFirstPageVideos(generation),
      ]);
    } finally {
      state = state.copyWith(isRefreshing: false);
    }
  }

  Future<void> loadMore() async {
    if (!state.canLoadMoreVideos) return;

    final nextPage = state.page;
    final generation = _requestGeneration;
    state = state.copyWith(isLoadingMore: true, loadMoreError: null);
    try {
      final repository = ref.read(homeRepositoryProvider);
      final videoPage = await repository.getVideoList(nextPage, state.pageSize);
      if (generation != _requestGeneration) {
        state = state.copyWith(isLoadingMore: false);
        return;
      }
      final videos = [...state.videos, ...videoPage.data];
      state = state.copyWith(
        videos: videos,
        page: nextPage + 1,
        hasMore: videoPage.total > videos.length,
        isLoadingMore: false,
      );
    } catch (error) {
      state = state.copyWith(
        isLoadingMore: false,
        loadMoreError: _errorMessage(error),
      );
    }
  }

  Future<void> retryVideos() {
    return _loadFirstPageVideos(_requestGeneration);
  }

  Future<void> retryBanners() {
    return _loadBanners(_requestGeneration);
  }

  Future<void> retryLoadMore() {
    state = state.copyWith(loadMoreError: null);
    return loadMore();
  }

  Future<void> _loadCurrentUser(int generation) async {
    try {
      final repository = ref.read(homeRepositoryProvider);
      final user = await repository.getCurrentUser();
      if (generation != _requestGeneration) return;
      state = state.copyWith(currentUser: user, userError: null);
    } catch (error) {
      if (generation != _requestGeneration) return;
      state = state.copyWith(userError: _errorMessage(error));
    }
  }

  Future<void> _loadBanners(int generation) async {
    try {
      final repository = ref.read(homeRepositoryProvider);
      final banners = await repository.getBanners();
      if (generation != _requestGeneration) return;
      state = state.copyWith(banners: banners, bannerError: null);
    } catch (error) {
      if (generation != _requestGeneration) return;
      state = state.copyWith(bannerError: _errorMessage(error));
    }
  }

  Future<void> _loadFirstPageVideos(int generation) async {
    try {
      final repository = ref.read(homeRepositoryProvider);
      final videoPage = await repository.getVideoList(1, state.pageSize);
      if (generation != _requestGeneration) return;
      state = state.copyWith(
        videos: videoPage.data,
        page: 2,
        hasMore: videoPage.total > videoPage.data.length,
        videoError: null,
        loadMoreError: null,
      );
    } catch (error) {
      if (generation != _requestGeneration) return;
      state = state.copyWith(videoError: _errorMessage(error));
    }
  }

  String _errorMessage(Object error) {
    // return error.toString();
    return "网络错误，请稍后再试吧";
  }
}
