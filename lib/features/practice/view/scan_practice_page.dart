import 'package:flutter/material.dart';
import 'package:interesting_play_flutter/core/theme/app_colors.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class ScanPracticePage extends StatefulWidget {
  const ScanPracticePage({super.key});

  @override
  State<ScanPracticePage> createState() => _ScanPracticePageState();
}

class _ScanPracticePageState extends State<ScanPracticePage> {
  final MobileScannerController _controller = MobileScannerController();

  String? _scanResult;

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
        title: const Text('扫一扫'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          AspectRatio(
            aspectRatio: 1,
            child: Stack(
              fit: StackFit.expand,
              children: [
                MobileScanner(controller: _controller, onDetect: _handleDetect),
                DecoratedBox(
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.green_300, width: 3),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    '扫描结果',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 8),
                  SelectableText(
                    _scanResult ?? '请将二维码或条形码放入扫描框内',
                    style: const TextStyle(fontSize: 14),
                  ),
                  const Spacer(),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _scanResult = null;
                      });
                    },
                    child: const Text('清空结果'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _handleDetect(BarcodeCapture capture) {
    final value = capture.barcodes
        .map((barcode) => barcode.rawValue)
        .whereType<String>()
        .where((value) => value.isNotEmpty)
        .firstOrNull;
    if (value == null || value == _scanResult) return;

    setState(() {
      _scanResult = value;
    });
  }
}
