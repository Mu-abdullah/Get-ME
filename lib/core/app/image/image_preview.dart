import 'package:flutter/material.dart';

import '../../style/widgets/custom_app_bar.dart';

class PreviewImage extends StatelessWidget {
  const PreviewImage({
    required this.imageUrl,
    super.key,
    this.title,
  });

  final String imageUrl;
  final String? title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: title ?? '',
      ),
      body: Center(
        child: InteractiveViewer(
          panEnabled: false,
          boundaryMargin: const EdgeInsets.all(20),
          maxScale: 4,
          child: Hero(
            tag: 'imageHero',
            child: Image.network(
              imageUrl,
              fit: BoxFit.contain,
              height: MediaQuery.of(context).size.height,
            ),
          ),
        ),
      ),
    );
  }
}
