import 'package:flutter/material.dart';

import 'app_colors.dart';

abstract final class AppTheme {
  static ThemeData get light {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(seedColor: AppColors.green_300), // 设置material 组件色
      splashFactory: NoSplash.splashFactory, //禁用水波纹效果（Ripple Effect）。
      highlightColor: Colors.transparent, // 将点击高亮颜色设置为透明。
    );
  }
}
