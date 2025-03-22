import 'package:flutter/material.dart';
import 'package:getme/core/extextions/extentions.dart';

import '../../../../core/language/lang_keys.dart';
import '../../../../core/style/statics/app_statics.dart';
import '../../../../core/style/widgets/app_text.dart';
import '../../../../core/style/widgets/custom_shimmer.dart';

class LoadingCityPlaces extends StatelessWidget {
  const LoadingCityPlaces({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 4 / 5,
      ),
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return CustomShimmer(
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: AppBorderRadius.mediumRadius,
                  ),
                  child: Center(
                    child: Stack(
                      children: [
                        RotationTransition(
                          turns: const AlwaysStoppedAnimation(10 / 360),
                          child: Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: AppBorderRadius.mediumRadius,
                              // Optional: Remove image for pure placeholder
                              // image: DecorationImage(
                              //   image: NetworkImage(ImageTest.bloger),
                              //   fit: BoxFit.cover,
                              // ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                AppText(
                  context.translate(LangKeys.loading),
                  color: Colors.black,
                  fontSize: 16,
                ),
              ],
            ),
          );
        },
        childCount: 20,
      ),
    );
  }
}
