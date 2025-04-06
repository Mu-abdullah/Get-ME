import 'package:flutter/material.dart';

import '../../../../../core/style/statics/app_statics.dart';
import '../../../../../core/style/widgets/app_text.dart';
import '../../../../../core/style/widgets/custom_shimmer.dart';

class CardLoading extends StatelessWidget {
  const CardLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomShimmer(
      child: Padding(
        padding: AppPadding.smallPadding,
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: AppBorderRadius.mediumRadius,
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ]),
          child: Padding(
            padding: AppPadding.mediumPadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                AppText("", isTitle: true),
                AppText(''),
                AppText(''),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
