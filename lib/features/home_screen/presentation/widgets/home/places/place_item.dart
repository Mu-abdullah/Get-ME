import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:getme/core/style/color/color_light.dart';
import 'package:getme/core/style/statics/app_statics.dart';
import 'package:getme/core/style/widgets/app_text.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../../data/model/get_place_image_model.dart';
import '../../../../data/model/places_model.dart';

class PlaceCard extends StatelessWidget {
  final PlacesModel place;
  final List<GetPlaceImageModel> images;

  const PlaceCard({super.key, required this.place, required this.images});

  @override
  Widget build(BuildContext context) {
    PageController pageController = PageController();
    return Container(
      width: 250,
      margin: AppPadding.smallPadding,
      decoration: BoxDecoration(
        borderRadius: AppBorderRadius.mediumRadius,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.2),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: AppBorderRadius.mediumRadius,
        child: Stack(
          children: [
            // Image Layer with PageView
            if (images.isNotEmpty)
              Positioned.fill(
                child: PageView.builder(
                  controller: pageController,
                  itemCount: images.length,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(images[index].url!),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Stack(
                        children: [
                          _buildGradientOverlay(),
                          _buildBlurEffect(),
                        ],
                      ),
                    );
                  },
                ),
              ),
            // Text Information
            Positioned(
              bottom: 40,
              left: 10,
              right: 10,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    place.name!,
                    color: ColorsLight.white,
                    isTitle: true,
                  ),
                  AppText(
                    place.description!,
                    color: ColorsLight.white,
                    isTitle: false,
                  ),
                ],
              ),
            ),
            // Page Indicator
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SmoothPageIndicator(
                  controller: pageController,
                  count: images.length,
                  effect: const ExpandingDotsEffect(
                    activeDotColor: Colors.blueAccent,
                    dotColor: ColorsLight.white,
                    dotHeight: 8,
                    dotWidth: 8,
                    spacing: 4,
                  ),
                ),
              ),
            ),
            // Favorite Button
            Positioned(
              top: 10,
              right: 10,
              child: IconButton(
                icon: const Icon(
                  Icons.favorite_border,
                  color: Colors.white,
                ),
                onPressed: () {
                  // Add favorite action logic here
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGradientOverlay() {
    return Positioned.fill(
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.center,
            colors: [
              Colors.black,
              Colors.transparent,
            ],
            stops: [0, 1],
          ),
        ),
      ),
    );
  }

  Widget _buildBlurEffect() {
    return Positioned.fill(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
        child: Container(
          color: Colors.transparent,
        ),
      ),
    );
  }
}
