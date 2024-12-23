import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interesting_play_flutter/model/user_info.dart';
import 'package:interesting_play_flutter/pages/chatPage/chat_page.dart';
import 'package:lottie/lottie.dart';

import '../../constants/app.dart';
import '../../constants/app_colors.dart';
import '../../store/index.dart';
import '../../store/userInfoController.dart';
import '../auth/login.dart';

class MePage extends StatefulWidget {
  const MePage({super.key});

  @override
  State<StatefulWidget> createState() => _MePageState();
}

class _MePageState extends State<MePage> with AutomaticKeepAliveClientMixin {
  UserInfo? _userInfo;

  @override
  void initState() {
    super.initState();
    final UserInfoController userInfoController = Get.find<UserInfoController>();
    userInfoController.getUserInfo().then((value) {
      setState(() {
        _userInfo = value;
      });
    });
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      color: AppColors.green_300,
      child: SafeArea(
        child: Column(
          children: [_header(), Expanded(flex: 1, child: _body())],
        ),
      ),
    );
  }

  /// 头部
  Widget _header() {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 344,
          padding: const EdgeInsets.fromLTRB(24, 16, 24, 0),
          decoration: const BoxDecoration(color: AppColors.green_300),
          child: Column(
            children: [
              SizedBox(
                width: 100,
                height: 100,
                child: CircleAvatar(backgroundImage: NetworkImage(_userInfo?.avatar ?? "")),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 2),
                child: Text(
                  _userInfo?.username ?? "-",
                  style: const TextStyle(fontSize: 26, color: Colors.white),
                ),
              ),
              const Text(
                "ip地址：广东",
                style: TextStyle(fontSize: 14, color: Colors.white),
              ),
              Text(
                _userInfo?.introduction ?? "-",
                style: const TextStyle(fontSize: 12, color: Colors.white),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 16,
              ),
              const Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "99",
                          style: TextStyle(fontSize: 22, color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "关注",
                          style: TextStyle(fontSize: 14, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        Text(
                          "26",
                          style: TextStyle(fontSize: 22, color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "动态",
                          style: TextStyle(fontSize: 14, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        Text(
                          "101",
                          style: TextStyle(fontSize: 22, color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "粉丝",
                          style: TextStyle(fontSize: 14, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Positioned(
          bottom: -2,
          left: 0,
          right: 0,
          child:
              Lottie.asset('lib/assets/lottie/wave.json', width: double.infinity, repeat: true, fit: BoxFit.fitWidth),
        )
      ],
    );
  }

  /// 内容
  Widget _body() {
    final itemWidth = (MediaQuery.sizeOf(context).width - 24) / 4;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(12, 16, 12, 0),
      decoration: const BoxDecoration(color: Colors.white),
      child: Wrap(
        direction: Axis.horizontal,
        alignment: WrapAlignment.start,
        runAlignment: WrapAlignment.start,
        spacing: 0,
        runSpacing: 16,
        crossAxisAlignment: WrapCrossAlignment.start,
        children: [
          SizedBox(
            width: itemWidth,
            child: GestureDetector(
              onTap: () {
                // _showDialog(context);
                _showCustomDialog(context);
              },
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.inbox,
                    size: 24,
                  ),
                  Text("弹框")
                ],
              ),
            ),
          ),
          SizedBox(
            width: itemWidth,
            child: GestureDetector(
              onTap: () {
                // _showDialog(context);
                _showBottomSheet(context);
              },
              child: const Column(
                children: [
                  Icon(
                    Icons.check_box_outline_blank,
                    size: 24,
                  ),
                  Text("底部弹框")
                ],
              ),
            ),
          ),
          SizedBox(
            width: itemWidth,
            child: GestureDetector(
              onTap: () {
                _selectTime(context);
              },
              child: const Column(
                children: [
                  Icon(
                    Icons.schedule,
                    size: 24,
                  ),
                  Text("时间选择器")
                ],
              ),
            ),
          ),
          SizedBox(
            width: itemWidth,
            child: const Column(
              children: [
                Icon(
                  Icons.scanner,
                  size: 24,
                ),
                Text("扫一扫")
              ],
            ),
          ),
          SizedBox(
            width: itemWidth,
            child: GestureDetector(
              onTap: () {
                _jumpChatPage(context);
              },
              child: const Column(
                children: [
                  Icon(
                    Icons.telegram,
                    size: 24,
                  ),
                  Text("聊天")
                ],
              ),
            ),
          ),
          SizedBox(
            width: itemWidth,
            child: const Column(
              children: [
                Icon(
                  Icons.settings,
                  size: 24,
                ),
                Text("设置")
              ],
            ),
          ),
          SizedBox(
            width: itemWidth,
            child: GestureDetector(
              onTap: () {
                _logOut(context);
              },
              child: const Column(
                children: [
                  Icon(
                    Icons.group,
                    size: 24,
                  ),
                  Text("注销")
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('弹框标题'),
          content: Text('这是弹框的内容。'),
          actions: <Widget>[
            TextButton(
              child: Text('取消'),
              onPressed: () {
                Navigator.of(context).pop(); // 关闭弹框
              },
            ),
            TextButton(
              child: Text('确认'),
              onPressed: () {
                // 处理确认逻辑
                Navigator.of(context).pop(); // 关闭弹框
              },
            ),
          ],
        );
      },
    );
  }

  void _showCustomDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: AppColors.green_100,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0), // 设置圆角
          ),
          child: Container(
            padding: const EdgeInsets.fromLTRB(12, 12, 12, 8),
            // height: 300, // 自定义高度
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const Text(
                  '自定义对话框',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),
                const Text(
                  '这是一个自定义的对话框，你可以在这里放置任何内容。这是一个自定义的对话框，你可以在这里放置任何内容。',
                  style: TextStyle(fontSize: 14),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    TextButton(
                      child: const Text(
                        '取消',
                        style: TextStyle(fontSize: 16, color: AppColors.red_200),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop(); // 关闭对话框
                      },
                    ),
                    TextButton(
                      child: const Text('确认', style: TextStyle(fontSize: 16, color: AppColors.green_300)),
                      onPressed: () {
                        // 处理确认逻辑
                        Navigator.of(context).pop(); // 关闭对话框
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 360,
          color: Colors.white,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('这是一个底部菜单'),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context); // 关闭 Bottom Sheet
                  },
                  child: const Text('关闭'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _selectTime(BuildContext context) {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 300,
          color: Colors.white,
          child: CupertinoDatePicker(
            mode: CupertinoDatePickerMode.dateAndTime,
            use24hFormat: true,
            initialDateTime: DateTime.now(),
            onDateTimeChanged: (DateTime newTime) {
              setState(() {
                // 设置时间
              });
            },
          ),
        );
      },
    );
  }

  void _jumpChatPage(BuildContext context) {
    Navigator.push(
        context,
        CupertinoPageRoute(
            builder: (context) => const ChatPage(), settings: const RouteSettings(), fullscreenDialog: false));
  }

  void _logOut(BuildContext context) {
    asyncPrefs.remove(App.authorization);
    asyncPrefs.remove(App.userInfo);
    Navigator.push(
        context,
        CupertinoPageRoute(
            builder: (context) => const LoginPage(), settings: const RouteSettings(), fullscreenDialog: false));
  }
}
