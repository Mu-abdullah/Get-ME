import 'package:flutter/material.dart';

import '../../../../core/style/color/color_light.dart';
import '../../../../core/style/widgets/app_text.dart';

class BloggerSliverAppBar extends StatelessWidget {
  const BloggerSliverAppBar({
    super.key,
    required this.imageUrl,
    required this.name,
  });
  final String imageUrl;
  final String name;
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 300,
      floating: true,
      pinned: true,
      leading: Icon(
        Icons.arrow_back_ios_new_outlined,
        color: ColorsLight.white,
      ),
      backgroundColor: ColorsLight.black,
      flexibleSpace: FlexibleSpaceBar(
        title: AppText(
          name,
          color: ColorsLight.white,
        ),
        background: Image.network(
          imageUrl,
          fit: BoxFit.cover,
          colorBlendMode: BlendMode.colorBurn,
          color: Colors.black.withValues(alpha: 0.5),
        ),
        centerTitle: true,
        collapseMode: CollapseMode.pin,
        expandedTitleScale: 1.5,
        titlePadding: const EdgeInsets.all(16.0),
        stretchModes: [StretchMode.zoomBackground],
      ),
    );
  }
}
