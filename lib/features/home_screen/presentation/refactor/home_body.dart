import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getme/core/extextions/extentions.dart';

import '../../../../core/style/color/app_color.dart';
import '../../../../core/style/statics/app_statics.dart';
import '../../../../core/style/statics/image_test.dart';
import '../../../../core/style/widgets/app_text.dart';
import '../../../../core/language/lang_keys.dart';
import '../../../../core/style/widgets/custom_app_bar.dart';
import '../../../governorate_screen/presentation/widgets/ai_badge.dart';
import '../cubits/bottom_bar_cubit/bottom_bar_cubit.dart';
import '../widgets/home_bottom_nav_bar.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomBarCubit, BottomBarState>(
      builder: (context, state) {
        var cubit = BottomBarCubit.get(context);
        return Scaffold(
          appBar: CustomAppBar(
            translatedTitle: cubit.title[cubit.currentIndex],
            isBack: false,
            actions: actions( context,cubit.currentIndex),
          ),
          bottomNavigationBar: HomeBottomNavigationBar(cubit: cubit),
          body: SafeArea(child: cubit.screens[cubit.currentIndex]),
        );
      },
    );
  }

  List<Widget> actions(BuildContext context ,index) {
    if (index == 1) {
      return [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: AIBadge(
            text: LangKeys.poweredByAi,
            borderColor: AppColors.blueAccent,
          ),
        ),
      ];
    } else if (index == 2) {
      return [
        InkWell(
          borderRadius: AppBorderRadius.largeRadius,
          onTap: () {},
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: AppText(context.translate(LangKeys.logout),
                color: AppColors.red),
          ),
        ),
      ];
    }
    return [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Image.asset(
          AppImages.whiteLogo,
          fit: BoxFit.cover,
          width: 100,
        ),
      ),
    ];
  }
}
