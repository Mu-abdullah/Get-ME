import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:getme/core/extextions/extentions.dart';
import 'package:getme/core/style/color/color_light.dart';
import 'package:getme/core/style/statics/app_statics.dart';
import 'package:getme/core/style/widgets/app_text.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../../../../core/routes/routes_name.dart';
import '../../../../data/model/get_place_image_model.dart';
import '../../../../data/model/places_model.dart';

class PlaceCard extends StatelessWidget {
  final PlacesModel place;
  final List<GetPlaceImageModel> images;
  final bool needMargin;

  const PlaceCard({
    super.key,
    required this.place,
    required this.images,
    this.needMargin = true,
  });

  @override
  Widget build(BuildContext context) {
    PageController pageController = PageController();

    return Container(
      width: 250,
      margin: needMargin ? AppPadding.smallPadding : null,
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
      child: InkWell(
        onTap: () {
          context.pushNamed(
            RoutesNames.placeScreen,
            arguments: {
              'images': images,
              'place': place,
            },
          );
        },
        borderRadius: AppBorderRadius.mediumRadius,
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
                      );
                    },
                  ),
                ),
              // Information Section with Frosted Glass Effect
              _buildInfoSection(pageController),
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
      ),
    );
  }

  Widget _buildInfoSection(PageController pageController) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.black.withValues(alpha: 0.3),
              borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(15), bottom: Radius.circular(15)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                AppText(
                  place.name!,
                  color: ColorsLight.white,
                  isTitle: true,
                ),
                AppText(
                  place.governorateNameAr,
                  color: ColorsLight.white,
                  isTitle: false,
                ),
                const SizedBox(height: 8),
                Center(
                  child: SmoothPageIndicator(
                    controller: pageController,
                    count: images.length,
                    effect: ExpandingDotsEffect(
                      activeDotColor: Colors.white,
                      dotColor: Colors.white.withValues(alpha: 0.5),
                      dotHeight: 8,
                      dotWidth: 8,
                      spacing: 4,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
