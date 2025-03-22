import 'package:flutter/material.dart';
import 'package:getme/core/extextions/extentions.dart';

import '../../../../core/language/lang_keys.dart';
import '../../../../core/style/color/color_light.dart';
import '../../../../core/style/statics/app_statics.dart';
import '../../../../core/style/widgets/app_text.dart';
import '../../../home_screen/data/model/get_place_image_model.dart';
import '../../../home_screen/data/model/places_model.dart';
import '../widgets/place_sliver_app_bar.dart';

class PlaceScreenBody extends StatelessWidget {
  const PlaceScreenBody({
    super.key,
    required this.place,
    required this.images,
  });

  final PlacesModel place;
  final List<GetPlaceImageModel> images;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        PlaceSliverAppBar(
          place: place,
          images: images,
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: AppPadding.mediumPadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              spacing: 10,
              children: [
                AppText(
                  place.description!,
                  maxLines: 10,
                  fontSize: context.labelLarge!.fontSize,
                ),
                InkWell(
                  onTap: () => context.openUrl(url: place.location!),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      AppText(
                        "${context.translate(LangKeys.go)} ${place.name}",
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
