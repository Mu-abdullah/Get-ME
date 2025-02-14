import 'dart:io';

import 'package:flutter/material.dart';

import 'empty_state.dart';
import 'image_card.dart';

class ImageGrid extends StatelessWidget {
  final List<File?> images;

  const ImageGrid({super.key, required this.images});

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      child: images.isEmpty
          ? const EmptyState()
          : GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.8,
              ),
              itemCount: images.length,
              itemBuilder: (context, index) =>
                  ImageCard(image: images[index]!, index: index),
            ),
    );
  }
}
