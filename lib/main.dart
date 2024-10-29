import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:interesting_play_flutter/pages/auth/login.dart';
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
    // 设置状态栏颜色
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // 设置状态栏背景色
      statusBarIconBrightness: Brightness.dark, // 设置状态栏图标颜色为浅色
    ));
    return MaterialApp(
      title: '趣玩Flutter版本',
      theme: ThemeData(
        useMaterial3: true,
        // tabBarTheme: const TabBarTheme(
        //   tabAlignment: TabAlignment.start,
        // ),
        splashFactory: NoSplash.splashFactory, // 全局移除水波纹效果
        highlightColor: Colors.transparent, // 全局移除点击高亮效果
      ),
      // home: const TabPage(),
      home: const LoginPage(),
    );
  }
}
