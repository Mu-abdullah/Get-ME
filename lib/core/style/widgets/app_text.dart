import 'package:flutter/material.dart';
import 'package:getme/core/style/font/fonts_helper.dart';

class AppText extends StatelessWidget {
  const AppText(
    this.text, {
    super.key,
    this.isTitle = false,
    this.isBold = false,
    this.softWrap = true,
    this.color,
    this.maxLines = 1,
    this.textAlign = TextAlign.start,
    this.textOverflow = TextOverflow.ellipsis,
  });
  final String text;
  final bool isTitle;
  final bool isBold;
  final bool softWrap;
  final Color? color;
  final int maxLines;
  final TextAlign textAlign;
  final TextOverflow textOverflow;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: isTitle
            ? Theme.of(context).textTheme.titleLarge!.fontSize
            : Theme.of(context).textTheme.bodyLarge!.fontSize,
        color: color,
        fontFamily: FontsHelper.fontFamily,
        fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
      ),
      overflow: textOverflow,
      maxLines: maxLines,
      textAlign: textAlign,
      softWrap: softWrap,
    );
  }
}
