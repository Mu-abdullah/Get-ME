import 'package:flutter/material.dart';
import 'package:getme/core/style/widgets/app_text.dart';

class SocialIcon extends StatelessWidget {
  const SocialIcon({
    super.key,
    required this.icon,
    required this.count,
  });
  final IconData icon;
  final String count;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        spacing: 20,
        children: [
          Icon(icon, size: 40),
          AppText(count),
        ],
      ),
    );
  }
}
