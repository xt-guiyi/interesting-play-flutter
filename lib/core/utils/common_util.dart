class CommonUtil {
  /// 格式化数字 (10, 1000, 1万, 10万, 100万)
  static String formatNumber(int value) {
    if (value >= 10000) {
      return '${(value / 10000).toStringAsFixed(1)}万';
    } else {
      return value.toString();
    }
  }
}
