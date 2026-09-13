import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/utils/app_toast.dart';
import '../strategies/vo/login_method.dart';
import '../viewmodel/login_viewmodel.dart';
import 'components/login_agreement.dart';
import 'components/login_other_methods.dart';

/// 登录入口页，展示协议、短信入口及 Google、GitHub 登录方式。
class LoginPage extends ConsumerStatefulWidget {
  /// 创建登录入口页面。
  const LoginPage({super.key});

  /// 创建管理协议勾选和登录导航的页面状态。
  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

/// 管理入口页交互，具体登录请求和结果保存交给 LoginViewModel。
class _LoginPageState extends ConsumerState<LoginPage> {
  bool _acceptedAgreement = false;
  bool _leaving = false;
  bool _openingSmsLogin = false;
  late final LoginViewModel _viewModel;

  /// 保存 ViewModel 引用，供登录操作和页面销毁时取消请求使用。
  @override
  void initState() {
    super.initState();
    _viewModel = ref.read(loginViewModelProvider.notifier);
  }

  /// 页面离开时使尚未完成的登录操作失效。
  @override
  void dispose() {
    _viewModel.cancelLogin();
    super.dispose();
  }

  /// 返回上一页，没有返回栈时进入“我的”，并阻止重复返回。
  void _returnToProfile() {
    if (_leaving || !mounted) return;
    _leaving = true;
    if (context.canPop()) {
      context.pop();
    } else {
      context.go('/profile');
    }
  }

  /// 协议详情的占位回调，正式文档接入前不执行导航。
  void _placeholderAction() {}

  /// 检查协议是否勾选，未同意时提示并阻止后续操作。
  bool _checkAgreement() {
    if (_acceptedAgreement) return true;
    AppToast.showError('请先阅读并同意《用户协议》和《隐私政策》');
    return false;
  }

  /// 处理一键登录点击，目前仅校验协议，运营商登录尚未接入。
  void _onLoginPressed() {
    if (!_checkAgreement()) return;
    // 一键登录后续接入。
  }

  /// 将第三方登录选择交给 ViewModel，登录成功后进入“我的”。
  Future<void> _loginWithMethod(LoginMethod method) async {
    // 页面正在离开或打开短信页时不启动授权；授权前必须同意协议。
    if (_leaving || _openingSmsLogin) return;
    if (!_checkAgreement()) return;
    // 这里只处理第三方渠道；短信登录通过独立页面提交。
    final loggedIn = switch (method) {
      LoginMethod.google => await _viewModel.loginWithGoogle(),
      LoginMethod.github => await _viewModel.loginWithGithub(),
      LoginMethod.sms => false,
    };
    // ViewModel 已完成保存和会话更新后，页面才执行成功导航。
    if (!mounted || !loggedIn) return;
    _leaving = true;
    context.go('/profile');
  }

  /// 打开短信登录页并传递协议勾选状态，避免重复叠加页面。
  Future<void> _openSmsLogin() async {
    if (_openingSmsLogin) return;
    if (!_checkAgreement()) return;
    // 等待短信页返回后解除打开标记，允许用户再次进入。
    _openingSmsLogin = true;
    try {
      await context.push('/login/sms', extra: _acceptedAgreement);
    } finally {
      _openingSmsLogin = false;
    }
  }

  /// 构建登录入口界面，并监听 ViewModel 的错误文案显示 Toast。
  @override
  Widget build(BuildContext context) {
    // 业务错误由 ViewModel 发布，页面只负责展示提示。
    final state = ref.watch(loginViewModelProvider);
    ref.listen(loginViewModelProvider.select((value) => value.errorMessage), (
      previous,
      message,
    ) {
      if (message != null) AppToast.showError(message);
    });
    // 登录期间禁止返回和重复操作，避免授权流程被页面交互打断。
    return PopScope(
      canPop: !state.isBusy,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.transparent,
          scrolledUnderElevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, size: 22),
            tooltip: '返回',
            onPressed: state.isBusy ? null : _returnToProfile,
          ),
        ),
        body: SafeArea(
          top: false,
          child: LayoutBuilder(
            builder: (context, constraints) => SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Center(
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 420),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(28, 24, 28, 32),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            const Spacer(flex: 1),
                            // 品牌头像与欢迎文案。
                            Center(
                              child: Image.asset(
                                'lib/assets/logo.png',
                                width: 150,
                                height: 150,
                              ),
                            ),
                            const SizedBox(height: 20),
                            const Text(
                              '欢迎来到工具合集',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF24282E),
                              ),
                            ),
                            const SizedBox(height: 48),
                            // 一键登录占位与短信登录入口。
                            FilledButton(
                              onPressed: state.isBusy ? null : _onLoginPressed,
                              style: FilledButton.styleFrom(
                                backgroundColor: AppColors.green_300,
                                foregroundColor: Colors.white,
                                minimumSize: const Size.fromHeight(52),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 15,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                textStyle: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              child: const Text(
                                '手机号一键登录',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            const SizedBox(height: 14),
                            OutlinedButton(
                              onPressed: state.isBusy ? null : _openSmsLogin,
                              style: OutlinedButton.styleFrom(
                                foregroundColor: const Color(0xFF343A40),
                                minimumSize: const Size.fromHeight(52),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 15,
                                ),
                                side: const BorderSide(
                                  color: Color(0xFFDFE3E7),
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                textStyle: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              child: const Text(
                                '手机号验证码登录',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            const SizedBox(height: 12),
                            // 本页管理协议勾选；请求期间不允许修改。
                            LoginAgreement(
                              accepted: _acceptedAgreement,
                              onChanged: (value) {
                                if (!state.isBusy) {
                                  setState(() => _acceptedAgreement = value);
                                }
                              },
                              onUserAgreement: _placeholderAction,
                              onPrivacyPolicy: _placeholderAction,
                            ),
                            const SizedBox(height: 48),
                            const Spacer(flex: 2),
                            // 弹层返回渠道后，复用本页第三方登录处理。
                            LoginOtherMethods(
                              isBusy: state.isBusy,
                              onSelected: _loginWithMethod,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
