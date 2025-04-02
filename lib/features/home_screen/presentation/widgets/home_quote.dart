import 'package:flutter/material.dart';
import 'package:getme/core/extextions/extentions.dart';

import '../../../../core/language/lang_keys.dart';
import '../../../../core/style/color/app_color.dart';
import '../../../../core/style/statics/app_statics.dart';
import '../../../../core/style/widgets/app_text.dart';

class HomeQuote extends StatelessWidget {
  const HomeQuote({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: AppBorderRadius.mediumRadius,
      ),
      padding: AppPadding.smallPadding,
      margin: AppPadding.smallPadding,
      child: Row(
        children: [
          Expanded(
            child: AppText(
              context.translate(LangKeys.travelQuote),
              maxLines: 3,
              color: AppColors.black.withValues(alpha: 0.5),
            ),
          )
        ],
      ),
    );
  }
}
