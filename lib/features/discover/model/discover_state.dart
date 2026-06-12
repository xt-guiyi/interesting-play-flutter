import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:interesting_play_flutter/shared/models/discover_info.dart';

part 'discover_state.freezed.dart';

@freezed
abstract class DiscoverState with _$DiscoverState {
  const factory DiscoverState({
    @Default([]) List<DiscoverInfo> items,
    @Default(1) int page,
    @Default(20) int pageSize,
    @Default(true) bool hasMore,
    @Default(false) bool isLoading,
    String? error,
  }) = _DiscoverState;
}
