import 'package:flutter/material.dart';
import 'package:getme/core/extextions/extentions.dart';
import 'package:getme/core/style/widgets/app_text.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.translatedTitle,
    this.title = '',
    this.isBack = true,
    this.actions,
    this.backgroundColor = Colors.white,
  });
  final String? translatedTitle;
  final String title;
  final bool isBack;
  final List<Widget>? actions;
  final Color backgroundColor;
  @override
  Widget build(BuildContext context) {
    var dispalayTitle =
        translatedTitle != null ? context.translate(translatedTitle!) : title;
    return AppBar(
      leading: isBack
          ? Icon(
              Icons.arrow_back_ios_new_outlined,
              color: Colors.black,
            )
          : null,
      title: AppText(dispalayTitle, isTitle: true),
      actions: actions,
      backgroundColor: backgroundColor,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(56);
}
