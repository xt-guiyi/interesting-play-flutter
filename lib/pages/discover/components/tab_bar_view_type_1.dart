import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:interesting_play_flutter/api/request/discover.dart';
import 'package:interesting_play_flutter/utils/common_util.dart';

import '../../../constants/app_colors.dart';
import '../../../model/discover_info.dart';

class TabBarViewType1 extends StatefulWidget {
  final String type; // tab类型

  const TabBarViewType1({super.key, required this.type});

  @override
  State<StatefulWidget> createState() => _TabBarViewType1State();
}

class _TabBarViewType1State extends State<TabBarViewType1> with AutomaticKeepAliveClientMixin {
  List<DiscoverInfo> _listData = [];
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
    await _getDiscoverList();
  }

  Future<void> _refreshData() async {
    setState(() {
      _page = 1;
      _getDiscoverList();
    });
  }

  /// 文章发现页列表分页数据
  Future<void> _getDiscoverList() async {
    if (_isLoading || !_hasMore) return;
    setState(() {
      _isLoading = true;
    });
    final result = await getDiscoverList(_page, _pageSize);
    if (result.data != null) {
      final discoverInfoData = result.data!.data;
      setState(() {
        if (_listData.isEmpty || _page == 1) {
          _listData = discoverInfoData;
        } else {
          _listData.addAll(discoverInfoData);
        }
        // 更新分页
        _page++;
        if (result.data!.total == _listData.length) _hasMore = false;
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return _staggeredList();
  }

  Widget _staggeredList() {
    return NotificationListener<ScrollNotification>(
      onNotification: (ScrollNotification scrollInfo) {
        if (!_isLoading && _hasMore && scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent) {
          _getDiscoverList(); // 当滚动到达底部时加载更多
        }
        return true;
      },
      child: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(
          scrollbars: true,
        ),
        child: RefreshIndicator(
            color: AppColors.green_300,
            onRefresh: _refreshData,
            child: Container(
              decoration: const BoxDecoration(color: AppColors.green_400),
              padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
              child: MasonryGridView.count(
                padding: EdgeInsets.only(top: 8),
                crossAxisCount: 2,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                itemCount: _listData.length,
                itemBuilder: (context, index) {
                  return _gridViewItem(context, _listData[index]);
                },
              ),
            )),
      ),
    );
  }

  /// 网格子项
  Widget _gridViewItem(BuildContext context, DiscoverInfo discoverInfo) {
    // 瀑布流布局，图片最好能够知道提前知道高度，然后手动设置imageView的高度，这样能够避免滚动时，动态计算高度导致发生item位置变化动画，
    //  获取高度方式有两种一种是服务器接口直接告诉图片宽高信息(最优解)，一种是已同步方式先下载图片，拿到图片宽高信息后才设置imageView的高度(慢，费流量)
    // https://juejin.cn/post/7125615887784083469
    final itemWidth = (MediaQuery.sizeOf(context).width / 2) - 12;
    var itemHeight = 200.0;
    if (discoverInfo.picH != null && discoverInfo.picW != null) {
      final rate = discoverInfo.picW! / discoverInfo.picH!.toDouble();
      itemHeight = itemWidth / rate;
    }
    return Container(
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(6), boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.1), // 阴影颜色
          spreadRadius: 0.3, // 扩散半径
          blurRadius: 0.3, // 模糊半径
          offset: const Offset(0, 1), // 偏移量（x, y）
        )
      ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(topLeft: Radius.circular(6), topRight: Radius.circular(6)),
            child: Image.network(
              discoverInfo.pic ?? "",
              width: itemWidth,
              height: itemHeight,
              fit: BoxFit.fill,
            ),
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
                    const Icon(
                      Icons.supervised_user_circle_outlined,
                      size: 12,
                    ),
                    const SizedBox(
                      width: 2,
                    ),
                    Expanded(
                        child: Text(discoverInfo.owner?.name ?? "-",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 12,
                            ))),
                    const Icon(Icons.menu, size: 12),
                    const SizedBox(
                      width: 2,
                    ),
                    Text(CommonUtil.formatNumber(discoverInfo.reply ?? 0),
                        style: const TextStyle(
                          fontSize: 12,
                        ))
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
