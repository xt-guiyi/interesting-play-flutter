import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:interesting_play_flutter/features/home/model/home_state.dart';
import 'package:interesting_play_flutter/core/theme/app_colors.dart';
import 'package:interesting_play_flutter/features/home/viewmodel/home_viewmodel.dart';
import 'package:interesting_play_flutter/shared/models/banner_info.dart';
import 'package:interesting_play_flutter/shared/models/video_info.dart';
import 'package:interesting_play_flutter/shared/utils/common_util.dart';
import 'package:interesting_play_flutter/shared/utils/time_util.dart';

class TabBarViewType1 extends ConsumerStatefulWidget {
  const TabBarViewType1({super.key, required this.tabTitle});

  final String tabTitle;

  @override
  ConsumerState<TabBarViewType1> createState() => _TabBarViewType1State();
}

class _TabBarViewType1State extends ConsumerState<TabBarViewType1>
    with AutomaticKeepAliveClientMixin {
  static const _cardAspectRatio = 1.1;
  static const _cardInfoHeight = 60.0;
  static const _descLineHeight = 1.2;

  // 轮播图配置
  var _current = 0;
  final CarouselSliderController _carouselSliderController =
      CarouselSliderController();
  final _refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      final homeState = ref.read(homeViewModelProvider);
      if (!homeState.hasStartedInitialLoad) {
        _showRefreshIndicator();
      }
    });
  }

  Future<void> _refreshData() async {
    await ref.read(homeViewModelProvider.notifier).refresh();
  }

  Future<void> _showRefreshIndicator() async {
    await _refreshIndicatorKey.currentState?.show();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final homeState = ref.watch(homeViewModelProvider);
    final listData = homeState.videos;
    final bannerList = homeState.banners;
    final gridColumnCount = _resolveGridColumnCount(
      MediaQuery.sizeOf(context).width,
    );

    return NotificationListener<ScrollNotification>(
      onNotification: (ScrollNotification scrollInfo) {
        if (homeState.canLoadMoreVideos &&
            scrollInfo.metrics.pixels >= scrollInfo.metrics.maxScrollExtent) {
          ref.read(homeViewModelProvider.notifier).loadMore();
        }
        return true;
      },
      child: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
        child: RefreshIndicator(
          key: _refreshIndicatorKey,
          color: AppColors.green_300,
          onRefresh: _refreshData,
          child: CustomScrollView(
            physics: const AlwaysScrollableScrollPhysics(
              parent: ClampingScrollPhysics(),
            ),
            slivers: [
              ..._buildBannerSlivers(homeState, bannerList),
              ..._buildVideoSlivers(homeState, listData, gridColumnCount),
            ],
          ),
        ),
      ),
    );
  }

  /// 轮播图
  Widget _buildBanner(List<BannerInfo> bannerList) {
    return Stack(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 180.0,
            enlargeCenterPage: false,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 5),
            viewportFraction: 1,
            initialPage: 3,
            onPageChanged: (index, reason) {
              setState(() {
                _current = index;
              });
            },
          ),
          carouselController: _carouselSliderController,
          items: bannerList.map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 0),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.1), // 阴影颜色
                        spreadRadius: 5, // 扩散半径
                        blurRadius: 10, // 模糊半径
                        offset: const Offset(4, 0), // 偏移量（x, y）
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: Image.network(i.url, fit: BoxFit.cover),
                  ),
                );
              },
            );
          }).toList(),
        ),
        Positioned(
          right: 4,
          bottom: 2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: bannerList.asMap().entries.map((entry) {
              return GestureDetector(
                onTap: () => _carouselSliderController.animateToPage(entry.key),
                child: Container(
                  width: 12.0,
                  height: 12.0,
                  margin: const EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 4.0,
                  ),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color:
                        (Theme.of(context).brightness == Brightness.dark
                                ? Colors.white
                                : Colors.black)
                            .withValues(
                              alpha: _current == entry.key ? 0.9 : 0.4,
                            ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  List<Widget> _buildBannerSlivers(
    HomeState homeState,
    List<BannerInfo> bannerList,
  ) {
    if (bannerList.isNotEmpty) {
      return [
        SliverPadding(
          padding: const EdgeInsets.all(8),
          sliver: SliverToBoxAdapter(child: _buildBanner(bannerList)),
        ),
      ];
    }

    if (homeState.shouldShowBannerError) {
      return [
        SliverPadding(
          padding: const EdgeInsets.all(8),
          sliver: SliverToBoxAdapter(
            child: _InlineErrorView(
              message: homeState.bannerError ?? '轮播图加载失败',
              onRetry: () =>
                  ref.read(homeViewModelProvider.notifier).retryBanners(),
            ),
          ),
        ),
      ];
    }

    return const [];
  }

  List<Widget> _buildVideoSlivers(
    HomeState homeState,
    List<VideoInfo> listData,
    int gridColumnCount,
  ) {
    if (homeState.shouldShowVideoError) {
      return [
        SliverFillRemaining(
          hasScrollBody: false,
          child: _InlineErrorView(
            message: homeState.videoError ?? '视频加载失败',
            onRetry: () =>
                ref.read(homeViewModelProvider.notifier).retryVideos(),
          ),
        ),
      ];
    }

    if (listData.isEmpty) {
      return const [
        SliverFillRemaining(hasScrollBody: false, child: SizedBox.shrink()),
      ];
    }

    return [
      SliverPadding(
        padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
        sliver: SliverGrid.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: gridColumnCount,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            childAspectRatio: _cardAspectRatio,
          ),
          itemCount: listData.length,
          itemBuilder: (context, index) => _buildGridItem(listData[index]),
        ),
      ),
      if (homeState.isLoadingMore)
        const SliverToBoxAdapter(child: _FooterLoading())
      else if (homeState.loadMoreError != null)
        SliverToBoxAdapter(
          child: _FooterRetry(
            message: homeState.loadMoreError!,
            onRetry: () =>
                ref.read(homeViewModelProvider.notifier).retryLoadMore(),
          ),
        )
      else if (!homeState.hasMore && listData.isNotEmpty)
        const SliverToBoxAdapter(child: _FooterText(text: '没有更多了')),
    ];
  }

  int _resolveGridColumnCount(double screenWidth) {
    if (screenWidth >= 900) return 4;
    if (screenWidth >= 600) return 3;
    return 2;
  }

  /// grid子项
  Widget _buildGridItem(VideoInfo videoInfo) {
    return GestureDetector(
      onTap: () {
        context.push('/detail/${videoInfo.id}');
      },
      child: LayoutBuilder(
        builder: (context, constraints) {
          final imageHeight = constraints.maxHeight - _cardInfoHeight;
          return Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(6),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.1), // 阴影颜色
                  spreadRadius: 0.3, // 扩散半径
                  blurRadius: 0.3, // 模糊半径
                  offset: const Offset(0, 1), // 偏移量（x, y）
                ),
              ],
            ),
            child: Column(
              children: [
                SizedBox(
                  height: imageHeight,
                  width: double.infinity,
                  child: _buildCoverImage(videoInfo),
                ),
                _buildCardInfo(videoInfo),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildCoverImage(VideoInfo videoInfo) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(6),
            topRight: Radius.circular(6),
          ),
          child: Image.network(
            videoInfo.pic,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          left: 2,
          bottom: 2,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                Icons.verified_user_sharp,
                size: 10,
                color: Colors.white,
              ),
              const SizedBox(width: 2),
              Text(
                CommonUtil.formatNumber(videoInfo.views),
                style: const TextStyle(color: Colors.white, fontSize: 10),
              ),
            ],
          ),
        ),
        Positioned(
          right: 2,
          bottom: 2,
          child: Text(
            TimeUtil.getDurationTime(videoInfo.duration * 1000),
            style: const TextStyle(color: Colors.white, fontSize: 10),
          ),
        ),
      ],
    );
  }

  Widget _buildCardInfo(VideoInfo videoInfo) {
    return SizedBox(
      height: _cardInfoHeight,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 6 + 12 * _descLineHeight * 2,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(6, 6, 6, 0),
              child: Text(
                videoInfo.desc,
                style: const TextStyle(fontSize: 12, height: _descLineHeight),
                strutStyle: const StrutStyle(
                  fontSize: 12,
                  height: _descLineHeight,
                  forceStrutHeight: true,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.fromLTRB(6, 0, 6, 6),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(Icons.supervised_user_circle_outlined, size: 12),
                const SizedBox(width: 2),
                Expanded(
                  child: Text(
                    videoInfo.owner.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 12),
                  ),
                ),
                const Icon(Icons.menu, size: 12),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _InlineErrorView extends StatelessWidget {
  const _InlineErrorView({required this.message, required this.onRetry});

  final String message;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minHeight: 120),
      alignment: Alignment.center,
      color: AppColors.green_400,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            message,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 13, color: AppColors.sliver_500),
          ),
          const SizedBox(height: 8),
          TextButton.icon(
            onPressed: onRetry,
            icon: const Icon(Icons.refresh, size: 16),
            label: const Text('重试'),
            style: TextButton.styleFrom(foregroundColor: AppColors.green_300),
          ),
        ],
      ),
    );
  }
}

class _FooterLoading extends StatelessWidget {
  const _FooterLoading();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 16),
      child: Center(
        child: SizedBox(
          width: 22,
          height: 22,
          child: CircularProgressIndicator(
            strokeWidth: 2,
            color: AppColors.green_300,
          ),
        ),
      ),
    );
  }
}

class _FooterRetry extends StatelessWidget {
  const _FooterRetry({required this.message, required this.onRetry});

  final String message;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: Text(
              message,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 12, color: AppColors.sliver_500),
            ),
          ),
          TextButton(onPressed: onRetry, child: const Text('重试')),
        ],
      ),
    );
  }
}

class _FooterText extends StatelessWidget {
  const _FooterText({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(fontSize: 12, color: AppColors.sliver_500),
        ),
      ),
    );
  }
}
