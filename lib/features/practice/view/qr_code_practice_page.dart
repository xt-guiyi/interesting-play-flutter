import 'package:flutter/material.dart';
import 'package:interesting_play_flutter/core/theme/app_colors.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrCodePracticePage extends StatefulWidget {
  const QrCodePracticePage({super.key});

  @override
  State<QrCodePracticePage> createState() => _QrCodePracticePageState();
}

class _QrCodePracticePageState extends State<QrCodePracticePage> {
  final _controller = TextEditingController(text: 'https://flutter.dev');

  String _qrText = 'https://flutter.dev';

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
        title: const Text('生成二维码'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: '二维码内容',
              ),
            ),
            const SizedBox(height: 12),
            ElevatedButton(onPressed: _generate, child: const Text('生成')),
            const SizedBox(height: 24),
            Center(
              child: QrImageView(
                data: _qrText,
                version: QrVersions.auto,
                size: 220,
                backgroundColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _generate() {
    final text = _controller.text.trim();
    if (text.isEmpty) return;
    setState(() {
      _qrText = text;
    });
  }
}
