import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:getme/core/extextions/extentions.dart';
import 'package:getme/core/style/color/color_light.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../../core/language/lang_keys.dart';
import '../../../../core/style/widgets/app_text.dart';

class BottomItem {
  static List<FlashyTabBarItem> items(BuildContext context) {
    return [
      FlashyTabBarItem(
        icon: Icon(HugeIcons.strokeRoundedHome01),
        title: AppText(context.translate(LangKeys.home)),
        activeColor: ColorsLight.black,
        inactiveColor: ColorsLight.gray,
      ),
      FlashyTabBarItem(
        icon: Icon(HugeIcons.strokeRoundedSearch01),
        title: AppText(context.translate(LangKeys.search)),
        activeColor: ColorsLight.black,
        inactiveColor: ColorsLight.gray,
      ),
      FlashyTabBarItem(
        icon: Icon(HugeIcons.strokeRoundedUser),
        title: AppText(context.translate(LangKeys.account)),
        activeColor: ColorsLight.black,
        inactiveColor: ColorsLight.gray,
      ),
    ];
  }

  static List<Widget> screenItems = [
    Center(
      child: AppText('Home'),
    ),
    Center(
      child: AppText('search'),
    ),
    Center(
      child: AppText('account'),
    ),
  ];
}
