import 'package:flutter/material.dart';
import 'package:getme/core/extextions/extentions.dart';
import 'package:getme/core/style/color/color_light.dart';
import 'package:getme/core/style/widgets/app_space.dart';
import 'package:getme/core/style/widgets/custom_shimmer.dart';
import 'package:hugeicons/hugeicons.dart';

import '../statics/app_border_radius.dart';
import 'app_text.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    required this.onTap,
    this.text,
    this.btnColor = ColorsLight.white,
    this.backGroundColor = ColorsLight.black,
    this.borderColor = ColorsLight.black,
    this.isBorderd = false,
    this.fontSize = 16,
    this.isLoading = false,
    this.isCircle = false,
    this.boxShadow = false,
    this.isDisabled = false,
    this.icon,
    this.iconColor = ColorsLight.white,
    this.circleSize = 50,
    this.borderWidth = 1,
    super.key,
  });

  final String? text;
  final double fontSize;
  final void Function() onTap;
  final Color btnColor;
  final Color backGroundColor;
  final Color borderColor;
  final Color iconColor;
  final bool isBorderd;
  final bool isLoading;
  final bool isCircle;
  final bool isDisabled;
  final bool boxShadow;
  final IconData? icon;
  final double circleSize;
  final double borderWidth;

  @override
  Widget build(BuildContext context) {
    final textColor = isBorderd ? borderColor : btnColor;

    return InkWell(
      onTap: isDisabled ? null : onTap,
      borderRadius: _buttonBorderRadius,
      child: isLoading
          ? _buildLoadingShimmer(context, textColor)
          : _buildButtonContent(context, textColor),
    );
  }

  BorderRadius get _buttonBorderRadius => AppBorderRadius.mediumRadius;

  Widget _buildLoadingShimmer(BuildContext context, Color textColor) {
    return CustomShimmer(
      child: _buildButtonContent(context, textColor),
    );
  }

  Widget _buildButtonContent(BuildContext context, Color textColor) {
    return _buildButtonContainer(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (text != null) _buildText(context, textColor),
          if (icon != null) ...[
            if (text != null) AppSpace(isHorizontal: true, space: 8),
            _buildIcon(textColor),
          ],
        ],
      ),
    );
  }

  Widget _buildButtonContainer({required Widget child}) {
    return Container(
      width: isCircle ? circleSize : double.infinity,
      height: circleSize,
      decoration: _buttonDecoration(),
      child: child,
    );
  }

  Widget _buildText(BuildContext context, Color textColor) {
    return AppText(
      context.translate(text!),
      fontSize: fontSize,
      isUpperCase: true,
      color: textColor,
      isBold: true,
    );
  }

  HugeIcon _buildIcon(Color iconColor) {
    return HugeIcon(
      icon: icon!,
      color: iconColor,
      size: 20,
    );
  }

  BoxDecoration _buttonDecoration() {
    return BoxDecoration(
      borderRadius: isCircle ? null : _buttonBorderRadius,
      shape: isCircle ? BoxShape.circle : BoxShape.rectangle,
      color: _getButtonColor(),
      border:
          isBorderd ? Border.all(color: borderColor, width: borderWidth) : null,
      boxShadow: boxShadow
          ? [
              BoxShadow(
                color: ColorsLight.black.withValues(alpha: 0.5),
                blurRadius: 5,
                offset: const Offset(0, 2),
              ),
            ]
          : null,
    );
  }

  Color _getButtonColor() {
    if (isDisabled && !isLoading) return ColorsLight.gray;
    return isBorderd ? Colors.white : backGroundColor;
  }
}
