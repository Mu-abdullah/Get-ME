import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../../core/style/color/app_color.dart';
import '../../../../core/style/statics/app_statics.dart';
import '../../../../core/style/widgets/app_text.dart';

class ChatBubble extends StatelessWidget {
  final String message;
  final bool isUser;
  final String time;

  const ChatBubble({
    super.key,
    required this.message,
    required this.isUser,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      spacing: 10,
      children: [
        if (isUser) ...[
          CircleAvatar(
            backgroundColor: AppColors.white,
            child: const Icon(
              HugeIcons.strokeRoundedUser02,
              color: Colors.black,
            ),
          ),
        ],
        Flexible(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            decoration: BoxDecoration(
              color: isUser ? AppColors.blueAccent : Colors.white,
              borderRadius: AppBorderRadius.largeRadius,
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  message,
                  maxLines: 100,
                  color: isUser ? Colors.white : Colors.black,
                ),
                AppText(
                  time,
                  color: isUser ? Colors.white : Colors.black,
                ),
              ],
            ),
          ),
        ),
        if (!isUser) ...[
          CircleAvatar(
            backgroundColor: AppColors.black,
            child: const Icon(
              HugeIcons.strokeRoundedRobot01,
              color: Colors.white,
            ),
          ),
        ],
      ],
    );
  }
}