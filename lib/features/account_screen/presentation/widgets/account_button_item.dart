import 'package:flutter/material.dart';
import 'package:getme/core/extextions/extentions.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../../core/style/color/app_color.dart';
import '../../../../core/style/statics/app_statics.dart';
import '../../../../core/style/widgets/app_text.dart';
import '../../data/model/account_button_model.dart';

class AccountButtonItem extends StatelessWidget {
  const AccountButtonItem({
    super.key,
    required this.item,
  });
  final AccountButtonModel item;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPadding.smallPadding,
      child: InkWell(
        onTap: item.onTap,
        borderRadius: AppBorderRadius.mediumRadius,
        child: Container(
          height: Statics.buttonsHeight,
          decoration: BoxDecoration(
            borderRadius: AppBorderRadius.mediumRadius,
            color: AppColors.white,
          ),
          child: Row(
            spacing: 20,
            children: [
              SizedBox(),
              HugeIcon(
                icon: item.icon!,
                color: item.iconColor ?? AppColors.black,
                size: 20,
              ),
              Expanded(
                child: AppText(
                  context.translate(item.title!),
                  isBold: true,
                  color: item.titleColor ?? AppColors.black,
                  fontSize: context.bodyLarge!.fontSize,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
