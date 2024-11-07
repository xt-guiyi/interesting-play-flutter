import 'package:flutter/material.dart';

import '../../../constants/app_colors.dart';
import '../../../widgets/DropdownMenu/DropdownMenu.dart' as custom_dropdown_menu;
import '../../../widgets/DropdownMenu/DropdownMenuController.dart';
import '../../../widgets/DropdownMenu/DropdownMenuHeader.dart';

class TabBarViewType2 extends StatefulWidget {
  const TabBarViewType2({super.key, required this.type});

  final String type;

  @override
  State<StatefulWidget> createState() => _TabBarViewType2State();
}

class _TabBarViewType2State extends State<TabBarViewType2> with AutomaticKeepAliveClientMixin {
  final _listData = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  var menuController = DropdownMenuController();

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Column(children: [
      _headerBar(),
      Expanded(
        child: Container(
            decoration: const BoxDecoration(color: AppColors.green_400),
            child: ListView.builder(
              itemCount: _listData.length,
              itemBuilder: (context, index) => _listItem(index),
            )),
      )
    ]);
  }

  /// 头部筛选栏，使用的封装组件写法，适合简化代码
  Widget _headerBar() {
    return custom_dropdown_menu.DropdownMenu(
      controller: menuController,
      headerItems: [
        DropdownMenuHeaderItem("全部日期",
            iconSelect: Icons.keyboard_arrow_down,
            iconUnselect: Icons.keyboard_arrow_up,
            selectColor: AppColors.green_300,
            unselectColor: Colors.black),
        DropdownMenuHeaderItem("全部部门",
            iconSelect: Icons.keyboard_arrow_down,
            iconUnselect: Icons.keyboard_arrow_up,
            selectColor: AppColors.green_300,
            unselectColor: Colors.black),
        DropdownMenuHeaderItem("全部分类",
            iconSelect: Icons.keyboard_arrow_down,
            iconUnselect: Icons.keyboard_arrow_up,
            selectColor: AppColors.green_300,
            unselectColor: Colors.black),
        DropdownMenuHeaderItem("全部标签",
            iconSelect: Icons.keyboard_arrow_down,
            iconUnselect: Icons.keyboard_arrow_up,
            selectColor: AppColors.green_300,
            unselectColor: Colors.black),
      ],
      viewHeight: 300,
      headerHeight: 36,
      headerCount: 3,
      viewBuilders: [
        Column(
          children: [
            const SizedBox(
              height: 240,
              child: Center(
                child: Text(
                  "内容",
                  style: TextStyle(
                    fontSize: 34,
                    color: Colors.black,
                    decoration: TextDecoration.none,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                menuController.hide();
              },
              child: Container(
                alignment: AlignmentDirectional.center,
                width: double.infinity,
                height: 60,
                decoration: const BoxDecoration(
                  color: AppColors.green_300,
                ),
                child: const Text(
                  "关闭",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    decoration: TextDecoration.none,
                  ),
                ),
              ),
            ),
          ],
        ),
        const Column(children: [
          Text("第二项"),
        ]),
      ],
    );
  }

  /// 列表项
  Widget _listItem(int index) {
    double mb = 0;
    if (_listData.length - 1 == index) mb = 6;
    return Container(
      decoration: const BoxDecoration(color: Colors.white),
      width: double.infinity,
      height: 150,
      margin: EdgeInsets.only(left: 6, right: 6, top: 6, bottom: mb),
      padding: const EdgeInsets.only(left: 6, right: 6, top: 12, bottom: 0),
      child: Column(
        children: [
          Container(
            height: 80,
            margin: const EdgeInsets.only(bottom: 4),
            child: Row(
              children: [
                Image.network(
                  'https://p9-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/36dee4e4dceb4c41a93df4a3603439fe~tplv-k3u1fbpfcp-zoom-crop-mark:1304:1304:1304:734.awebp',
                  height: 80,
                  width: 100,
                  fit: BoxFit.fill,
                  frameBuilder: (BuildContext context, Widget child, int? frame, bool wasSynchronouslyLoaded) {
                    if (wasSynchronouslyLoaded) {
                      return child; // 如果是同步加载，直接返回图片
                    }
                    if (frame == null) {
                      // 加载中，返回红色盒子
                      return Container(height: 80, width: 100, color: const Color(0xff5B5B5B));
                    }

                    return child; // 图片加载完成时显示图片
                  },
                  errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
                    return Container(
                      color: const Color(0xff5B5B5B), // 设置为灰色
                      height: 80,
                      width: 100,
                      child: const Center(
                        child: Text(
                          '加载失败',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(width: 8),
                Expanded(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "附近消息附近消息附近消息附近消息附近消息附近消息附近消息附近消息附近消息附近消息附近消息附近消息附近消息附近消息附近消息",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 12),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Row(
                          children: [
                            Text(
                              "记者:",
                              style: TextStyle(fontSize: 10, color: Color(0xff707070)),
                            ),
                            Text("张三", style: TextStyle(fontSize: 10, color: Color(0xff000000))),
                            SizedBox(
                              width: 16,
                            ),
                            Text("编辑:", style: TextStyle(fontSize: 10, color: Color(0xff707070))),
                            Text("李四", style: TextStyle(fontSize: 10, color: Color(0xff000000))),
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
                          height: 20,
                          decoration: BoxDecoration(color: AppColors.green_200, borderRadius: BorderRadius.circular(2)),
                          child: const Text(
                            "时代新闻部",
                            style: TextStyle(fontSize: 10, color: AppColors.green_300),
                          ),
                        )
                      ],
                    )
                  ],
                ))
              ],
            ),
          ),
          const Divider(
            thickness: 1,
            color: Color(0xffD8D8D8),
          ),
          SizedBox(
            height: 30,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "2021-09-9 12:00",
                  style: TextStyle(fontSize: 12, color: Color(0xff707070)),
                ),
                // 这里其实可以用container加上row布局实现，用ElevatedButton这种有一个问题就是内置了很多默认样式，需要重置，让人困扰
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const ImageIcon(
                    AssetImage('lib/assets/submit.png'),
                    size: 12,
                    color: Colors.white,
                  ),
                  // 图标
                  label: const Text(
                    '通过',
                    style: TextStyle(fontSize: 12, color: Colors.white),
                  ),
                  // 文字
                  style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.green_300,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14), // 设置圆角半径
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      minimumSize: Size.zero,
                      enableFeedback: true),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
