import 'package:flutter/material.dart';
import 'package:getme/core/extextions/extentions.dart';
import 'package:getme/core/style/widgets/app_button.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../../core/language/lang_keys.dart';
import '../../../../core/style/color/app_color.dart';
import '../../../../core/style/widgets/app_text.dart';

class DeleteAccountBottomSheet extends StatelessWidget {
  const DeleteAccountBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        bottom: MediaQuery.of(context).viewInsets.bottom + 16,
        top: 16,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          spacing: 20,
          children: [
            HugeIcon(
              icon: HugeIcons.strokeRoundedCrying,
              color: AppColors.blueGrey,
              size: 50,
            ),
            AppText(
              context.translate(LangKeys.doYouWantToDeleteAccount),
              isTitle: true,
            ),
            Row(
              children: [
                Expanded(
                  child: AppButton(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    text: LangKeys.cancel,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: AppButton(
                    onTap: () {},
                    borderColor: AppColors.blueGrey,
                    text: LangKeys.deleteAccount,
                    isBorderd: true,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
