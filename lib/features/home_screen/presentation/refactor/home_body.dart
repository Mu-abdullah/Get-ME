import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getme/core/extextions/extentions.dart';

import '../../../../core/style/color/app_color.dart';
import '../../../../core/style/statics/app_statics.dart';
import '../../../../core/style/statics/image_test.dart';
import '../../../../core/style/widgets/app_text.dart';
import '../../../../core/app/language/language_cubit/language_cubit.dart';
import '../../../../core/language/lang_keys.dart';
import '../../../../core/services/shared_pref/pref_keys.dart';
import '../../../../core/services/shared_pref/shared_pref.dart';
import '../../../../core/style/widgets/custom_app_bar.dart';
import '../../../governorate_screen/presentation/widgets/ai_badge.dart';
import '../cubits/bottom_bar_cubit/bottom_bar_cubit.dart';
import '../widgets/choose_language_bottom_sheet.dart';
import '../widgets/home_bottom_nav_bar.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  @override
  void initState() {
    super.initState();
    _checkFirstTime();
  }

  Future<void> _checkFirstTime() async {
    if (SharedPref.getData(key: PrefKeys.languageFirstTime) == null) {
      WidgetsBinding.instance
          .addPostFrameCallback((_) => _showLanguageBottomSheet());
    }
  }

  Future<void> _showLanguageBottomSheet() async {
    final languageCubit = context.read<LanguageCubit>();
    await showModalBottomSheet(
      context: context,
      isDismissible: false,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (bottomSheetContext) => LanguageBottomSheet(languageCubit),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomBarCubit, BottomBarState>(
      builder: (context, state) {
        var cubit = BottomBarCubit.get(context);
        return Scaffold(
          appBar: CustomAppBar(
            translatedTitle: cubit.title[cubit.currentIndex],
            isBack: false,
            actions: actions(cubit.currentIndex),
          ),
          bottomNavigationBar: HomeBottomNavigationBar(cubit: cubit),
          body: SafeArea(child: cubit.screens[cubit.currentIndex]),
        );
      },
    );
  }

  List<Widget> actions(index) {
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
            padding: const EdgeInsets.symmetric(horizontal: 8),
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
