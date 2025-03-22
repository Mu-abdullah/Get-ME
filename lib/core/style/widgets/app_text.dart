import 'package:flutter/material.dart';
import 'package:getme/core/extextions/extentions.dart';
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
    this.textAlign = TextAlign.justify,
    this.maxLines = 1,
    this.color = ColorsLight.black,
    this.lineColor = ColorsLight.black,
    this.height = 1.5,
    this.fontSize,
    this.fontWeight,
    this.fontFamily,
  });

  final String text;
  final TextAlign? textAlign;
  final int maxLines;
  final Color? color;
  final Color? lineColor;
  final double height;
  final bool isUpperCase;
  final bool isTitle;
  final bool isBold;
  final bool isUnderline;
  final bool isOverLine;
  final bool isLineThrough;
  final double? fontSize;
  final FontWeight? fontWeight;
  final String? fontFamily;

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
        height: height,
        fontSize: fontSize,
        fontWeight: fontWeight,
        fontFamily: fontFamily,
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
  double height = 1.5,
  double? fontSize,
  FontWeight? fontWeight,
  String? fontFamily,
}) {
  return TextStyle(
    fontFamily: fontFamily ?? FontsHelper.fontFamily,
    fontSize: fontSize ??
        (isTitle ? context.titleLarge?.fontSize : context.bodySmall?.fontSize),
    color: color,
    fontWeight: fontWeight ?? (isBold ? FontWeight.bold : FontWeight.normal),
    decoration: _textDecoration(
      isUnderline: isUnderline,
      isOverLine: isOverLine,
      isLineThrough: isLineThrough,
    ),
    height: height,
    decorationColor: lineColor,
    decorationStyle: TextDecorationStyle.solid,
  );
}

TextDecoration _textDecoration({
  bool isUnderline = false,
  bool isOverLine = false,
  bool isLineThrough = false,
}) {
  if (isUnderline) {
    return TextDecoration.underline;
  } else if (isOverLine) {
    return TextDecoration.overline;
  } else if (isLineThrough) {
    return TextDecoration.lineThrough;
  } else {
    return TextDecoration.none;
  }
}
