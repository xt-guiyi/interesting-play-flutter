/*
 * @Author: xt 1661219752@qq.com
 * @Date: 2024-09-11 18:34:20
 * @LastEditors: xt 1661219752@qq.com
 * @LastEditTime: 2024-09-12 09:52:19
 * @Description: 聊天页
 */
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:interesting_play_flutter/core/theme/app_colors.dart';
import 'package:interesting_play_flutter/features/practice/chat/viewmodel/chat_viewmodel.dart';

import 'components/chat_item_1.dart';
import 'components/chat_item_2.dart';
import 'components/chat_item_3.dart';
import 'components/chat_item_4.dart';

enum Side { left, right }

enum ChatType { text, textAndTable }

// MorePanel 高度（不含安全区）
const _morePanelHeight = 260.0;
// 输入框高度
const _inputBarHeight = 62.0;

class ChatPage extends ConsumerStatefulWidget {
  const ChatPage({super.key});

  @override
  ConsumerState<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends ConsumerState<ChatPage> {
  final _controller = TextEditingController();
  final _scrollController = ScrollController();
  final _focusNode = FocusNode();
  final _imagePicker = ImagePicker();

  /// 是否展示 MorePanel
  bool _showMorePanel = false;

  @override
  void initState() {
    super.initState();
    // 文本框获焦时自动隐藏 MorePanel
    _focusNode.addListener(() {
      if (_focusNode.hasFocus && _showMorePanel) {
        setState(() => _showMorePanel = false);
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _scrollController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  // ── 发送文本 ──────────────────────────────────────────────────────────────

  void _send() {
    final text = _controller.text.trim();
    if (text.isEmpty) return;
    _controller.clear();
    ref.read(chatViewModelProvider.notifier).send(text);
    _scrollToBottom();
  }

  // ── 切换 MorePanel ────────────────────────────────────────────────────────

  void _toggleMorePanel() {
    if (_showMorePanel) {
      setState(() => _showMorePanel = false);
    } else {
      _focusNode.unfocus(); // 先收起键盘
      // 等键盘收起动画结束后再展示面板，防止跳动
      Future.delayed(const Duration(milliseconds: 100), () {
        if (!mounted) return;
        setState(() => _showMorePanel = true);
      });
    }
  }

  // ── 选择图片 ──────────────────────────────────────────────────────────────

  Future<void> _pickImage(ImageSource source) async {
    try {
      final file = await _imagePicker.pickImage(
        source: source,
        imageQuality: 85,
      );
      if (!mounted || file == null) return;
      setState(() => _showMorePanel = false);
      ref.read(chatViewModelProvider.notifier).sendImage(file.path);
      _scrollToBottom();
    } catch (_) {}
  }

  // ── 滚到底部（reverse: true 时 0 即底部）────────────────────────────────

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          0,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  // ── 计算底部 inset ────────────────────────────────────────────────────────

  /// 输入框下方的有效空间高度（键盘 or 面板 or 安全区）
  double _bottomInset(double keyboardHeight, double safeBottom) {
    if (keyboardHeight > 0) return keyboardHeight;
    if (_showMorePanel) return _morePanelHeight + safeBottom;
    return safeBottom;
  }

  // ── Build ─────────────────────────────────────────────────────────────────

  @override
  Widget build(BuildContext context) {
    final messages = ref.watch(chatViewModelProvider).messages;

    final keyboardHeight = MediaQuery.of(context).viewInsets.bottom;
    final safeBottom = MediaQuery.of(context).padding.bottom;
    final bottomInset = _bottomInset(keyboardHeight, safeBottom);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFFF0F2F5),
      appBar: AppBar(
        backgroundColor: AppColors.green_300,
        scrolledUnderElevation: 0,
        title: const Text('小🐑聊天'),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          // ── 消息列表 ─────────────────────────────────────────────────────
          Positioned.fill(
            bottom: _inputBarHeight + bottomInset,
            child: GestureDetector(
              onTap: () {
                _focusNode.unfocus();
                if (_showMorePanel) setState(() => _showMorePanel = false);
              },
              child: messages.isEmpty
                  ? const Center(child: Text('发送消息开始聊天'))
                  : ListView.builder(
                      controller: _scrollController,
                      reverse: true,
                      padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
                      itemCount: messages.length,
                      itemBuilder: (context, index) {
                        final message = messages[messages.length - 1 - index];
                        final side =
                            message.isUser ? Side.right : Side.left;
                        return switch (message.type) {
                          1 => ChatItem1(content: message.text, side: side),
                          2 => ChatItem2(content: message.text, side: side),
                          3 => ChatItem3(content: message.text, side: side),
                          4 => ChatItem4(
                              imagePath: message.imagePath ?? '',
                              side: side,
                            ),
                          _ => const SizedBox.shrink(),
                        };
                      },
                    ),
            ),
          ),

          // ── 输入框（随键盘/面板高度平滑移动）────────────────────────────
          AnimatedPositioned(
            duration: const Duration(milliseconds: 250),
            curve: Curves.easeOut,
            left: 0,
            right: 0,
            bottom: bottomInset,
            height: _inputBarHeight,
            child: _buildInputBar(),
          ),

          // ── MorePanel（从底部滑入）───────────────────────────────────────
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              curve: Curves.easeOut,
              height: _showMorePanel ? _morePanelHeight + safeBottom : 0,
              child: _MorePanel(
                safeBottom: safeBottom,
                onPickGallery: () => _pickImage(ImageSource.gallery),
                onPickCamera: () => _pickImage(ImageSource.camera),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ── 输入框 ────────────────────────────────────────────────────────────────

  Widget _buildInputBar() {
    return Container(
      padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
      decoration: BoxDecoration(
        color: AppColors.green_100,
        border: Border(top: BorderSide(color: Colors.grey.shade200)),
      ),
      child: Row(
        children: [
          // ➕ 按钮
          GestureDetector(
            onTap: _toggleMorePanel,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: _showMorePanel
                    ? AppColors.green_300
                    : Colors.black.withOpacity(0.08),
                shape: BoxShape.circle,
              ),
              child: Icon(
                _showMorePanel ? Icons.close : Icons.add,
                size: 20,
                color: _showMorePanel ? Colors.white : Colors.black54,
              ),
            ),
          ),
          const SizedBox(width: 8),
          // 输入框
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
              decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.circular(8),
              ),
              child: TextField(
                controller: _controller,
                focusNode: _focusNode,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  height: 1,
                ),
                cursorColor: AppColors.green_300,
                textInputAction: TextInputAction.send,
                onSubmitted: (_) => _send(),
                decoration: InputDecoration(
                  hintText: '请输入内容',
                  isCollapsed: true,
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 6,
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          // 发送按钮
          TextButton(
            onPressed: _send,
            style: TextButton.styleFrom(
              backgroundColor: AppColors.green_300,
              padding: EdgeInsets.zero,
              minimumSize: const Size(56, 36),
            ),
            child: const Text(
              '发送',
              style: TextStyle(fontSize: 12, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}

// ── MorePanel ─────────────────────────────────────────────────────────────────

class _MorePanel extends StatelessWidget {
  const _MorePanel({
    required this.safeBottom,
    required this.onPickGallery,
    required this.onPickCamera,
  });

  final double safeBottom;
  final VoidCallback onPickGallery;
  final VoidCallback onPickCamera;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF5F6F7),
      padding: EdgeInsets.only(
        top: 16,
        left: 16,
        right: 16,
        bottom: 16 + safeBottom,
      ),
      child: GridView.count(
        crossAxisCount: 4,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          _PanelItem(
            icon: Icons.photo_library_rounded,
            label: '图片',
            color: const Color(0xFF5AC8FA),
            onTap: onPickGallery,
          ),
          _PanelItem(
            icon: Icons.camera_alt_rounded,
            label: '拍摄',
            color: const Color(0xFF4CD964),
            onTap: onPickCamera,
          ),
          _PanelItem(
            icon: Icons.location_on_rounded,
            label: '位置',
            color: const Color(0xFFFF9500),
            onTap: () {},
          ),
          _PanelItem(
            icon: Icons.folder_rounded,
            label: '文件',
            color: const Color(0xFF5856D6),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

class _PanelItem extends StatelessWidget {
  const _PanelItem({
    required this.icon,
    required this.label,
    required this.color,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(14),
              boxShadow: [
                BoxShadow(
                  color: color.withOpacity(0.35),
                  blurRadius: 8,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Icon(icon, color: Colors.white, size: 28),
          ),
          const SizedBox(height: 6),
          Text(
            label,
            style: const TextStyle(
              fontSize: 12,
              color: Color(0xFF666666),
            ),
          ),
        ],
      ),
    );
  }
}
