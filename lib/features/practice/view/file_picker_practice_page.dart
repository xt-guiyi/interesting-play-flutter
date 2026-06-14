import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:interesting_play_flutter/core/theme/app_colors.dart';

class FilePickerPracticePage extends StatefulWidget {
  const FilePickerPracticePage({super.key});

  @override
  State<FilePickerPracticePage> createState() => _FilePickerPracticePageState();
}

class _FilePickerPracticePageState extends State<FilePickerPracticePage> {
  PlatformFile? _file;
  String? _message;

  @override
  Widget build(BuildContext context) {
    final file = _file;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.green_300,
        scrolledUnderElevation: 0,
        title: const Text('文件选择'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(onPressed: _pickFile, child: const Text('选择文件')),
            const SizedBox(height: 16),
            if (_message != null) Text(_message!),
            if (file != null) ...[
              Text('文件名：${file.name}'),
              Text('大小：${file.size} bytes'),
              Text('路径：${file.path ?? '-'}'),
              Text('扩展名：${file.extension ?? '-'}'),
            ],
          ],
        ),
      ),
    );
  }

  Future<void> _pickFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (!mounted) return;
    setState(() {
      _file = result?.files.single;
      _message = result == null ? '已取消选择' : '选择成功';
    });
  }
}
