import 'package:flutter/material.dart';

import '../../../../../core/style/statics/app_statics.dart';
import '../../../../../core/style/widgets/custom_shimmer.dart';

class HomeSectionLoading extends StatelessWidget {
  const HomeSectionLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomShimmer(
      child: Container(
        height: 220,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: AppBorderRadius.mediumRadius,
        ),
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          itemBuilder: (_, index) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 250,
              margin: AppPadding.smallPadding,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: AppBorderRadius.mediumRadius,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
