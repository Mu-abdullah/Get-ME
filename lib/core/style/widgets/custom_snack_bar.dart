import 'package:flutter/material.dart';
import 'package:getme/core/style/widgets/app_text.dart';
import 'package:hugeicons/hugeicons.dart';

class CustomSnackbar {
 static void showTopSnackBar(
    BuildContext context, {
    required String message,
    Duration duration = const Duration(seconds: 2),
    Color backgroundColor = Colors.green,
    Color textColor = Colors.white,
  }) {
    final overlay = Overlay.of(context);
    final entry = OverlayEntry(
      builder: (context) => Positioned(
        top: MediaQuery.of(context).padding.top + 10,
        left: 20,
        right: 20,
        child: Material(
          color: Colors.transparent,
          child: Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10,
                ),
              ],
            ),
            child: Row(
              spacing: 10,
              children: [
                Expanded(
                  child: AppText(
                    message,
                    color: textColor,
                  ),
                ),
                Icon(HugeIcons.strokeRoundedCheckmarkCircle01,
                    color: textColor),
              ],
            ),
          ),
        ),
      ),
    );

    overlay.insert(entry);
    Future.delayed(const Duration(seconds: 2), () => entry.remove());
  }
}
