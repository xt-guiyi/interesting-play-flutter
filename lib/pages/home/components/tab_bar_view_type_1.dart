import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:interesting_play_flutter/model/banner_info.dart';
import 'package:interesting_play_flutter/model/video_info.dart';
import 'package:interesting_play_flutter/utils/common_util.dart';
import 'package:interesting_play_flutter/utils/time_util.dart';

import '../../../api/request/home.dart';
import '../../../constants/app_colors.dart';
import '../../../widgets/sliver_grid_delegate_with_fixed_size.dart';

class TabBarViewType1 extends StatefulWidget {
  const TabBarViewType1({super.key, required this.tabTitle});

  final String tabTitle;

  @override
  State<StatefulWidget> createState() => _TabBarViewType1State();
}

class _TabBarViewType1State extends State<TabBarViewType1>
    with AutomaticKeepAliveClientMixin {
  late List<VideoInfo> _listData = [];
  late List<BannerInfo> _bannerList = [];

  // 轮播图配置
  var _current = 0;
  final CarouselSliderController _carouselSliderController =
      CarouselSliderController();

  // 分页加载配置
  var _page = 1;
  final _pageSize = 20;
  var _isLoading = false;
  var _hasMore = true; // 是否还有更多数据

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _initData();
  }

  // 请求数据
  void _initData() async {
    await _getBannerList();
    await _getVideoList();
  }

  /// 轮播图数据
  Future<void> _getBannerList() async {
    final result = await getBanners(_page, _pageSize);
    if (result.data != null) {
      setState(() {
        _bannerList = result.data!;
        debugPrint(_bannerList.first.url);
      });
    }
  }

  /// 文章列表分页数据
  Future<void> _getVideoList() async {
    if (_isLoading || !_hasMore) return;
    setState(() {
      _isLoading = true;
    });
    final result = await getVideoList(_page, _pageSize);
    if (result.data != null) {
      final videoInfoData = result.data!.data;
      setState(() {
        if (_listData.isEmpty || _page == 1) {
          _listData = videoInfoData;
        } else {
          _listData.addAll(videoInfoData);
        }
        // 更新分页
        _page++;
        if (result.data!.total == _listData.length) _hasMore = false;
        _isLoading = false;
      });
    }
  }

  Future<void> _refreshData() async {
    setState(() {
      _page = 1;
      _getVideoList();
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    var itemWidth = (MediaQuery.of(context).size.width - 23) / 2;
    var itemHeight = 190.0;

    return NotificationListener<ScrollNotification>(
      onNotification: (ScrollNotification scrollInfo) {
        if (!_isLoading &&
            _hasMore &&
            scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent) {
          _getVideoList(); // 当滚动到达底部时加载更多
        }
        return true;
      },
      child: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(
          scrollbars: false,
        ),
        child: RefreshIndicator(
          color: AppColors.green_300,
          onRefresh: _refreshData,
          child: CustomScrollView(
            physics: const ClampingScrollPhysics(),
            slivers: [
              SliverPadding(
                padding: const EdgeInsets.all(8),
                sliver: SliverToBoxAdapter(
                  child: _buildBanner(),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
                sliver: SliverGrid.builder(
                  gridDelegate: SliverGridDelegateWithFixedSize(
                    itemWidth,
                    itemHeight,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: _listData.length,
                  itemBuilder: (context, index) =>
                      _buildGridItem(_listData[index]),
                ),
              ),
              if (_isLoading)
                const SliverToBoxAdapter(
                    child: Center(
                        child: CircularProgressIndicator(
                            color: AppColors.green_300))),
            ],
          ),
        ),
      ),
    );
  }

  /// 轮播图
  Widget? _buildBanner() {
    if (_bannerList.isNotEmpty) {
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
                }),
            carouselController: _carouselSliderController,
            items: _bannerList.map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.symmetric(horizontal: 0),
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1), // 阴影颜色
                          spreadRadius: 5, // 扩散半径
                          blurRadius: 10, // 模糊半径
                          offset: const Offset(4, 0), // 偏移量（x, y）
                        )
                      ]),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: Image.network(i.url, fit: BoxFit.cover),
                      ));
                },
              );
            }).toList(),
          ),
          Positioned(
            right: 4,
            bottom: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _bannerList.asMap().entries.map((entry) {
                return GestureDetector(
                  onTap: () =>
                      _carouselSliderController.animateToPage(entry.key),
                  child: Container(
                    width: 12.0,
                    height: 12.0,
                    margin: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 4.0),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: (Theme.of(context).brightness == Brightness.dark
                                ? Colors.white
                                : Colors.black)
                            .withOpacity(_current == entry.key ? 0.9 : 0.4)),
                  ),
                );
              }).toList(),
            ),
          )
        ],
      );
    }
    return null;
  }

  /// grid项
  Widget _buildGridItem(VideoInfo videoInfo) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2), // 阴影颜色
              spreadRadius: 0.5, // 扩散半径
              blurRadius: 0.5, // 模糊半径
              offset: const Offset(0, 1), // 偏移量（x, y）
            )
          ]),
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(6),
                      topRight: Radius.circular(6)),
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
                      const Icon(Icons.verified_user_sharp,
                          size: 10, color: Colors.white),
                      const SizedBox(
                        width: 2,
                      ),
                      Text(
                        CommonUtil.formatNumber(videoInfo.views),
                        style:
                            const TextStyle(color: Colors.white, fontSize: 10),
                      )
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
                        style:
                            const TextStyle(color: Colors.white, fontSize: 10),
                      )
                    ],
                  ),
                )
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
                  style: const TextStyle(
                    fontSize: 12,
                  ),
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
                    const SizedBox(
                      width: 2,
                    ),
                    Expanded(
                        child: Text(videoInfo.owner.name,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 12,
                            ))),
                    const Icon(Icons.menu, size: 12),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
