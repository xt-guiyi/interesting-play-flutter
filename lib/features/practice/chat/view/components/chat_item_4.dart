/*
 * @Description: 图片类聊天 item（type: 4）
 */
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:interesting_play_flutter/core/theme/app_colors.dart';

import '../chat_page.dart';

class ChatItem4 extends StatelessWidget {
  const ChatItem4({
    super.key,
    required this.imagePath,
    this.side = Side.right,
  });

  final String imagePath;
  final Side side;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment:
            side == Side.right ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (side == Side.left) ...[
            const CircleAvatar(
              radius: 20,
              backgroundColor: Colors.white,
              backgroundImage: NetworkImage(
                'https://images.cubox.pro/iw3rni/file/2024092617464027713/1.png',
              ),
            ),
            const SizedBox(width: 10),
          ],
          // 图片气泡
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.file(
              File(imagePath),
              width: 180,
              height: 180,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => Container(
                width: 180,
                height: 180,
                color: AppColors.green_200,
                child: const Icon(Icons.broken_image_outlined,
                    color: AppColors.green_300, size: 40),
              ),
            ),
          ),
          if (side == Side.right) ...[
            const SizedBox(width: 10),
            const CircleAvatar(
              radius: 20,
              backgroundColor: Colors.white,
              backgroundImage: NetworkImage(
                'https://images.cubox.pro/iw3rni/file/2024102923062812324/IMG_0794.JPG',
              ),
            ),
          ],
        ],
      ),
    );
  }
}
