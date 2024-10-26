import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class TabBarViewType1 extends StatefulWidget {
  final String type; // tab类型

  const TabBarViewType1({super.key, required this.type});

  @override
  State<StatefulWidget> createState() => _TabBarViewType1State();
}

class _TabBarViewType1State extends State<TabBarViewType1> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return _staggeredList();
  }

  Widget _staggeredList() {
    final List<Map<String, dynamic>> _items =
        List.generate(200, (index) => {"id": index, "title": "Item $index", "height": Random().nextInt(150) + 50.5});

    return MasonryGridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 4,
      crossAxisSpacing: 4,
      itemBuilder: (context, index) {
        return Card(
          // Give each item a random background color
          color: Color.fromARGB(
              Random().nextInt(256), Random().nextInt(256), Random().nextInt(256), Random().nextInt(256)),
          key: ValueKey(_items[index]['id']),
          child: SizedBox(
            height: _items[index]['height'],
            child: Center(
              child: Text(_items[index]['title']),
            ),
          ),
        );
        ;
      },
    );
  }
}
