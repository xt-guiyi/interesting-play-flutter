import 'package:flutter/material.dart';
import 'package:interesting_play_flutter/pages/home/index.dart';
import 'package:interesting_play_flutter/pages/tabs/index.dart';
import 'api/index.dart';


void main() {
  initApi();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '趣玩Flutter版本',
      theme: ThemeData(
        useMaterial3: true,
        splashFactory: NoSplash.splashFactory, // 全局移除水波纹效果
        highlightColor: Colors.transparent, // 全局移除点击高亮效果
      ),
      home: const TabPage(),
    );
  }
}


