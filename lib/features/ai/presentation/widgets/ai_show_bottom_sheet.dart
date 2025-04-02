import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getme/core/extextions/extentions.dart';
import 'package:getme/core/language/lang_keys.dart';
import 'package:getme/core/style/widgets/app_button.dart';
import 'package:getme/core/style/widgets/app_text.dart';

import '../../../../core/style/color/app_color.dart';
import '../../../../core/style/font/fonts_helper.dart';
import '../../../../core/style/statics/app_statics.dart';
import '../../../../core/style/statics/strings_static.dart';
import '../../../../core/style/widgets/app_animated_text.dart';
import '../../../../core/style/widgets/app_space.dart';
import '../cubits/ai_btm_shet_cubit/ai_btm_shet_cubit.dart';

class AIBottomSheet extends StatelessWidget {
  const AIBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var isArabic = FontsHelper.isArabic(context);
    return BlocProvider(
      create: (context) => AiBtmShetCubit(context),
      child: BlocBuilder<AiBtmShetCubit, AiBtmShetState>(
        builder: (context, state) {
          var cubit = AiBtmShetCubit.get(context);
          return Padding(
            padding: EdgeInsets.only(
              left: 8,
              right: 8,
              top: 8,
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const AppSpace(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: AppBorderRadius.mediumRadius,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: AnimatedTextWidget(
                          text: isArabic
                              ? StringsStatic.arAiIntro
                              : StringsStatic.enAiIntro,
                          duration: const Duration(milliseconds: 75),
                          fontSize: context.bodyMedium!.fontSize!,
                        ),
                      ),
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    spacing: 10,
                    children: [
                      Checkbox(
                        checkColor: AppColors.white,
                        activeColor: AppColors.black,
                        shape: CircleBorder(
                          side: BorderSide(
                            color: AppColors.black,
                            width: 1.5,
                          ),
                        ),
                        value: cubit.showAgain,
                        onChanged: (value) {
                          cubit.saveShowAgainValue();
                          cubit.toggleButton();
                        },
                      ),
                      Expanded(
                        child: AppText(
                          context.translate(
                            LangKeys.dontShowAnymore,
                          ),
                        ),
                      )
                    ],
                  ),
                  AppButton(
                    onTap: () {
                      cubit.saveShowAgainValue();
                      Navigator.pop(context);
                    },
                    text: LangKeys.done,
                  ),
                  const AppSpace(space: 16),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
