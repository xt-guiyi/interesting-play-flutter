import 'package:intl/intl.dart';

class TimeUtil {
  /// 格式化当前日期
  static String getCurrentFormattedDate(
      {int? timestamp, String pattern = "yyyy-MM-dd HH:mm:ss"}) {
    final date = timestamp != null
        ? DateTime.fromMillisecondsSinceEpoch(timestamp)
        : DateTime.now();
    final dateFormat = DateFormat(pattern);
    return dateFormat.format(date);
  }

  /// 时间格式化 (02:00、01:01:00)
  static String getDurationTime(int milliseconds) {
    final duration = Duration(milliseconds: milliseconds);
    final hours = duration.inHours;
    final minutes = duration.inMinutes % 60;
    final seconds = duration.inSeconds % 60;

    return hours > 0
        ? "${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}"
        : "${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}";
  }

  /// 时间格式化 (刚刚、几秒前、几分钟前、几小时前、几天前)
  static String getTimeAgo(int timestamp) {
    final currentTime = DateTime.now().millisecondsSinceEpoch;
    final diff = Duration(milliseconds: currentTime - timestamp);

    // 获取当前年份和时间戳年份
    final currentYear = DateTime.now().year;
    final timestampYear = DateTime.fromMillisecondsSinceEpoch(timestamp).year;

    if (diff < const Duration(seconds: 1)) {
      return "刚刚";
    } else if (diff < const Duration(minutes: 1)) {
      return "${diff.inSeconds}秒前";
    } else if (diff < const Duration(hours: 1)) {
      return "${diff.inMinutes}分钟前";
    } else if (diff < const Duration(days: 1)) {
      return "${diff.inHours}小时前";
    } else if (diff < const Duration(days: 2)) {
      final yesterday = DateTime.fromMillisecondsSinceEpoch(timestamp);
      return "昨天 ${yesterday.hour.toString().padLeft(2, '0')}:${yesterday.minute.toString().padLeft(2, '0')}";
    } else if (diff < const Duration(days: 3)) {
      final dayBeforeYesterday = DateTime.fromMillisecondsSinceEpoch(timestamp);
      return "前天 ${dayBeforeYesterday.hour.toString().padLeft(2, '0')}:${dayBeforeYesterday.minute.toString().padLeft(2, '0')}";
    } else if (diff < const Duration(days: 4)) {
      return "${diff.inDays}天前";
    } else if (timestampYear == currentYear) {
      // 如果是当前年，返回月份和日期
      final date = DateTime.fromMillisecondsSinceEpoch(timestamp);
      return "${date.month}月${date.day}号";
    } else {
      final yearsAgo = currentYear - timestampYear;
      return "$yearsAgo年前";
    }
  }
}
