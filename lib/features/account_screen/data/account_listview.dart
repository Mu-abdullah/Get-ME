import 'package:flutter/material.dart';
import 'package:getme/core/extextions/extentions.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../core/language/lang_keys.dart';
import '../../../core/routes/routes_name.dart';
import 'model/account_button_model.dart';

class AccountListview {
  static List<AccountButtonModel> accountList(BuildContext context) {
    return [
      AccountButtonModel(
        icon: HugeIcons.strokeRoundedImageAdd02,
        title: LangKeys.addNewPlace,
        onTap: () {
          context.pushNamed(RoutesNames.addPlaceScreen);
        },
      ),
      AccountButtonModel(
        icon: HugeIcons.strokeRoundedNotebook02,
        title: LangKeys.policy,
        onTap: () {
          context.pushNamed(RoutesNames.policyScreen);
        },
      ),
      AccountButtonModel(
        icon: HugeIcons.strokeRoundedLanguageSquare,
        title: LangKeys.language,
        onTap: () {
          context.pushNamed(RoutesNames.language);
        },
      ),
    ];
  }
}
