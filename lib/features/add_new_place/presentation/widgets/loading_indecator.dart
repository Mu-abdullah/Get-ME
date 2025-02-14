import 'package:flutter/material.dart';
import 'package:getme/core/extextions/extentions.dart';

import '../../../../core/language/lang_keys.dart';
import '../../../../core/style/color/color_light.dart';
import '../../../../core/style/widgets/app_text.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(color: ColorsLight.black),
          const SizedBox(height: 20),
          AppText(context.translate(LangKeys.loading), color: ColorsLight.gray),
        ],
      ),
    );
  }
}