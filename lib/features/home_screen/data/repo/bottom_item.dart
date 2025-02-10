import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:getme/core/extextions/extentions.dart';
import 'package:getme/core/style/color/color_light.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../../core/language/lang_keys.dart';
import '../../../../core/style/widgets/app_text.dart';
import '../../../account_screen/presentation/views/account_screen.dart';
import '../../presentation/refactor/cities_home_body.dart';

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
    CitiesHomeBody(),
    Center(
      child: AppText('search'),
    ),
    AccountScreen(),
  ];

  static List<String> titles = [
    LangKeys.home,
    LangKeys.search,
    LangKeys.account,
  ];
}
