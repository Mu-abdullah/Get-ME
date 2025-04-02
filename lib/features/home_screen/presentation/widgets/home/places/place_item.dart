import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getme/core/extextions/extentions.dart';
import 'package:getme/core/style/widgets/custom_shimmer.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../../../../core/app/language/language_cubit/language_cubit.dart';
import '../../../../../../core/routes/routes_name.dart';
import '../../../../../../core/services/translate_services.dart';
import '../../../../../../core/style/color/app_color.dart';
import '../../../../../../core/style/statics/app_statics.dart';
import '../../../../../../core/style/widgets/app_text.dart';
import '../../../../data/model/get_place_image_model.dart';
import '../../../../data/model/places_model.dart';

class PlaceCard extends StatefulWidget {
  final PlacesModel place;
  final List<GetPlaceImageModel> images;
  final bool needMargin;
  final String sourceLanguage; // Add source language parameter

  const PlaceCard({
    super.key,
    required this.place,
    required this.images,
    this.needMargin = true,
    this.sourceLanguage = 'auto', // Default to auto-detect
  });

  @override
  State<PlaceCard> createState() => _PlaceCardState();
}

class _PlaceCardState extends State<PlaceCard> {
  String _translatedName = '';
  String _translatedGovernorate = '';
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _translateContent();
  }

  Future<void> _translateContent() async {
    final currentLanguage = context.read<LanguageCubit>().state;

    if (widget.sourceLanguage != currentLanguage) {
      try {
        final translatedName = await TranslationService.translateText(
          widget.place.name!,
          currentLanguage,
          sourceLanguage: widget.sourceLanguage,
        );
        final translatedGovernorate = await TranslationService.translateText(
          widget.place.governorateNameAr,
          currentLanguage,
          sourceLanguage: widget.sourceLanguage,
        );

        if (mounted) {
          setState(() {
            _translatedName = translatedName;
            _translatedGovernorate = translatedGovernorate;
            _isLoading = false;
          });
        }
      } catch (e) {
        // Fallback to original text if translation fails
        setState(() {
          _translatedName = widget.place.name!;
          _translatedGovernorate = widget.place.governorateNameAr;
          _isLoading = false;
        });
      }
    } else {
      setState(() {
        _translatedName = widget.place.name!;
        _translatedGovernorate = widget.place.governorateNameAr;
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return CustomShimmer(
        child: Container(
          width: 250,
          height: 300,
          margin: AppPadding.smallPadding,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: AppBorderRadius.mediumRadius,
          ),
        ),
      );
    }

    PageController pageController = PageController();

    return Container(
      width: 250,
      margin: widget.needMargin ? AppPadding.smallPadding : null,
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
              'images': widget.images,
              'place': widget.place,
            },
          );
        },
        borderRadius: AppBorderRadius.mediumRadius,
        child: ClipRRect(
          borderRadius: AppBorderRadius.mediumRadius,
          child: Stack(
            children: [
              if (widget.images.isNotEmpty)
                Positioned.fill(
                  child: PageView.builder(
                    controller: pageController,
                    itemCount: widget.images.length,
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(widget.images[index].url!),
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              _buildInfoSection(pageController),
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
                top: Radius.circular(15),
                bottom: Radius.circular(15),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                AppText(
                  _translatedName,
                  color: AppColors.white,
                  isTitle: true,
                ),
                AppText(
                  _translatedGovernorate,
                  color: AppColors.white,
                  isTitle: false,
                ),
                const SizedBox(height: 8),
                Center(
                  child: SmoothPageIndicator(
                    controller: pageController,
                    count: widget.images.length,
                    effect: ExpandingDotsEffect(
                      activeDotColor: Colors.white,
                      dotColor: Colors.white.withValues(alpha: 0.5),
                      dotHeight: 8,
                      dotWidth: 8,
                      spacing: 8,
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
