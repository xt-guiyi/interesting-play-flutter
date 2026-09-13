import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

/// 统一错误提示，全局限频，避免并发请求失败时连续弹出。
abstract final class AppToast {
  static const _interval = Duration(seconds: 2);
  static final _clock = Stopwatch()..start();
  static Duration? _lastShownAt;
  static bool _isShowing = false;

  static Future<void> showError(String message) async {
    final text = message.trim();
    final now = _clock.elapsed;
    final lastShownAt = _lastShownAt;
    if (text.isEmpty ||
        _isShowing ||
        (lastShownAt != null && now - lastShownAt < _interval)) {
      return;
    }

    // 在异步调用前占用窗口，后续提示直接丢弃，不排队。
    _lastShownAt = now;
    _isShowing = true;
    try {
      await Fluttertoast.cancel();
      await Fluttertoast.showToast(
        msg: text,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 16,
      );
    } catch (error) {
      // 提示失败不应打断原有的网络异常或页面状态处理。
      debugPrint('Toast 显示失败: $error');
    } finally {
      _isShowing = false;
    }
  }
}
