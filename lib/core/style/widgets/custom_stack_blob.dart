import 'package:blobs/blobs.dart';
import 'package:flutter/material.dart';

class StackBlob extends StatelessWidget {
  const StackBlob({
    super.key,
    required this.id,
    required this.color,
    required this.fillType,
    this.size = 400,
    this.top,
    this.left,
    this.right,
    this.bottom,
  });
  final List<String> id;
  final Color color;
  final BlobFillType fillType;
  final double size;
  final double? top;
  final double? left;
  final double? right;
  final double? bottom;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: bottom,
      right: right,
      top: top,
      left: left,
      child: Blob.fromID(
        id: id,
        size: size,
        styles: BlobStyles(
          color: color,
          fillType: fillType,
        ),
      ),
    );
  }
}
