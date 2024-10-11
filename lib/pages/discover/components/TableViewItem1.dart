import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../widgets/DropdownMenu/DropdownMenuController.dart';

import '../../../widgets/DropdownMenu/DropdownMenu.dart' as custom_dropdown_menu;
import '../../../widgets/DropdownMenu/DropdownMenuHeader.dart';

class TableViewItem1 extends StatefulWidget {
  final String type; // table类型

  const TableViewItem1({super.key, this.type = '草稿箱'});

  @override
  State<StatefulWidget> createState() => _TableviewItem1State();
}

class _TableviewItem1State extends State<TableViewItem1>
    with AutomaticKeepAliveClientMixin {
  var data = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

  

  Widget _listItem(int index) {
    double mb = 0;
    if (data.length - 1 == index) mb = 6;
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
                  frameBuilder: (BuildContext context, Widget child, int? frame,
                      bool wasSynchronouslyLoaded) {
                    if (wasSynchronouslyLoaded) {
                      return child; // 如果是同步加载，直接返回图片
                    }
                    if (frame == null) {
                      // 加载中，返回红色盒子
                      return Container(
                          height: 80,
                          width: 100,
                          color: const Color(0xff5B5B5B));
                    }

                    return child; // 图片加载完成时显示图片
                  },
                  errorBuilder: (BuildContext context, Object error,
                      StackTrace? stackTrace) {
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
                      "新闻新闻新闻新新闻新闻新闻新新闻新闻新闻新新闻新闻新闻新新闻新闻新闻新新闻新闻新闻新新闻新闻新闻新新闻新闻新闻新",
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
                              style: TextStyle(
                                  fontSize: 10, color: Color(0xff707070)),
                            ),
                            Text("张三",
                                style: TextStyle(
                                    fontSize: 10, color: Color(0xff000000))),
                            SizedBox(
                              width: 16,
                            ),
                            Text("编辑:",
                                style: TextStyle(
                                    fontSize: 10, color: Color(0xff707070))),
                            Text("张山",
                                style: TextStyle(
                                    fontSize: 10, color: Color(0xff000000))),
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 2, horizontal: 8),
                          height: 20,
                          decoration: BoxDecoration(
                              color: const Color(0xffEAF2FF),
                              borderRadius: BorderRadius.circular(2)),
                          child: const Text(
                            "时代新闻部",
                            style: TextStyle(
                                fontSize: 10, color: Color(0xff3481F5)),
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
                ElevatedButton.icon(
                  onPressed: () {},
                  // icon: const Icon(Icons.thumb_up,size: 12,color: Colors.white), // 图标
                  icon: const ImageIcon(
                    AssetImage('images/submit.png'),
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
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14), // 设置圆角半径
                    ),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    textStyle: const TextStyle(fontSize: 18),
                    minimumSize: Size.zero,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    var menuController = DropdownMenuController();
    var time = 0;
    return Column(
        children: [
          custom_dropdown_menu.DropdownMenu(
            controller: menuController,
            headerItems: [
              DropdownMenuHeaderItem("全部日期",  iconSelect: Icons.keyboard_arrow_down,iconUnselect: Icons.keyboard_arrow_up, selectColor: Colors.blue, unselectColor: Colors.black),
              DropdownMenuHeaderItem("全部部门",  iconSelect: Icons.keyboard_arrow_down,iconUnselect: Icons.keyboard_arrow_up, selectColor: Colors.blue, unselectColor: Colors.black),
            ],
            viewBuilders:  [
              Row(
                children: [
                  GestureDetector(
                    onTap: (){
                      time = 0;
                      menuController.hide();
                    },
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("全部日期"),
                        Icon(Icons.done)
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      time = 1;
                      menuController.hide();
                    },
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("最近24小时"),
                        Icon(Icons.done)
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      time = 2;
                      menuController.hide();
                    },
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("最近一天"),
                        Icon(Icons.done)
                      ],
                    ),
                  ),
                ],
              ),
              Column(children: [Text("第二项")]),
            ],
          ),
            Expanded(child: Container(
                decoration: const BoxDecoration(color: Colors.black12),
                child: ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) => _listItem(index),
                )),)
        ]
    );
  }

  @override
  bool get wantKeepAlive => true;
}
