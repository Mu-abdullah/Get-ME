import 'package:flutter/material.dart';
import 'package:getme/core/extextions/extentions.dart';

import '../../../../core/language/lang_keys.dart';
import '../../../../core/style/widgets/app_text.dart';

class CityPlacesTitle extends StatelessWidget {
  const CityPlacesTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(
          left: 16,
          right: 16,
          bottom: 16,
        ),
        child: AppText(
          context.translate(LangKeys.places),
          isTitle: true,
        ),
      ),
    );
  }
}
