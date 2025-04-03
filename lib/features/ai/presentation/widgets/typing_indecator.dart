import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../../core/style/color/app_color.dart';
import 'bouncing_dot.dart';

class TypingIndicator extends StatelessWidget {
  const TypingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        spacing: 10,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                BouncingDot(delay: 0),
                BouncingDot(delay: 200),
                BouncingDot(delay: 400),
              ],
            ),
          ),
          CircleAvatar(
            backgroundColor: AppColors.black,
            child: const Icon(
              HugeIcons.strokeRoundedRobot01,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
