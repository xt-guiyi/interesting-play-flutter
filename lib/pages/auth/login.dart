import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:interesting_play_flutter/constants/app_colors.dart';
import 'package:interesting_play_flutter/model/login_model.dart';

import '../../api/request/auth.dart';
import '../../constants/app.dart';
import '../../store/index.dart';
import '../../store/userInfoController.dart';
import '../tabs/index.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final RegExp phoneRegex = RegExp(r'^(1[3-9]\d{9})$');
  late FToast _fToast;
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    phoneController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void _submit() async {
    // 简单的手机号正则表达式（中国大陆）
    if (phoneRegex.hasMatch(phoneController.text)) {
      final loginResult = await _handleLogin();
      if (loginResult) {
        Navigator.pushReplacement(
            context,
            CupertinoPageRoute(
                builder: (context) => const TabPage(), settings: const RouteSettings(), fullscreenDialog: false));
      } else {
        Fluttertoast.showToast(
            msg: "登录失败",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    } else {
      Fluttertoast.showToast(
          msg: "手机号格式错误",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  Future<bool> _handleLogin() async {
    final result = await login(LoginModel(phoneController.text, passwordController.text));
    if (result.code == 200) {
      await asyncPrefs.setString(App.authorization, result.data ?? "");
      await _getUserInfo();
      return true;
    } else {
      return false;
    }
  }

  Future<void> _getUserInfo() async {
    final result = await getUserInfo();
    if (result.code == 200) {
      final UserInfoController userController = Get.find<UserInfoController>();
      userController.setUserInfo(result.data);
    }
  }

  @override
  Widget build(BuildContext context) {
    // 最外层容器必须为Material，或者Scaffold控件， 才能确保子widget应用material样式，不然Text样式是默认的红色
    return Scaffold(
      resizeToAvoidBottomInset: true, // 默认就是true，可以不设置
      body: Container(
        height: double.infinity,
        color: Colors.white,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                _logo(),
                const SizedBox(
                  height: 40,
                ),
                _form(),
                _action()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _logo() {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.only(top: 60),
      child: Image.asset(
        "lib/assets/logo.png",
        width: 150,
        height: 150,
      ),
    );
  }

  Widget _form() {
    return Container(
      width: 260,
      constraints: const BoxConstraints(maxWidth: 400),
      child: Column(
        children: [
          TextField(
            controller: phoneController,
            keyboardType: TextInputType.phone,
            cursorColor: AppColors.green_300, // 直接设置光标颜色
            style: const TextStyle(
              height: 1,
              textBaseline: TextBaseline.alphabetic,
              fontSize: 16,
            ),
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.account_box),
              hintText: '请输入手机号',
              filled: true,
              fillColor: Colors.grey[200],
              // 以下两行可以设置文本居中对齐
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(6.0),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          TextField(
            controller: passwordController,
            keyboardType: TextInputType.text,
            cursorColor: AppColors.green_300, // 直接设置光标颜色
            style: const TextStyle(
              height: 1,
              textBaseline: TextBaseline.alphabetic,
              fontSize: 16,
            ),
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.lock),
              hintText: '请输入密码',
              filled: true,
              fillColor: Colors.grey[200],
              // 设置背景颜色
              // 以下两行可以设置文本居中对齐
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(6.0),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _action() {
    return Column(
      children: [
        GestureDetector(
          child: Container(
            height: 50,
            width: 260,
            alignment: Alignment.centerRight,
            child: const Text(
              "去注册?",
              style: TextStyle(fontSize: 14, color: AppColors.sliver_500),
            ),
          ),
        ),
        GestureDetector(
          onTap: _submit,
          child: Container(
            margin: const EdgeInsets.only(top: 10),
            width: 280,
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
            decoration: BoxDecoration(color: AppColors.green_300, borderRadius: BorderRadius.circular(6.0)),
            child: const Text(
              "登录",
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          ),
        )
      ],
    );
  }
}
