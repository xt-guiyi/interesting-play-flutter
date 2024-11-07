import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interesting_play_flutter/pages/auth/login.dart';

import '../../store/userInfoController.dart';
import '../tabs/index.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool? _isLogin;

  @override
  void initState() {
    super.initState();
    final UserInfoController userInfoController = Get.find<UserInfoController>();
    userInfoController.getUserInfo().then((userInfo) {
      setState(() {
        _isLogin = userInfo != null;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_isLogin == true) {
      return const TabPage();
    } else if (_isLogin == false) {
      return const LoginPage();
    } else {
      return const Scaffold();
    }
  }
}
