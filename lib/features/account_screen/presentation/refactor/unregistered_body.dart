import 'package:flutter/material.dart';
import 'package:getme/core/extextions/extentions.dart';

import '../../../../core/language/lang_keys.dart';
import '../../../../core/routes/routes_name.dart';
import '../../../../core/style/widgets/app_button.dart';
import '../../../../core/style/widgets/app_text.dart';

class UnregisteredBody extends StatelessWidget {
  const UnregisteredBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        spacing: 20,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppText(
            textAlign: TextAlign.center,
            context.translate(LangKeys.welcemeUser),
            isTitle: true,
          ),
          AppText(
            textAlign: TextAlign.center,
            context.translate(LangKeys.shouldBeLogin),
            isTitle: true,
          ),
          AppButton(
              onTap: () {
                context.pushNamed(RoutesNames.authScreen);
              },
              text: LangKeys.login),
        ],
      ),
    );
  }
}
