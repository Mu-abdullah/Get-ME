import 'package:flutter/material.dart';

class ButtonsEntity {
  final String? title;
  final Color? backgroundColor;
  final IconData? icon;
  final Color? iconColor;
  final Function()? onTap;

  ButtonsEntity({
    this.title,
    this.icon,
    this.backgroundColor,
    this.iconColor,
    this.onTap,
  });
}
