import 'package:flutter/material.dart';
import 'package:getme/core/extextions/extentions.dart';

import '../../../../core/app/language/language_cubit/language_cubit.dart';
import '../../../../core/language/lang_keys.dart';
import '../../../../core/services/shared_pref/pref_keys.dart';
import '../../../../core/services/shared_pref/shared_pref.dart';
import '../../../../core/style/statics/strings_static.dart';
import '../../../../core/style/widgets/app_text.dart';
import '../../../../core/style/widgets/custom_divider.dart';
import '../../../../main_app/main_app.dart';

class LanguageBottomSheet extends StatelessWidget {
  final LanguageCubit languageCubit;

  const LanguageBottomSheet(this.languageCubit, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppText(
            context.translate(LangKeys.changeLanguage),
            fontSize: 24,
          ),
          CustomDivider(),
          _buildLanguageOption(
              context, languageCubit, '🇬🇧', StringsStatic.english, 'en'),
          _buildLanguageOption(
              context, languageCubit, '🇸🇦', StringsStatic.arabic, 'ar'),
        ],
      ),
    );
  }

  Widget _buildLanguageOption(
    BuildContext context,
    LanguageCubit cubit,
    String flag,
    String language,
    String code,
  ) {
    return ListTile(
      title: Row(
        children: [
          AppText(flag, fontSize: 24, textAlign: TextAlign.center),
          const SizedBox(width: 10),
          AppText(language, fontSize: 16, textAlign: TextAlign.center),
        ],
      ),
      onTap: () async {
        await cubit.changeLanguage(code);
        if (!context.mounted) return;
        MainApp.updateAppLocale(context, Locale(code));
        await _saveLanguageSelection();
        if (context.mounted) {
          Navigator.of(context).pop();
        }
      },
    );
  }

  Future<void> _saveLanguageSelection() async {
    await SharedPref.saveData(key: PrefKeys.languageFirstTime, value: true);
  }
}
