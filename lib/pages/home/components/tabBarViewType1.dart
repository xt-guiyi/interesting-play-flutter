import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../api/request/home.dart';

class TabBarViewType1 extends StatefulWidget {
  const TabBarViewType1({super.key, required this.tabTitle});

  final String tabTitle;

  @override
  State<StatefulWidget> createState() => _TabBarViewType1State();
}

class _TabBarViewType1State extends State<TabBarViewType1>
    with AutomaticKeepAliveClientMixin {
  final _listData = [1, 2, 3, 4, 5, 6, 7, 8];
  final _bannerData = [
    'https://images.cubox.pro/1720890122032/747205/image.png',
    'https://images.cubox.pro/iw3rni/file/2024071400460487466/4cb58c73505686ff3cb5c6d9a2bbe950.png',
    'https://images.cubox.pro/1720890739965/652361/image.png',
    'https://images.cubox.pro/1720890535148/654467/image.png',
    'https://images.cubox.pro/1721052210810/706263/image.png',
    'https://images.cubox.pro/1721052327839/293615/image.png',
  ];
  var _current = 0;
  final CarouselSliderController _carouselSliderController = CarouselSliderController();

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _getCommentList();
  }

  void _getCommentList() async {
    final s = await getCommentList(1,10);
    debugPrint(s.toString());
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(
        scrollbars: false,
      ),
      child: CustomScrollView(
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
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  childAspectRatio: 1.1),
              itemCount: _listData.length,
              itemBuilder: (context, index) => _buildGridItem(index),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBanner() {
    return Stack(
      children: [
        CarouselSlider(
          options: CarouselOptions(
              height: 180.0,
              enlargeCenterPage: false,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 5),
              viewportFraction: 1,
              initialPage:3,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              }),
          carouselController: _carouselSliderController,
          items: _bannerData.map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.symmetric(horizontal: 0),
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1), // 阴影颜色
                            spreadRadius: 5, // 扩散半径
                            blurRadius: 10, // 模糊半径
                            offset: const Offset(4, 0), // 偏移量（x, y）
                          )
                        ]),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: Image.network(i, fit: BoxFit.cover),
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
            children: _bannerData.asMap().entries.map((entry) {
              return GestureDetector(
                onTap: () => _carouselSliderController.animateToPage(entry.key),
                child: Container(
                  width: 12.0,
                  height: 12.0,
                  margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
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

  Widget _buildGridItem(int position) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1), // 阴影颜色
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
                    'https://images.cubox.pro/1721051657684/731218/image.png',
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  ),
                )
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(6),
              child: Column(
                children: [
                  Text(
                    "吼吼吼吼吼吼吼吼吼吼吼吼吼吼吼吼吼吼吼吼吼吼吼吼吼吼吼吼吼吼吼吼吼吼吼吼吼吼吼吼吼吼吼吼吼吼吼吼$position",
                    style: const TextStyle(
                      fontSize: 12,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const Row(
                    children: [
                      Icon(
                        Icons.supervised_user_circle_outlined,
                        size: 12,
                      ),
                      Expanded(
                          child: Text("水水水水水水水水",
                              style: TextStyle(
                                fontSize: 12,
                              ))),
                      Icon(Icons.menu, size: 12),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
