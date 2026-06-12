import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:interesting_play_flutter/core/theme/app_colors.dart';
import 'package:interesting_play_flutter/features/home/viewmodel/home_viewmodel.dart';
import 'package:interesting_play_flutter/shared/models/banner_info.dart';
import 'package:interesting_play_flutter/shared/models/video_info.dart';
import 'package:interesting_play_flutter/shared/utils/common_util.dart';
import 'package:interesting_play_flutter/shared/utils/time_util.dart';
import 'package:interesting_play_flutter/shared/widgets/sliver_grid_delegate_with_fixed_size.dart';

class TabBarViewType1 extends ConsumerStatefulWidget {
  const TabBarViewType1({super.key, required this.tabTitle});

  final String tabTitle;

  @override
  ConsumerState<TabBarViewType1> createState() => _TabBarViewType1State();
}

class _TabBarViewType1State extends ConsumerState<TabBarViewType1>
    with AutomaticKeepAliveClientMixin {
  // 轮播图配置
  var _current = 0;
  final CarouselSliderController _carouselSliderController =
      CarouselSliderController();

  @override
  bool get wantKeepAlive => true;

  Future<void> _refreshData() async {
    await ref.read(homeViewModelProvider.notifier).refresh();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final homeState = ref.watch(homeViewModelProvider);
    final listData = homeState.videos;
    final bannerList = homeState.banners;
    var itemWidth = (MediaQuery.of(context).size.width - 23) / 2;
    var itemHeight = 156.0;

    return NotificationListener<ScrollNotification>(
      onNotification: (ScrollNotification scrollInfo) {
        if (!homeState.isLoading &&
            homeState.hasMore &&
            scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent) {
          ref.read(homeViewModelProvider.notifier).loadMore();
        }
        return true;
      },
      child: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
        child: RefreshIndicator(
          color: AppColors.green_300,
          onRefresh: _refreshData,
          child: CustomScrollView(
            physics: const ClampingScrollPhysics(),
            slivers: [
              if (bannerList.isNotEmpty)
                SliverPadding(
                  padding: const EdgeInsets.all(8),
                  sliver: SliverToBoxAdapter(child: _buildBanner(bannerList)),
                ),
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
                sliver: SliverGrid.builder(
                  gridDelegate: SliverGridDelegateWithFixedSize(
                    itemWidth,
                    itemHeight,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: listData.length,
                  itemBuilder: (context, index) =>
                      _buildGridItem(listData[index]),
                ),
              ),
              if (homeState.isLoading)
                const SliverToBoxAdapter(
                  child: Center(
                    child: CircularProgressIndicator(
                      color: AppColors.green_300,
                    ),
                  ),
                ),
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

  /// grid子项
  Widget _buildGridItem(VideoInfo videoInfo) {
    return GestureDetector(
      onTap: () {
        context.push('/detail/${videoInfo.id}');
      },
      child: Container(
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
            Expanded(
              flex: 1,
              child: Stack(
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
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    right: 2,
                    bottom: 2,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          TimeUtil.getDurationTime(videoInfo.duration),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(6),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    videoInfo.desc,
                    style: const TextStyle(fontSize: 12),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.supervised_user_circle_outlined,
                        size: 12,
                      ),
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
