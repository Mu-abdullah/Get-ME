import 'package:flutter/material.dart';
import 'package:getme/core/extextions/extentions.dart';
import 'package:getme/core/routes/routes_name.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../core/language/lang_keys.dart';
import 'model/account_button_model.dart';

class AccountListview {
  static List<AccountButtonModel> accountList(BuildContext context) {
    return [
      AccountButtonModel(
        icon: HugeIcons.strokeRoundedNotebook02,
        title: LangKeys.policy,
        onTap: () {
          context.pushNamed(RoutesNames.policyScreen);
        },
      ),
    ];
  }
}
