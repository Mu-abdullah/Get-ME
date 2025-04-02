import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getme/core/extextions/extentions.dart';

import '../../../../core/app/language/language_cubit/language_cubit.dart';
import '../../../../core/language/lang_keys.dart';
import '../../../../core/services/translate_services.dart';
import '../../../../core/style/color/app_color.dart';
import '../../../../core/style/statics/app_statics.dart';
import '../../../../core/style/widgets/app_text.dart';
import '../../../../core/style/widgets/custom_shimmer.dart';
import '../../../home_screen/data/model/get_place_image_model.dart';
import '../../../home_screen/data/model/places_model.dart';
import '../widgets/place_sliver_app_bar.dart';

class PlaceScreenBody extends StatefulWidget {
  final PlacesModel place;
  final List<GetPlaceImageModel> images;
  final String sourceLanguage; // Add source language of the content

  const PlaceScreenBody({
    super.key,
    required this.place,
    required this.images,
    this.sourceLanguage = 'auto', // Default to auto-detect
  });

  @override
  State<PlaceScreenBody> createState() => _PlaceScreenBodyState();
}

class _PlaceScreenBodyState extends State<PlaceScreenBody> {
  String _translatedName = '';
  String _translatedDescription = '';
  bool _isLoading = true;
  bool _isTranslated = false;

  @override
  void initState() {
    super.initState();
    _translateContent();
  }

  Future<void> _translateContent() async {
    final currentLanguage = context.read<LanguageCubit>().state;

    // Only translate if the app language differs from source language
    if (widget.sourceLanguage != currentLanguage) {
      final translated = await TranslationService.translatePlace(
        name: widget.place.name!,
        description: widget.place.description!,
        targetLanguage: currentLanguage,
        sourceLanguage: widget.sourceLanguage,
      );

      if (mounted) {
        setState(() {
          _translatedName = translated['name']!;
          _translatedDescription = translated['description']!;
          _isLoading = false;
          _isTranslated = true;
        });
      }
    } else {
      setState(() {
        _translatedName = widget.place.name!;
        _translatedDescription = widget.place.description!;
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return CustomShimmer(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            spacing: 10,
            children: [
              Container(
                height: 500,
                width: double.infinity,
                color: AppColors.black.withValues(alpha: 0.5),
              ),
              Container(
                height: 50,
                width: double.infinity,
                color: AppColors.black.withValues(alpha: 0.5),
              ),
              Expanded(
                child: Container(
                  height: 50,
                  width: double.infinity,
                  color: AppColors.black.withValues(alpha: 0.5),
                ),
              ),
            ],
          ),
        ),
      );
    }

    return CustomScrollView(
      slivers: [
        PlaceSliverAppBar(
          placeName: _translatedName,
          images: widget.images,
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: AppPadding.mediumPadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              spacing: 10,
              children: [
                AppText(
                  _translatedDescription,
                  maxLines: 10,
                  fontSize: context.labelLarge!.fontSize,
                ),
                !_isTranslated
                    ? Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 6, vertical: 2),
                          decoration: BoxDecoration(
                            color: Colors.grey.withValues(alpha: 0.2),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: AppText(
                            context.translate(LangKeys.translatedByGoogle),
                            color: Colors.grey,
                          ),
                        ),
                      )
                    : SizedBox(),
                InkWell(
                  onTap: () => context.openUrl(url: widget.place.location!),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      AppText(
                        "${context.translate(LangKeys.go)} $_translatedName",
                        isUnderline: true,
                        fontSize: context.labelLarge!.fontSize,
                        color: AppColors.blueAccent,
                        lineColor: AppColors.blueAccent,
                      ),
                      Icon(
                        Icons.location_on,
                        color: AppColors.blueAccent,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
