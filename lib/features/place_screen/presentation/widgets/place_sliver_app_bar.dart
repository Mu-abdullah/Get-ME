import 'package:flutter/material.dart';
import 'package:getme/core/extextions/extentions.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../core/routes/routes_name.dart';
import '../../../../core/style/color/app_color.dart';
import '../../../../core/style/widgets/app_text.dart';
import '../../../../core/style/widgets/back_screen_button.dart';
import '../../../home_screen/data/model/get_place_image_model.dart';

class PlaceSliverAppBar extends StatelessWidget {
  const PlaceSliverAppBar({
    super.key,
    required this.placeName,
    required this.images,
  });

  final String placeName;
  final List<GetPlaceImageModel> images;

  @override
  Widget build(BuildContext context) {
    PageController pageController = PageController();
    return SliverAppBar(
      expandedHeight: 500,
      floating: true,
      pinned: true,
      leading: BackScreenButton(),
      backgroundColor: AppColors.black,
      flexibleSpace: FlexibleSpaceBar(
        title: AppText(
          placeName,
          color: AppColors.white,
        ),
        background: InkWell(
          onTap: () {
            context.pushNamed(RoutesNames.imagePreview, arguments: {
              'imagesList':
                  images.map((e) => e.url).whereType<String>().toList(),
              'title': placeName,
            });
          },
          child: Stack(
            children: [
              PageView.builder(
                itemCount: images.length,
                controller: pageController,
                itemBuilder: (context, index) {
                  return Image.network(
                    images[index].url!,
                    fit: BoxFit.cover,
                  );
                },
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SmoothPageIndicator(
                    controller: pageController,
                    count: images.length,
                    effect: const ExpandingDotsEffect(
                      activeDotColor: Colors.blueAccent,
                      dotColor: AppColors.white,
                      dotHeight: 8,
                      dotWidth: 8,
                      spacing: 4,
                    ),
                  ),
                ),
              ),
            ],
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
