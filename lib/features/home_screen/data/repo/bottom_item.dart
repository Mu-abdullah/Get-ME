import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:getme/core/extextions/extentions.dart';
import 'package:getme/core/style/color/app_color.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../../core/language/lang_keys.dart';
import '../../../../core/style/widgets/app_text.dart';
import '../../../account_screen/presentation/views/account_screen.dart';
import '../../../ai/presentation/views/ai_screen.dart';
import '../../presentation/refactor/home_body.dart';

class BottomItem {
  static List<FlashyTabBarItem> items(BuildContext context) {
    return [
      FlashyTabBarItem(
        icon: Icon(HugeIcons.strokeRoundedHome01),
        title: AppText(context.translate(LangKeys.home)),
        activeColor: AppColors.black,
        inactiveColor: AppColors.grey,
      ),
      FlashyTabBarItem(
        icon: Icon(HugeIcons.strokeRoundedRobot01),
        title: AppText(context.translate(LangKeys.rahaali)),
        activeColor: AppColors.black,
        inactiveColor: AppColors.grey,
      ),
      FlashyTabBarItem(
        icon: Icon(HugeIcons.strokeRoundedUser),
        title: AppText(context.translate(LangKeys.account)),
        activeColor: AppColors.black,
        inactiveColor: AppColors.grey,
      ),
    ];
  }

  static List<Widget> screenItems = [
    HomeBody(),
    AiScreen(),
    AccountScreen(),
  ];

  static List<String> titles = [
    LangKeys.home,
    LangKeys.rahaali,
    LangKeys.account,
  ];
}
