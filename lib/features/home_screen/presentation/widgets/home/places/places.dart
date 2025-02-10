import 'package:flutter/material.dart';

import '../../../../../../core/language/lang_keys.dart';
import '../../../../../../core/style/statics/app_statics.dart';
import '../../../../../../core/style/widgets/app_space.dart';
import '../home_section_header.dart';

class Places extends StatelessWidget {
  const Places({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: AppBorderRadius.mediumRadius,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AppSpace(space: 5),
          HomeSectionHeader(
            title: LangKeys.places,
            onTap: () {},
          ),
          Expanded(
            child: ListView.builder(
              reverse: true,
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