import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:interesting_play_flutter/core/theme/app_colors.dart';

class ClipboardPracticePage extends StatefulWidget {
  const ClipboardPracticePage({super.key});

  @override
  State<ClipboardPracticePage> createState() => _ClipboardPracticePageState();
}

class _ClipboardPracticePageState extends State<ClipboardPracticePage> {
  final _controller = TextEditingController(text: '复制到剪贴板的文本');

  String _clipboardText = '暂无读取结果';

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
        title: const Text('剪贴板'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: '待复制文本',
              ),
            ),
            const SizedBox(height: 12),
            ElevatedButton(onPressed: _copyText, child: const Text('复制')),
            const SizedBox(height: 12),
            OutlinedButton(onPressed: _readText, child: const Text('读取剪贴板')),
            const SizedBox(height: 16),
            Text('读取结果：$_clipboardText'),
          ],
        ),
      ),
    );
  }

  Future<void> _copyText() async {
    await Clipboard.setData(ClipboardData(text: _controller.text));
    if (!mounted) return;
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('已复制到剪贴板')));
  }

  Future<void> _readText() async {
    final data = await Clipboard.getData(Clipboard.kTextPlain);
    if (!mounted) return;
    setState(() {
      _clipboardText = data?.text?.isNotEmpty == true ? data!.text! : '剪贴板为空';
    });
  }
}
