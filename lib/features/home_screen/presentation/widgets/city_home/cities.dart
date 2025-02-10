import 'package:flutter/material.dart';
import 'package:getme/core/extextions/extentions.dart';

import '../../../../../core/language/lang_keys.dart';
import '../../../../../core/style/color/color_light.dart';
import '../../../../../core/style/statics/app_statics.dart';
import '../../../../../core/style/widgets/app_space.dart';
import '../../../../../core/style/widgets/app_text.dart';

class Cities extends StatelessWidget {
  const Cities({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: AppBorderRadius.mediumRadius,
      ),
      child: Column(
        spacing: 10,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppSpace(space: 5),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                Expanded(
                  child: AppText(
                    context.translate(LangKeys.cities),
                    isTitle: true,
                  ),
                ),
                AppSpace(space: 5),
                Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: ColorsLight.black,
                  size: 20,
                )
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (_, index) => Container(
                width: 250,
                margin: AppPadding.smallPadding,
                padding: AppPadding.smallPadding,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: AppBorderRadius.mediumRadius,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
