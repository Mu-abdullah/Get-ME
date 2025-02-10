import 'package:flutter/material.dart';
import 'package:getme/core/extextions/extentions.dart';

import '../../../../../core/style/color/color_light.dart';
import '../../../../../core/style/widgets/app_space.dart';
import '../../../../../core/style/widgets/app_text.dart';

class HomeSectionHeader extends StatelessWidget {
  const HomeSectionHeader({
    super.key,
    required this.title,
    required this.onTap,
  });
  final String title;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          Expanded(
            child: AppText(
              context.translate(title),
              isTitle: true,
            ),
          ),
          AppSpace(space: 5),
          InkWell(
            onTap: onTap,
            child: Icon(
              Icons.arrow_forward_ios_outlined,
              color: ColorsLight.black,
              size: 20,
            ),
          ),
        ],
      ),
    );
  }
}
