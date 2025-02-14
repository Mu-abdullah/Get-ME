import 'package:flutter/material.dart';

import '../../../../core/style/color/color_light.dart';
import '../../../../core/style/widgets/app_text.dart';
import '../../data/model/plicy_model.dart';

class PlicyItem extends StatelessWidget {
  const PlicyItem({
    super.key,
    required this.policy,
    required this.index,
  });
  final PolicyModel policy;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
          "${index + 1}. ${policy.title!}:",
          maxLines: 5,
          color: ColorsLight.black,
          isTitle: true,
        ),
        policy.subTitle == null
            ? SizedBox()
            : AppText(
                policy.subTitle ?? "",
                maxLines: 5,
                color: ColorsLight.black.withValues(alpha: 0.8),
              ),
        Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: AppText(
            policy.body!,
            color: ColorsLight.black.withValues(alpha: 0.6),
            maxLines: 10,
            height: 2,
          ),
        )
      ],
    );
  }
}
