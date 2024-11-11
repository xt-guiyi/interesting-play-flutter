/*
 * @Author: xt 1661219752@qq.com
 * @Date: 2024-09-12 11:58:04
 * @LastEditors: xt 1661219752@qq.com
 * @LastEditTime: 2024-09-12 14:46:41
 * @Description: 文本类聊天item
 */
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../chat_page.dart';

class ChatItem3 extends StatelessWidget {
  const ChatItem3({super.key, required this.content, this.side = Side.left});

  final Side side;
  final String content;

  /// 左侧布局
  Widget leftLayout(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CircleAvatar(
          radius: 20,
          backgroundColor: Colors.white,
          backgroundImage: NetworkImage(
              'https://images.cubox.pro/iw3rni/file/2024092617464027713/1.png'),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(10, 4, 0, 0),
          padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 6),
          decoration: BoxDecoration(
              color: Colors.black12, borderRadius: BorderRadius.circular(4)),
          constraints: BoxConstraints(
              minWidth: MediaQuery.of(context).size.width * 0.1,
              maxWidth: MediaQuery.of(context).size.width * 0.6),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(content, style: const TextStyle(fontSize: 16)),
              const SizedBox(
                height: 10,
              ),
              chart()
            ],
          ),
        )
      ],
    );
  }

  /// 右侧布局
  Widget rightLayout(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(0, 4, 10, 0),
          padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 6),
          decoration: BoxDecoration(
              color: Colors.black12, borderRadius: BorderRadius.circular(4)),
          constraints: BoxConstraints(
              minWidth: MediaQuery.of(context).size.width * 0.1,
              maxWidth: MediaQuery.of(context).size.width * 0.6),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(content, style: const TextStyle(fontSize: 16)),
              const SizedBox(
                height: 10,
              ),
              chart()
            ],
          ),
        ),
        const CircleAvatar(
          radius: 20,
          backgroundColor: Colors.white,
          backgroundImage: NetworkImage(
              'https://images.cubox.pro/iw3rni/file/2024102923062812324/IMG_0794.JPG'),
        ),
      ],
    );
  }

  Widget chart() {
    return Container(
      constraints:
          const BoxConstraints.tightFor(height: 200, width: double.infinity),
      child: PieChart(
        PieChartData(
          borderData: FlBorderData(
            show: false,
          ),
          sectionsSpace: 1,
          centerSpaceRadius: double.infinity,
          sections: showingSections(),
        ),
        swapAnimationDuration: const Duration(milliseconds: 150), // Optional
        swapAnimationCurve: Curves.linear, // Optional
      ),
      // child: Chart(
      //   data: const [
      //     {'category': 'Shirts', 'sales': 5},
      //     {'category': 'Cardigans', 'sales': 20},
      //     {'category': 'Chiffons', 'sales': 36},
      //     {'category': 'Pants', 'sales': 10},
      //     {'category': 'Heels', 'sales': 10},
      //     {'category': 'Socks', 'sales': 20},
      //   ],
      //   variables: {
      //     'category': Variable(
      //       accessor: (Map map) => map['category'] as String,
      //     ),
      //     'sales': Variable(
      //       accessor: (Map map) => map['sales'] as num,
      //       scale: LinearScale(min: 0),
      //     ),
      //   },
      //   transforms: [
      //     Proportion(
      //       variable: 'sales',
      //       as: 'percent',
      //     ),
      //   ],
      //   marks: [IntervalMark(
      //     position: Varset('percent') / Varset('category'),
      //     modifiers: [StackModifier()],
      //     color: ColorEncode(
      //       variable: 'category',
      //       values: Defaults.colors10,
      //     ),
      //   )],
      //   coord: PolarCoord(
      //     transposed: true,
      //     dimCount: 1,
      //   ),
      // ),
    );
  }

  List<PieChartSectionData> showingSections() {
    const shadows = [Shadow(color: Colors.black, blurRadius: 2)];
    return List.generate(4, (i) {
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: Colors.blue,
            value: 40,
            title: '40%',
            radius: 100.0,
            showTitle: false,
            titleStyle: const TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Color(0xffffffff),
              shadows: shadows,
            ),
          );
        case 1:
          return PieChartSectionData(
            color: Colors.yellow,
            value: 30,
            title: '30%',
            radius: 100.0,
            showTitle: false,
            titleStyle: const TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Color(0xffffffff),
              shadows: shadows,
            ),
          );
        case 2:
          return PieChartSectionData(
            color: Colors.red,
            value: 16,
            title: '16%',
            radius: 100.0,
            showTitle: false,
            titleStyle: const TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Color(0xffffffff),
              shadows: shadows,
            ),
          );
        case 3:
          return PieChartSectionData(
            color: Colors.green,
            value: 15,
            title: '15%',
            radius: 100.0,
            showTitle: false,
            titleStyle: const TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Color(0xffffffff),
              shadows: shadows,
            ),
          );
        default:
          throw Exception('Oh no');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 0),
      child: side == Side.left ? leftLayout(context) : rightLayout(context),
    );
  }
}
