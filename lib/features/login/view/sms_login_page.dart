import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/utils/app_toast.dart';
import '../viewmodel/sms_login_viewmodel.dart';
import 'components/login_agreement.dart';

/// 手机号验证码登录页，负责输入、协议、提示和导航交互。
class SmsLoginPage extends ConsumerStatefulWidget {
  /// 创建短信页，可继承登录入口页已经勾选的协议状态。
  const SmsLoginPage({super.key, this.initialAgreement = false});

  final bool initialAgreement;

  /// 创建短信表单和页面交互状态。
  @override
  ConsumerState<SmsLoginPage> createState() => _SmsLoginPageState();
}

/// 管理短信表单控件，验证码发送和登录业务由 SmsLoginViewModel 执行。
class _SmsLoginPageState extends ConsumerState<SmsLoginPage> {
  final _phoneController = TextEditingController();
  final _codeController = TextEditingController();
  final _codeFocus = FocusNode();
  late bool _acceptedAgreement;
  bool _leaving = false;
  late final SmsLoginViewModel _viewModel;

  /// 初始化 ViewModel 引用和传入的协议勾选状态。
  @override
  void initState() {
    super.initState();
    _viewModel = ref.read(smsLoginViewModelProvider.notifier);
    _acceptedAgreement = widget.initialAgreement;
  }

  /// 取消未完成的登录，并释放输入框及焦点资源。
  @override
  void dispose() {
    _viewModel.cancelLogin();
    _phoneController.dispose();
    _codeController.dispose();
    _codeFocus.dispose();
    super.dispose();
  }

  /// 未同意协议时显示提示，阻止发送验证码或登录。
  bool _checkAgreement() {
    if (_acceptedAgreement) return true;
    AppToast.showError('请先阅读并同意《用户协议》和《隐私政策》');
    return false;
  }

  /// 请求发送验证码，成功后将输入焦点移到验证码框。
  Future<void> _sendCode() async {
    if (!_checkAgreement()) return;
    final sent = await ref
        .read(smsLoginViewModelProvider.notifier)
        .sendSmsCode(_phoneController.text.trim());
    if (mounted && sent) _codeFocus.requestFocus();
  }

  /// 提交短信表单，登录成功后结束自动填充并进入“我的”。
  Future<void> _login() async {
    // 先校验协议并收起键盘，手机号和验证码格式由 ViewModel 校验。
    if (_leaving || !_checkAgreement()) return;
    FocusScope.of(context).unfocus();
    // 等待 ViewModel 完成登录请求、本地保存和全局会话更新。
    final loggedIn = await ref
        .read(smsLoginViewModelProvider.notifier)
        .loginWithSms(
          _phoneController.text.trim(),
          _codeController.text.trim(),
        );
    // 仅仍在页面且登录成功时导航，不让系统保存一次性验证码。
    if (!mounted || !loggedIn) return;
    _leaving = true;
    TextInput.finishAutofillContext(shouldSave: false);
    context.go('/profile');
  }

  /// 返回上一页，直接进入短信页且无返回栈时回到登录入口。
  void _back() {
    if (context.canPop()) {
      context.pop();
    } else {
      context.go('/login');
    }
  }

  /// 协议详情占位，正式文档接入前不执行操作。
  void _openAgreement() {}

  /// 构建短信表单，根据请求和倒计时状态更新按钮及提示。
  @override
  Widget build(BuildContext context) {
    // 页面统一展示 ViewModel 发布的校验错误和接口错误。
    final state = ref.watch(smsLoginViewModelProvider);
    ref.listen(
      smsLoginViewModelProvider.select((value) => value.errorMessage),
      (previous, message) {
        if (message != null) AppToast.showError(message);
      },
    );

    // 请求期间禁用返回和表单操作，滚动容器兼容键盘弹出。
    return PopScope(
      canPop: !state.isBusy,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.transparent,
          scrolledUnderElevation: 0,
          leading: IconButton(
            tooltip: '返回',
            onPressed: state.isBusy ? null : _back,
            icon: const Icon(Icons.arrow_back, size: 22),
          ),
        ),
        body: SafeArea(
          top: false,
          child: SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 420),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(24, 12, 24, 32),
                  child: AutofillGroup(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // 头像和标题集中展示，与下方表单保持统一间距。
                        Center(
                          child: Image.asset(
                            'lib/assets/logo.png',
                            width: 72,
                            height: 72,
                          ),
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          '手机号验证码登录',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 23,
                            height: 1.4,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF24282E),
                          ),
                        ),
                        const SizedBox(height: 36),
                        // 手机号只允许数字；修改号码时清空旧验证码。
                        const Text('手机号', style: _labelStyle),
                        const SizedBox(height: 10),
                        TextField(
                          controller: _phoneController,
                          enabled: !state.isBusy,
                          keyboardType: TextInputType.phone,
                          textInputAction: TextInputAction.next,
                          autofillHints: const [
                            AutofillHints.telephoneNumberNational,
                          ],
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(11),
                          ],
                          style: const TextStyle(
                            fontSize: 17,
                            height: 1.4,
                            color: Color(0xFF24282E),
                          ),
                          cursorColor: AppColors.green_300,
                          textAlignVertical: TextAlignVertical.center,
                          onChanged: (_) => _codeController.clear(),
                          onSubmitted: (_) => _codeFocus.requestFocus(),
                          onTapOutside: (_) => FocusScope.of(context).unfocus(),
                          decoration: _decoration('请输入手机号').copyWith(
                            prefixIcon: const SizedBox(
                              width: 80,
                              child: Row(
                                children: [
                                  SizedBox(width: 16),
                                  Text(
                                    '+86',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFF343A40),
                                    ),
                                  ),
                                  SizedBox(width: 12),
                                  SizedBox(
                                    height: 18,
                                    child: VerticalDivider(
                                      width: 1,
                                      thickness: 1,
                                      color: Color(0xFFDDE2E5),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            prefixIconConstraints: const BoxConstraints(
                              minWidth: 80,
                              minHeight: 52,
                            ),
                          ),
                        ),
                        const SizedBox(height: 22),
                        // 验证码支持系统自动填充，发送按钮随倒计时禁用。
                        const Text('短信验证码', style: _labelStyle),
                        const SizedBox(height: 10),
                        TextField(
                          controller: _codeController,
                          focusNode: _codeFocus,
                          enabled: !state.isBusy,
                          keyboardType: TextInputType.number,
                          textInputAction: TextInputAction.done,
                          autofillHints: const [AutofillHints.oneTimeCode],
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(6),
                          ],
                          style: const TextStyle(
                            fontSize: 17,
                            height: 1.4,
                            color: Color(0xFF24282E),
                          ),
                          cursorColor: AppColors.green_300,
                          textAlignVertical: TextAlignVertical.center,
                          onSubmitted: (_) => _login(),
                          onTapOutside: (_) => FocusScope.of(context).unfocus(),
                          decoration: _decoration('6位验证码').copyWith(
                            suffixIconConstraints: const BoxConstraints(
                              minWidth: 112,
                              maxWidth: 112,
                              minHeight: 52,
                            ),
                            suffixIcon: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 4,
                                vertical: 4,
                              ),
                              child: TextButton(
                                onPressed:
                                    state.isBusy || state.resendSeconds > 0
                                    ? null
                                    : _sendCode,
                                style: TextButton.styleFrom(
                                  foregroundColor: const Color(0xFF168461),
                                  disabledForegroundColor: const Color(
                                    0xFF939BA4,
                                  ),
                                  minimumSize: const Size(104, 44),
                                  tapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 4,
                                  ),
                                  textStyle: const TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                ),
                                child: state.isSendingCode
                                    ? const SizedBox.square(
                                        dimension: 18,
                                        child: CircularProgressIndicator(
                                          strokeWidth: 2,
                                        ),
                                      )
                                    : Text(
                                        state.resendSeconds > 0
                                            ? '${state.resendSeconds}s 后重发'
                                            : '获取验证码',
                                        textAlign: TextAlign.center,
                                      ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 28),
                        // 登录按钮展示提交进度，协议勾选在请求期间锁定。
                        FilledButton(
                          onPressed: state.isBusy ? null : _login,
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
                          child: state.isLoggingIn
                              ? const SizedBox.square(
                                  dimension: 22,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                  ),
                                )
                              : const Text('登录'),
                        ),
                        const SizedBox(height: 14),
                        AbsorbPointer(
                          absorbing: state.isBusy,
                          child: LoginAgreement(
                            accepted: _acceptedAgreement,
                            onChanged: (value) =>
                                setState(() => _acceptedAgreement = value),
                            onUserAgreement: _openAgreement,
                            onPrivacyPolicy: _openAgreement,
                          ),
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
    );
  }

  static const _labelStyle = TextStyle(
    fontSize: 13,
    height: 1.4,
    fontWeight: FontWeight.w500,
    color: Color(0xFF555F69),
  );

  /// 统一输入框底色、内边距和焦点边框，使两行表单保持对齐。
  InputDecoration _decoration(String hint) => InputDecoration(
    hintText: hint,
    hintStyle: const TextStyle(fontSize: 16, color: Color(0xFF9AA2AA)),
    filled: true,
    fillColor: const Color(0xFFF5F7F8),
    isDense: true,
    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(color: Color(0xFFEDF0F2)),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(color: AppColors.green_300, width: 1.2),
    ),
    disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(color: Color(0xFFEDF0F2)),
    ),
  );
}
