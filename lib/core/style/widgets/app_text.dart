import 'package:flutter/material.dart';
import 'package:getme/core/style/color/color_light.dart';
import 'package:getme/core/style/font/fonts_helper.dart';

class AppText extends StatelessWidget {
  const AppText(
    this.text, {
    super.key,
    this.isTitle = false,
    this.isUpperCase = false,
    this.isBold = false,
    this.isUnderline = false,
    this.isOverLine = false,
    this.isLineThrough = false,
    this.textAlign,
    this.maxLines = 1,
    this.color = ColorsLight.black,
    this.lineColor = ColorsLight.black,
    this.fontSize = 18,
  });
  final String text;
  final TextAlign? textAlign;
  final int maxLines;
  final Color? color;
  final Color? lineColor;
  final double fontSize;
  final bool isUpperCase;
  final bool isTitle;
  final bool isBold;
  final bool isUnderline;
  final bool isOverLine;
  final bool isLineThrough;

  @override
  Widget build(BuildContext context) {
    return Text(
      isUpperCase ? text.toUpperCase() : text,
      style: customTextStyle(
        context,
        color: color!,
        isBold: isBold,
        isLineThrough: isLineThrough,
        isOverLine: isOverLine,
        isTitle: isTitle,
        isUnderline: isUnderline,
        lineColor: lineColor,
        textAlign: textAlign,
      ),
      overflow: TextOverflow.ellipsis,
      textAlign: textAlign,
      maxLines: maxLines,
    );
  }
}

TextStyle customTextStyle(
  BuildContext context, {
  TextAlign? textAlign,
  Color color = ColorsLight.black,
  Color? lineColor,
  bool isTitle = false,
  bool isBold = false,
  bool isUnderline = false,
  bool isOverLine = false,
  bool isLineThrough = false,
}) {
  return TextStyle(
    fontFamily: FontsHelper.fontFamily,
    fontSize: isTitle
        ? Theme.of(context).textTheme.titleMedium!.fontSize
        : Theme.of(context).textTheme.bodyMedium!.fontSize,
    color: color,
    fontWeight:
        _isBoldText(isTitle || isBold) ? FontWeight.bold : FontWeight.normal,
    decoration: _textDecoration(
      isUnderline: isUnderline,
      isOverLine: isOverLine,
      isLineThrough: isLineThrough,
    ),
    decorationColor: lineColor,
    decorationStyle: TextDecorationStyle.solid,
  );
}

TextDecoration _textDecoration({
  bool? isUnderline,
  bool? isOverLine,
  bool? isLineThrough,
}) {
  if (isUnderline! == true) {
    return TextDecoration.underline;
  } else if (isOverLine! == true) {
    return TextDecoration.overline;
  } else if (isLineThrough! == true) {
    return TextDecoration.lineThrough;
  } else {
    return TextDecoration.none;
  }
}

bool _isBoldText(bool value) {
  return value;
}
