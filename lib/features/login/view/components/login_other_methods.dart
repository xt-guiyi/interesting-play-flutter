import 'package:flutter/material.dart';

import '../../strategies/vo/login_method.dart';

/// 展示“其他登录方式”入口，通过弹层将选择的渠道回传给页面。
class LoginOtherMethods extends StatefulWidget {
  /// 接收渠道选择回调和页面忙碌状态，不在组件内执行登录。
  const LoginOtherMethods({
    super.key,
    required this.onSelected,
    this.isBusy = false,
  });

  final ValueChanged<LoginMethod> onSelected;
  final bool isBusy;

  /// 创建控制弹层打开和关闭的组件状态。
  @override
  State<LoginOtherMethods> createState() => _LoginOtherMethodsState();
}

/// 管理弹层生命周期，避免重复打开和关闭过程中重复选择。
class _LoginOtherMethodsState extends State<LoginOtherMethods> {
  bool _isOpen = false;

  /// 打开渠道选择弹层，完全关闭后再通知页面启动授权。
  Future<void> _showMethods() async {
    // 当前忙碌或弹层已打开时忽略点击。
    if (_isOpen || widget.isBusy) return;
    _isOpen = true;
    try {
      bool selected = false;
      /// 只接受一次选择，并通过弹层的返回值传出登录渠道。
      void choose(BuildContext context, LoginMethod method) {
        if (selected) return;
        selected = true;
        Navigator.of(context).pop(method);
      }

      // 构建 Google 和 GitHub 选项；点击只关闭弹层，不立即授权。
      final route = ModalBottomSheetRoute<LoginMethod>(
        isScrollControlled: true,
        useSafeArea: true,
        showDragHandle: true,
        backgroundColor: Colors.white,
        constraints: BoxConstraints(
          maxWidth: 420,
          maxHeight: MediaQuery.sizeOf(context).height * 0.72,
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
        ),
        builder: (context) => _LoginMethodsSheet(
          methods: [
            _LoginMethod(
              label: 'Google',
              asset: 'lib/assets/google.png',
              onTap: () => choose(context, LoginMethod.google),
            ),
            _LoginMethod(
              label: 'GitHub',
              asset: 'lib/assets/github.png',
              logoSize: 44,
              onTap: () => choose(context, LoginMethod.github),
            ),
          ],
        ),
      );
      // 等退出动画及弹层移除完成，再启动系统授权界面。
      final method = await Navigator.of(context).push(route);
      await route.completed;
      if (!mounted || widget.isBusy || method == null) return;
      widget.onSelected(method);
    } finally {
      // 选择或取消后都解除打开标记，允许下次打开弹层。
      _isOpen = false;
    }
  }

  /// 构建文字加箭头入口，登录期间显示进度并禁用点击。
  @override
  Widget build(BuildContext context) => Center(
    child: Semantics(
      button: true,
      enabled: !widget.isBusy,
      child: GestureDetector(
        onTap: widget.isBusy ? null : _showMethods,
        behavior: HitTestBehavior.opaque,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                '其他登录方式',
                style: TextStyle(fontSize: 14, color: Color(0xFF717781)),
              ),
              const SizedBox(width: 4),
              SizedBox.square(
                dimension: 20,
                child: widget.isBusy
                    ? const CircularProgressIndicator(strokeWidth: 2)
                    : const Icon(
                        Icons.chevron_right,
                        size: 20,
                        color: Color(0xFF717781),
                      ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

/// 单个渠道选项的展示数据和点击回调，仅供当前弹层使用。
class _LoginMethod {
  /// 定义渠道名称、图标和选中操作。
  const _LoginMethod({
    required this.label,
    required this.asset,
    required this.onTap,
    this.logoSize = 32,
  });

  final String label;
  final String asset;
  final VoidCallback onTap;
  final double logoSize;
}

/// 展示渠道图标列表，选项较多时自动换行并允许滚动。
class _LoginMethodsSheet extends StatelessWidget {
  /// 使用入口提供的渠道选项构建弹层内容。
  const _LoginMethodsSheet({required this.methods});

  final List<_LoginMethod> methods;

  /// 在安全区域内排列渠道选项。
  @override
  Widget build(BuildContext context) => SafeArea(
    top: false,
    child: SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(24, 16, 24, 32),
      child: SizedBox(
        width: double.infinity,
        child: Wrap(
          alignment: WrapAlignment.center,
          spacing: 24,
          runSpacing: 20,
          children: methods.map(_method).toList(),
        ),
      ),
    ),
  );

  /// 构建带图标、名称及无障碍描述的单个登录选项。
  Widget _method(_LoginMethod method) => Semantics(
    button: true,
    label: '${method.label} 登录',
    onTap: method.onTap,
    excludeSemantics: true,
    child: Tooltip(
      message: '${method.label} 登录',
      child: InkWell(
        onTap: method.onTap,
        borderRadius: BorderRadius.circular(8),
        child: SizedBox(
          width: 96,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 68,
                  height: 68,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    border: Border.all(color: const Color(0xFFE8EBEF)),
                  ),
                  alignment: Alignment.center,
                  child: Image.asset(
                    method.asset,
                    width: method.logoSize,
                    height: method.logoSize,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  method.label,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 13,
                    height: 1.4,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF545B65),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
