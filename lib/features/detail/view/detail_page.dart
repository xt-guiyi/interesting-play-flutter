import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key, required this.id});

  final String id;

  @override
  State<DetailPage> createState() => _DetailPagState();
}

class _DetailPagState extends State<DetailPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // 最外层容器必须为Material，或者Scaffold控件， 才能确保子widget应用material样式，不然Text样式是默认的红色
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: SafeArea(
          child: Center(
            child: GestureDetector(
              onTap: () {
                context.pop();
              },
              child: Text(
                "详情页 ${widget.id},点击返回",
                style: const TextStyle(fontSize: 32),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
