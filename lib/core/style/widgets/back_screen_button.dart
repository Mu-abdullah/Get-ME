import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

import '../color/color_light.dart';

class BackScreenButton extends StatelessWidget {
  const BackScreenButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pop(context),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: ColorsLight.black.withValues(alpha: 0.7),
          ),
          child: Icon(
            HugeIcons.strokeRoundedCancel01,
            color: ColorsLight.white,
            size: 25,
          ),
        ),
      ),
    );
  }
}
