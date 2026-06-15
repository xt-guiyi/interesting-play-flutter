/// 消息项
class MessageItem {
  const MessageItem({
    required this.type,
    required this.text,
    this.isUser = false,
    this.imagePath,
  });
  final int type;
  final String text;
  // true = 用户消息（右侧），false = AI 消息（左侧）
  final bool isUser;
  // type == 4 时存放图片本地路径
  final String? imagePath;
}
