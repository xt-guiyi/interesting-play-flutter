import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:interesting_play_flutter/constants/app_colors.dart';
import 'package:interesting_play_flutter/pages/tabs/index.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    super.initState();
  }

  void _login() {
    Fluttertoast.showToast(
        msg: "登录",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 16.0);

    Navigator.push(
        context,
        CupertinoPageRoute(
            builder: (context) => const TabPage(), settings: const RouteSettings(), fullscreenDialog: false));
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
          child: SingleChildScrollView(child: Column(
            children: [
              _logo(),
              const SizedBox(height: 40,),
              _form(),
              _action()
            ],
          ),),
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
      constraints: BoxConstraints(maxWidth: 400),
      child: Column(
        children: [
          TextField(
            keyboardType: TextInputType.phone,
            style: const TextStyle(
              height: 1,
              textBaseline: TextBaseline.alphabetic,
              fontSize: 16,
            ),
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.account_box),
              hintText: '请输入手机号',
              filled: true,
              fillColor: Colors.grey[200],
              // 设置背景颜色
              // 以下两行可以设置文本居中对齐
              contentPadding: const EdgeInsets.symmetric(vertical: -10, horizontal: -10),
              border:  OutlineInputBorder(borderSide: BorderSide.none,borderRadius: BorderRadius.circular(6.0),),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          TextField(
            keyboardType: TextInputType.text,
            style: const TextStyle(
              height: 1,
              textBaseline: TextBaseline.alphabetic,
              fontSize: 16,
            ),
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.lock),
              hintText: '请输入密码',
              filled: true,
              fillColor: Colors.grey[200],
              // 设置背景颜色
              // 以下两行可以设置文本居中对齐
              contentPadding: const EdgeInsets.symmetric(vertical: -10, horizontal: -10),
              border:  OutlineInputBorder(borderSide: BorderSide.none,borderRadius: BorderRadius.circular(6.0),),
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
            child: Text("去注册?", style: TextStyle(fontSize: 14,color: AppColors.sliver_500),),
          ),
        ),
        GestureDetector(
          onTap: _login,
        child: Container(
          margin: EdgeInsets.only(top: 10),
          width: 280,
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: 0, vertical: 8),
          decoration: BoxDecoration(
              color: AppColors.green_300,
              borderRadius: BorderRadius.circular(6.0)
          ),
          child: Text("登录", style: TextStyle(fontSize: 18,color: Colors.white),),
        ),
      )],
    );
  }
}
