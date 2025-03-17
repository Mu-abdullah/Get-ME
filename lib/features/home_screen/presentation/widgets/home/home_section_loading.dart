import 'package:flutter/material.dart';

import '../../../../../core/style/statics/app_statics.dart';
import '../../../../../core/style/widgets/app_space.dart';
import '../../../../../core/style/widgets/custom_shimmer.dart';
import 'home_section_header.dart';

class HomeSectionLoading extends StatelessWidget {
  const HomeSectionLoading({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: AppBorderRadius.mediumRadius,
      ),
      child: CustomShimmer(
        child: Column(
          children: [
            const AppSpace(space: 5),
            HomeSectionHeader(
              title: title,
              onTap: () {},
            ),
            Expanded(
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
          ],
        ),
      ),
    );
  }
}
