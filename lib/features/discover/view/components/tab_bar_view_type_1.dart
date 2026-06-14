import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:interesting_play_flutter/core/theme/app_colors.dart';
import 'package:interesting_play_flutter/features/discover/viewmodel/discover_viewmodel.dart';
import 'package:interesting_play_flutter/shared/models/discover_info.dart';
import 'package:interesting_play_flutter/shared/utils/common_util.dart';

class TabBarViewType1 extends ConsumerStatefulWidget {
  final String type; // tab类型

  const TabBarViewType1({super.key, required this.type});

  @override
  ConsumerState<TabBarViewType1> createState() => _TabBarViewType1State();
}

class _TabBarViewType1State extends ConsumerState<TabBarViewType1>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final state = ref.read(discoverViewModelProvider);
      if (state.items.isEmpty && !state.isLoading) {
        ref.read(discoverViewModelProvider.notifier).loadInitial();
      }
    });
  }

  Future<void> _refreshData() async {
    await ref.read(discoverViewModelProvider.notifier).refresh();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return _staggeredList();
  }

  Widget _staggeredList() {
    final discoverState = ref.watch(discoverViewModelProvider);
    final listData = discoverState.items;

    return NotificationListener<ScrollNotification>(
      onNotification: (ScrollNotification scrollInfo) {
        if (!discoverState.isLoading &&
            discoverState.hasMore &&
            scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent) {
          ref.read(discoverViewModelProvider.notifier).loadMore();
        }
        return true;
      },
      child: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(scrollbars: true),
        child: RefreshIndicator(
          color: AppColors.green_300,
          onRefresh: _refreshData,
          child: Container(
            decoration: const BoxDecoration(color: AppColors.green_400),
            padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
            child: MasonryGridView.builder(
              padding: const EdgeInsets.only(top: 8),
              gridDelegate:
                  const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              itemCount: listData.length,
              itemBuilder: (context, index) {
                return _gridViewItem(context, listData[index]);
              },
            ),
          ),
        ),
      ),
    );
  }

  /// 网格子项
  Widget _gridViewItem(BuildContext context, DiscoverInfo discoverInfo) {
    // 瀑布流布局，图片最好能够知道提前知道高度，然后手动设置imageView的高度，这样能够避免滚动时，动态计算高度导致发生item位置变化动画，
    //  获取高度方式有两种一种是服务器接口直接告诉图片宽高信息(最优解)，一种是已同步方式先下载图片，拿到图片宽高信息后才设置imageView的高度(慢，费流量)
    // https://juejin.cn/post/7125615887784083469
    const horizontalPadding = 16.0;
    const crossAxisSpacing = 8.0;
    final itemWidth =
        (MediaQuery.sizeOf(context).width -
            horizontalPadding -
            crossAxisSpacing) /
        2;
    final itemHeight = _calculateImageHeight(discoverInfo, itemWidth);
    final imageUrl = discoverInfo.pic;

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
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(6),
              topRight: Radius.circular(6),
            ),
            child: _buildImage(imageUrl, itemWidth, itemHeight),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  discoverInfo.title ?? "-",
                  textAlign: TextAlign.start,
                  style: const TextStyle(fontSize: 12, color: Colors.black),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(Icons.supervised_user_circle_outlined, size: 12),
                    const SizedBox(width: 2),
                    Expanded(
                      child: Text(
                        discoverInfo.owner?.name ?? "-",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontSize: 12),
                      ),
                    ),
                    const Icon(Icons.menu, size: 12),
                    const SizedBox(width: 2),
                    Text(
                      CommonUtil.formatNumber(discoverInfo.reply ?? 0),
                      style: const TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  double _calculateImageHeight(DiscoverInfo discoverInfo, double itemWidth) {
    final picW = discoverInfo.picW;
    final picH = discoverInfo.picH;
    if (picW == null || picH == null || picW <= 0 || picH <= 0) {
      return 200;
    }

    return itemWidth * picH / picW;
  }

  Widget _buildImage(String? imageUrl, double width, double height) {
    if (imageUrl == null || imageUrl.isEmpty) {
      return _ImagePlaceholder(width: width, height: height);
    }

    return Image.network(
      imageUrl,
      width: width,
      height: height,
      fit: BoxFit.cover,
      errorBuilder: (context, error, stackTrace) {
        return _ImagePlaceholder(width: width, height: height);
      },
    );
  }
}

class _ImagePlaceholder extends StatelessWidget {
  const _ImagePlaceholder({required this.width, required this.height});

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      alignment: Alignment.center,
      color: AppColors.sliver_100,
      child: const Icon(
        Icons.image_not_supported_outlined,
        size: 28,
        color: AppColors.sliver_400,
      ),
    );
  }
}
