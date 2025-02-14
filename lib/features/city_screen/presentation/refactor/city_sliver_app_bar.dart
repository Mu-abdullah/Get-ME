import 'package:flutter/material.dart';
import 'package:getme/core/extextions/extentions.dart';
import 'package:getme/core/routes/routes_name.dart';

import '../../../../core/style/color/color_light.dart';
import '../../../../core/style/widgets/app_text.dart';

class CitySliverAppBar extends StatelessWidget {
  const CitySliverAppBar({
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
      leading: InkWell(
        onTap: () => Navigator.pop(context),
        child: Icon(
          Icons.arrow_back_ios_new_outlined,
          color: ColorsLight.white,
        ),
      ),
      backgroundColor: ColorsLight.black,
      flexibleSpace: FlexibleSpaceBar(
        title: AppText(
          name,
          color: ColorsLight.white,
        ),
        background: InkWell(
          onTap: () => context.pushNamed(RoutesNames.imagePreview,
              arguments: {'imageUrl': imageUrl, 'title': name}),
          child: Image.network(
            imageUrl,
            fit: BoxFit.cover,
            colorBlendMode: BlendMode.colorBurn,
            color: Colors.black.withValues(alpha: 0.5),
          ),
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
