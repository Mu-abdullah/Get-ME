import 'package:flutter/material.dart';
import 'package:getme/core/extextions/extentions.dart';

import '../../../../core/language/lang_keys.dart';
import '../../../../core/style/statics/image_test.dart';
import '../../../../core/style/widgets/app_space.dart';
import '../../../../core/style/widgets/app_text.dart';

class AuthImage extends StatelessWidget {
  const AuthImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            spacing: 20,
            children: [
              AppSpace(
                space: 10,
              ),
              Image.asset(AppImages.whiteLogo),
              AppText(
                context.translate(LangKeys.travelQuote),
                isTitle: true,
                maxLines: 5,
                textAlign: TextAlign.start,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              AppSpace(
                space: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
