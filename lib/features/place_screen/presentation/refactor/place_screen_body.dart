import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getme/core/extextions/extentions.dart';

import '../../../../core/app/language/language_cubit/language_cubit.dart';
import '../../../../core/language/lang_keys.dart';
import '../../../../core/services/translate_services.dart';
import '../../../../core/style/color/color_light.dart';
import '../../../../core/style/statics/app_statics.dart';
import '../../../../core/style/widgets/app_text.dart';
import '../../../../core/style/widgets/custom_shimmer.dart';
import '../../../home_screen/data/model/get_place_image_model.dart';
import '../../../home_screen/data/model/places_model.dart';
import '../widgets/place_sliver_app_bar.dart';

class PlaceScreenBody extends StatefulWidget {
  final PlacesModel place;
  final List<GetPlaceImageModel> images;
  final String sourceLanguage;

  const PlaceScreenBody({
    super.key,
    required this.place,
    required this.images,
    this.sourceLanguage = 'auto',
  });

  @override
  State<PlaceScreenBody> createState() => _PlaceScreenBodyState();
}

class _PlaceScreenBodyState extends State<PlaceScreenBody> {
  String _translatedName = '';
  String _translatedDescription = '';
  String _originalName = '';
  String _originalDescription = '';
  bool _isLoading = true;
  bool _isTranslated = false;
  bool _needsTranslation = false;

  @override
  void initState() {
    super.initState();
    _translateContent();
  }

  Future<void> _translateContent() async {
    final currentLanguage = context.read<LanguageCubit>().state;
    _originalName = widget.place.name!;
    _originalDescription = widget.place.description!;

    // Always attempt translation if source is 'auto' or different from current
    final attemptTranslate = widget.sourceLanguage == 'auto' ||
        widget.sourceLanguage != currentLanguage;

    if (attemptTranslate) {
      try {
        final translated = await TranslationService.translatePlace(
          name: widget.place.name!,
          description: widget.place.description!,
          targetLanguage: currentLanguage,
          sourceLanguage: widget.sourceLanguage,
        );

        // Extract detected source language from translation result
        final detectedSource =
            translated['detectedSourceLanguage'] ?? widget.sourceLanguage;
        final actuallyNeedsTranslation = detectedSource != currentLanguage;

        if (mounted) {
          setState(() {
            _translatedName = translated['name']!;
            _translatedDescription = translated['description']!;
            _isTranslated = actuallyNeedsTranslation;
            _needsTranslation = actuallyNeedsTranslation;
            _isLoading = false;
          });
        }
      } catch (e) {
        setState(() {
          _translatedName = _originalName;
          _translatedDescription = _originalDescription;
          _isTranslated = false;
          _needsTranslation = false;
          _isLoading = false;
        });
      }
    } else {
      // No translation needed
      setState(() {
        _translatedName = _originalName;
        _translatedDescription = _originalDescription;
        _isTranslated = false;
        _needsTranslation = false;
        _isLoading = false;
      });
    }
  }

  void _toggleTranslation() {
    setState(() {
      _isTranslated = !_isTranslated;
    });
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
                color: ColorsLight.black.withValues(alpha: 0.5),
              ),
              Container(
                height: 50,
                width: double.infinity,
                color: ColorsLight.black.withValues(alpha: 0.5),
              ),
              Expanded(
                child: Container(
                  height: 50,
                  width: double.infinity,
                  color: ColorsLight.black.withValues(alpha: 0.5),
                ),
              ),
            ],
          ),
        ),
      );
    }

    final displayName = _isTranslated ? _translatedName : _originalName;
    final displayDescription =
        _isTranslated ? _translatedDescription : _originalDescription;

    return CustomScrollView(
      slivers: [
        PlaceSliverAppBar(
          placeName: displayName,
          images: widget.images,
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: AppPadding.mediumPadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              spacing: 10,
              children: [
                Row(
                  spacing: 10,
                  children: [
                    Expanded(
                      child: AppText(
                        displayDescription,
                        maxLines: 10,
                        fontSize: context.labelLarge!.fontSize,
                      ),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    if (_needsTranslation && _isTranslated)
                      Padding(
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
                      ),
                    if (_needsTranslation)
                      TextButton(
                        onPressed: _toggleTranslation,
                        child: AppText(
                          _isTranslated
                              ? context.translate(LangKeys.showOriginal)
                              : context.translate(LangKeys.translated),
                        ),
                      ),
                  ],
                ),
                InkWell(
                  onTap: () => context.openUrl(url: widget.place.location!),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      AppText(
                        "${context.translate(LangKeys.go)} $displayName",
                        isUnderline: true,
                        fontSize: context.labelLarge!.fontSize,
                        color: ColorsLight.blueAccent,
                        lineColor: ColorsLight.blueAccent,
                      ),
                      Icon(
                        Icons.location_on,
                        color: ColorsLight.blueAccent,
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
