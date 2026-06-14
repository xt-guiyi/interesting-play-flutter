import 'package:flutter/material.dart';
import 'package:interesting_play_flutter/core/theme/app_colors.dart';
import 'package:share_plus/share_plus.dart';

class SharePracticePage extends StatefulWidget {
  const SharePracticePage({super.key});

  @override
  State<SharePracticePage> createState() => _SharePracticePageState();
}

class _SharePracticePageState extends State<SharePracticePage> {
  final _controller = TextEditingController(text: '这是一段来自 Practice 的分享文本');

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.green_300,
        scrolledUnderElevation: 0,
        title: const Text('分享'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _controller,
              minLines: 3,
              maxLines: 5,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: '分享内容',
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(onPressed: _shareText, child: const Text('调起系统分享')),
          ],
        ),
      ),
    );
  }

  Future<void> _shareText() async {
    final text = _controller.text.trim();
    if (text.isEmpty) return;
    await SharePlus.instance.share(ShareParams(text: text));
  }
}
