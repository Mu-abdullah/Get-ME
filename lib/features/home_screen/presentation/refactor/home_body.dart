import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getme/core/extextions/extentions.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../../core/routes/routes_name.dart';
import '../../../../core/services/shared_pref/shared_pref.dart';
import '../../../../core/services/shared_pref/pref_keys.dart';
import '../../../../core/style/color/app_color.dart';
import '../../../../core/style/statics/app_statics.dart';
import '../../../../core/style/statics/image_test.dart';
import '../../../../core/style/widgets/app_text.dart';
import '../../../../core/language/lang_keys.dart';
import '../../../../core/style/widgets/custom_app_bar.dart';
import '../../../governorate_screen/presentation/widgets/ai_badge.dart';
import '../cubits/bottom_bar_cubit/bottom_bar_cubit.dart';
import '../widgets/home_bottom_nav_bar.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  bool _isUserLoggedIn = false;

  @override
  void initState() {
    super.initState();
    _checkUserLoginStatus();
  }

  Future<void> _checkUserLoginStatus() async {
    final user =
        await SharedPref.getUserFromPreferences(key: PrefKeys.userModel);
    if (user != null && mounted) {
      setState(() {
        _isUserLoggedIn = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomBarCubit, BottomBarState>(
      builder: (context, state) {
        final cubit = BottomBarCubit.get(context);
        return Scaffold(
          appBar: CustomAppBar(
            translatedTitle: cubit.title[cubit.currentIndex],
            isBack: false,
            actions: _buildActions(context, cubit.currentIndex),
          ),
          bottomNavigationBar: HomeBottomNavigationBar(cubit: cubit),
          body: SafeArea(child: cubit.screens[cubit.currentIndex]),
        );
      },
    );
  }

  List<Widget> _buildActions(BuildContext context, int index) {
    return switch (index) {
      1 => _buildAIActions(),
      2 => _buildProfileActions(context),
      _ => _buildDefaultActions(),
    };
  }

  List<Widget> _buildAIActions() => [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: AIBadge(
            text: LangKeys.poweredByAi,
            borderColor: AppColors.blueAccent,
          ),
        ),
      ];

  List<Widget> _buildProfileActions(BuildContext context) => [
        InkWell(
          borderRadius: AppBorderRadius.largeRadius,
          onTap: () => _isUserLoggedIn
              ? _handleLogout(context)
              : _navigateToLanguageScreen(context),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: _isUserLoggedIn
                ? _buildLogoutButton(context)
                : _buildLanguageSelector(context),
          ),
        ),
      ];

  List<Widget> _buildDefaultActions() => [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Image.asset(
            AppImages.whiteLogo,
            fit: BoxFit.cover,
            width: 100,
          ),
        ),
      ];

  Widget _buildLogoutButton(BuildContext context) => AppText(
        context.translate(LangKeys.logout),
        color: AppColors.red,
      );

  Widget _buildLanguageSelector(BuildContext context) => Row(
        spacing: 5,
        children: [
          AppText(
            context.translate(LangKeys.language),
            color: AppColors.blueAccent,
          ),
          const Icon(
            HugeIcons.strokeRoundedLanguageSquare,
            color: AppColors.blueAccent,
          ),
        ],
      );

  void _handleLogout(BuildContext context) {
    SharedPref.removeData(key: PrefKeys.userModel);
    context.read<BottomBarCubit>().changeIndex(0);
  }

  void _navigateToLanguageScreen(BuildContext context) {
    context.pushNamed(RoutesNames.language);
  }
}
