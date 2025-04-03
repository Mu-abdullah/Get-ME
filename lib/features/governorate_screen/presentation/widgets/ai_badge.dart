import 'package:flutter/material.dart';
import 'package:getme/core/extextions/extentions.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../../core/language/lang_keys.dart';
import '../../../../core/style/color/app_color.dart';
import '../../../../core/style/widgets/app_text.dart';

class AIBadge extends StatelessWidget {
  const AIBadge({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var aiColor = AppColors.blueAccent;
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.black.withValues(alpha: 0.2)),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              spacing: 5,
              children: [
                AppText(
                  context.translate(LangKeys.createdByAi),
                  color: aiColor,
                ),
                HugeIcon(
                  icon: HugeIcons.strokeRoundedAiMagic,
                  color: aiColor,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
