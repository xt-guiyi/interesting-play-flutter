import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

/// 登录页共用的协议勾选和链接组件，状态及跳转由页面管理。
class LoginAgreement extends StatelessWidget {
  /// 接收勾选状态、变更回调及两个协议链接的点击操作。
  const LoginAgreement({
    super.key,
    required this.accepted,
    required this.onChanged,
    required this.onUserAgreement,
    required this.onPrivacyPolicy,
  });

  final bool accepted;
  final ValueChanged<bool> onChanged;
  final VoidCallback onUserAgreement;
  final VoidCallback onPrivacyPolicy;

  /// 构建协议勾选框和可换行的协议链接。
  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(
      fontSize: 12,
      height: 1.8,
      color: Color(0xFF8A9099),
    );
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 勾选变更交给页面处理，组件不自行保存同意状态。
        SizedBox(
          width: 36,
          height: 44,
          child: Checkbox(
            value: accepted,
            onChanged: (value) => onChanged(value ?? false),
            activeColor: AppColors.green_300,
            side: const BorderSide(color: Color(0xFFC9CED4), width: 1.3),
            shape: const CircleBorder(),
            semanticLabel: '我已阅读并同意用户协议和隐私政策',
          ),
        ),
        // 两种协议分别回调，窄屏通过 Wrap 换行显示。
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 11),
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                const Text('我已阅读并同意', style: textStyle),
                _link('《用户协议》', onUserAgreement),
                const Text('和', style: textStyle),
                _link('《隐私政策》', onPrivacyPolicy),
              ],
            ),
          ),
        ),
      ],
    );
  }

  /// 构建一个带链接语义的协议入口。
  Widget _link(String label, VoidCallback onTap) => Semantics(
    link: true,
    child: InkWell(
      onTap: onTap,
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 12,
          height: 1.8,
          color: Color(0xFF26765C),
        ),
      ),
    ),
  );
}
