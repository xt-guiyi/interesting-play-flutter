import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:interesting_play_flutter/core/theme/app_colors.dart';
import 'package:path_provider/path_provider.dart';

class DownloadPracticePage extends StatefulWidget {
  const DownloadPracticePage({super.key});

  @override
  State<DownloadPracticePage> createState() => _DownloadPracticePageState();
}

class _DownloadPracticePageState extends State<DownloadPracticePage> {
  static const _downloadUrl = 'https://picsum.photos/1200/800';

  final Dio _dio = Dio();

  double _progress = 0;
  String? _filePath;
  String? _message;
  bool _isDownloading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.green_300,
        scrolledUnderElevation: 0,
        title: const Text('下载进度'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: _isDownloading ? null : _downloadFile,
              child: Text(_isDownloading ? '下载中...' : '开始下载示例图片'),
            ),
            const SizedBox(height: 16),
            LinearProgressIndicator(value: _progress),
            const SizedBox(height: 8),
            Text('${(_progress * 100).toStringAsFixed(0)}%'),
            if (_message != null) ...[
              const SizedBox(height: 16),
              Text(_message!),
            ],
            if (_filePath != null) ...[
              const SizedBox(height: 8),
              SelectableText('保存路径：$_filePath'),
              const SizedBox(height: 16),
              Expanded(
                child: Image.file(File(_filePath!), fit: BoxFit.contain),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Future<void> _downloadFile() async {
    setState(() {
      _isDownloading = true;
      _progress = 0;
      _filePath = null;
      _message = null;
    });

    try {
      final dir = await getTemporaryDirectory();
      final savePath =
          '${dir.path}/practice_download_${DateTime.now().millisecondsSinceEpoch}.jpg';
      await _dio.download(
        _downloadUrl,
        savePath,
        onReceiveProgress: (received, total) {
          if (total <= 0 || !mounted) return;
          setState(() {
            _progress = received / total;
          });
        },
      );
      if (!mounted) return;
      setState(() {
        _progress = 1;
        _filePath = savePath;
        _message = '下载完成';
      });
    } catch (error) {
      if (!mounted) return;
      setState(() {
        _message = '下载失败：$error';
      });
    } finally {
      if (mounted) {
        setState(() {
          _isDownloading = false;
        });
      }
    }
  }
}
