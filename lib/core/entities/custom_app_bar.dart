import 'package:flutter/material.dart';
import 'package:getme/core/style/widgets/app_text.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar(
    this.title, {
    super.key,
    this.isBack = true,
    this.actions,
    this.backgroundColor = Colors.white,
  });

  final String title;
  final bool isBack;
  final List<Widget>? actions;
  final Color backgroundColor;
  @override
  Widget build(BuildContext context) {
    title;
    return AppBar(
      automaticallyImplyLeading: isBack,
      leading: isBack
          ? Icon(
              Icons.arrow_back_ios_new_outlined,
              color: Colors.black,
            )
          : null,
      title: AppText(title, isTitle: true),
      actions: actions,
      backgroundColor: backgroundColor,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(56);
}
