import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:interesting_play_flutter/core/theme/app_colors.dart';

class ImagePickerPracticePage extends StatefulWidget {
  const ImagePickerPracticePage({super.key});

  @override
  State<ImagePickerPracticePage> createState() =>
      _ImagePickerPracticePageState();
}

class _ImagePickerPracticePageState extends State<ImagePickerPracticePage> {
  final ImagePicker _imagePicker = ImagePicker();

  XFile? _selectedImage;
  String? _errorMessage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.green_300,
        scrolledUnderElevation: 0,
        title: const Text('图片选择'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => _pickImage(ImageSource.gallery),
                    child: const Text('从相册选择'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => _pickImage(ImageSource.camera),
                    child: const Text('拍照选择'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Expanded(child: _buildImagePreview()),
          ],
        ),
      ),
    );
  }

  Widget _buildImagePreview() {
    final errorMessage = _errorMessage;
    if (errorMessage != null) {
      return Center(
        child: Text(
          errorMessage,
          textAlign: TextAlign.center,
          style: const TextStyle(color: AppColors.red_200),
        ),
      );
    }

    final selectedImage = _selectedImage;
    if (selectedImage == null) {
      return const Center(child: Text('请选择或拍摄一张图片'));
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image.file(File(selectedImage.path), fit: BoxFit.contain),
    );
  }

  Future<void> _pickImage(ImageSource source) async {
    try {
      final image = await _imagePicker.pickImage(
        source: source,
        imageQuality: 85,
      );
      if (!mounted || image == null) return;

      setState(() {
        _selectedImage = image;
        _errorMessage = null;
      });
    } catch (error) {
      if (!mounted) return;
      setState(() {
        _errorMessage = '图片选择失败：$error';
      });
    }
  }
}
