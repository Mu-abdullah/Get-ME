import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getme/core/extextions/extentions.dart';
import 'package:getme/core/style/widgets/custom_divider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/app/language/language_cubit/language_cubit.dart';
import '../../../../core/language/lang_keys.dart';
import '../../../../core/style/statics/strings_static.dart';
import '../../../../core/style/widgets/app_text.dart';
import '../../../../core/style/widgets/custom_app_bar.dart';
import '../../../../main_app/main_app.dart';
import '../cubits/bottom_bar_cubit/bottom_bar_cubit.dart';
import '../widgets/home_bottom_nav_bar.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({
    super.key,
  });

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
    final prefs = await SharedPreferences.getInstance();
    final isFirstTime = prefs.getBool('isFirstTime') ?? true;

    if (isFirstTime) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _showLanguageDialog(context);
      });
    }
  }

  Future<void> _showLanguageDialog(BuildContext context) async {
    final languageCubit = context.read<LanguageCubit>();

    await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: AppText(
            context.translate(LangKeys.changeLanguage),
            fontSize: 24,
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomDivider(),
              ListTile(
                title: Row(
                  spacing: 10,
                  children: [
                    AppText(
                      '🇬🇧',
                      fontSize: 24,
                      textAlign: TextAlign.center,
                    ),
                    const AppText(
                      StringsStatic.english,
                      fontSize: 16,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                onTap: () async {
                  await languageCubit.changeLanguage('en');
                  if (!context.mounted) return;
                  MainApp.updateAppLocale(context, const Locale('en'));
                  _saveLanguageSelection();
                  Navigator.of(dialogContext).pop();
                },
              ),
              ListTile(
                title: Row(
                  spacing: 10,
                  children: [
                    AppText(
                      '🇸🇦',
                      fontSize: 24,
                      textAlign: TextAlign.center,
                    ),
                    const AppText(
                      StringsStatic.arabic,
                      fontSize: 16,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                onTap: () async {
                  await languageCubit.changeLanguage('ar');
                  if (!context.mounted) return;
                  MainApp.updateAppLocale(context, const Locale('ar'));
                  _saveLanguageSelection();
                  Navigator.of(dialogContext).pop();
                },
              ),
              // Add more languages as needed
            ],
          ),
        );
      },
    );
  }

  Future<void> _saveLanguageSelection() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFirstTime', false);
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
          ),
          bottomNavigationBar: HomeBottomNavigationBar(cubit: cubit),
          body: SafeArea(child: cubit.screens[cubit.currentIndex]),
        );
      },
    );
  }
}
