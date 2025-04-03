import 'package:flutter/material.dart';
import 'package:getme/core/extextions/extentions.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../../core/language/lang_keys.dart';
import '../../../../core/style/color/app_color.dart';
import '../../../../core/style/widgets/app_text.dart';

class AIBadge extends StatelessWidget {
  const AIBadge({
    super.key,
    this.text = LangKeys.createdByAi,
    this.color = AppColors.blueAccent,
    this.borderColor = AppColors.black,
  });
  final String text;
  final Color color;
  final Color borderColor;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: borderColor.withValues(alpha: 0.2)),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              spacing: 5,
              children: [
                AppText(
                  context.translate(text),
                  color: color,
                ),
                HugeIcon(
                  icon: HugeIcons.strokeRoundedAiMagic,
                  color: color,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
