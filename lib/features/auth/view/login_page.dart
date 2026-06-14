import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:interesting_play_flutter/core/theme/app_colors.dart';
import 'package:interesting_play_flutter/features/auth/model/login_state.dart';
import 'package:interesting_play_flutter/features/auth/viewmodel/login_viewmodel.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();

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

  void _submit() {
    ref
        .read(loginViewModelProvider.notifier)
        .login(phoneController.text.trim(), passwordController.text);
  }

  @override
  Widget build(BuildContext context) {
    final loginState = ref.watch(loginViewModelProvider);

    ref.listen<LoginState>(loginViewModelProvider, (previous, next) {
      switch (next) {
        case LoginSuccess():
          context.go('/');
        case LoginError(:final message):
          Fluttertoast.showToast(
            msg: message,
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black,
            textColor: Colors.white,
            fontSize: 16.0,
          );
        case LoginIdle() || LoginLoading():
          break;
      }
    });

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
                const SizedBox(height: 40),
                _form(),
                _action(loginState),
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
      child: Image.asset("lib/assets/logo.png", width: 150, height: 150),
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
          const SizedBox(height: 20),
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

  Widget _action(LoginState loginState) {
    final isLoading = loginState is LoginLoading;
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
          onTap: isLoading ? null : _submit,
          child: Container(
            margin: const EdgeInsets.only(top: 10),
            width: 280,
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
            decoration: BoxDecoration(
              color: AppColors.green_300,
              borderRadius: BorderRadius.circular(6.0),
            ),
            child: isLoading
                ? const SizedBox(
                    width: 22,
                    height: 22,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: Colors.white,
                    ),
                  )
                : const Text(
                    "登录",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
          ),
        ),
      ],
    );
  }
}
