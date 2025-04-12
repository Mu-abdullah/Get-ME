import 'package:flutter/material.dart';

import '../../../../core/style/color/app_color.dart';
import '../../../../core/style/font/fonts_helper.dart';
import '../../../../core/style/statics/app_statics.dart';
import '../../../../core/style/widgets/app_text.dart';
import '../../../../core/style/widgets/custom_shimmer.dart';

class UserPlaceLoading extends StatelessWidget {
  const UserPlaceLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var isArabic = FontsHelper.isArabic(context);
    return CustomShimmer(
        child: ListView.builder(
      itemBuilder: (_, index) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: double.infinity,
          height: 250,
          decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: AppBorderRadius.mediumRadius,
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                )
              ]),
          child: Stack(
            children: [
              Positioned(
                top: 0,
                right: !isArabic ? 15 : null,
                left: !isArabic ? null : 15,
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.darkGrey,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: AppText(
                      '',
                      color: AppColors.darkGrey,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 0,
                right: 0,
                left: 0,
                bottom: 0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: AppText(
                        '',
                        color: AppColors.black,
                        fontSize: 16,
                        isBold: true,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: AppText(
                        '',
                        color: AppColors.black,
                        fontSize: 14,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: AppText(
                        '',
                        color: AppColors.black,
                        fontSize: 14,
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (_, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: 120,
                                decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            );
                          },
                          itemCount: 2),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      itemCount: 2,
    ));
  }
}
