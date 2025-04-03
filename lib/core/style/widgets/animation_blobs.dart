import 'package:blobs/blobs.dart';
import 'package:flutter/material.dart';

class AnimatedBlob extends StatelessWidget {
  final bool isVisible;

  final BlobStyles? styles;
  final double? rightPosition;
  final double? topPosition;
  final double? leftPosition;
  final double? bottomPosition;
  final double size;
  final String? id;
  final Widget? child;
  const AnimatedBlob({
    super.key,
    required this.isVisible,
    this.styles,
    this.size = 200,
    this.rightPosition,
    this.topPosition,
    this.leftPosition,
    this.bottomPosition,
    this.id = "6-6-51",
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: const Duration(seconds: 1),
      curve: Curves.easeInOutCirc,
      right: isVisible ? rightPosition : -500,
      top: isVisible ? topPosition : -500,
      left: isVisible ? leftPosition : -500,
      bottom: isVisible ? bottomPosition : -500,
      child: child ??
          Blob.fromID(
            id: ['$id'],
            size: size,
            styles: styles,
          ),
    );
  }
}
